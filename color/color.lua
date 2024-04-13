local config = require("color.config")
config.initialize()

local M = {}
local normalize_color = function(v)
	return v / 255
end

---@param str string Hex color, with or without the #.
---@return vector4
function M.from_hex(str)
	assert(type(str) == "string", "Hex color is not string")
	str = str:gsub("#", "")
	if str:len() == 3 then
		return vmath.vector4(
			(tonumber("0x" .. str:sub(1, 1)) * 17) / 255,
			(tonumber("0x" .. str:sub(2, 2)) * 17) / 255,
			(tonumber("0x" .. str:sub(3, 3)) * 17) / 255,
			1
		)
	else
		return vmath.vector4(
			tonumber("0x" .. str:sub(1, 2)) / 255,
			tonumber("0x" .. str:sub(3, 4)) / 255,
			tonumber("0x" .. str:sub(5, 6)) / 255,
			1
		)
	end
end

---Convert a Vector4 to Hex string.
---@param color vector4
---@return string Hex color with the # prefix.
function M.to_hex(color)
	return string.format("#%02x%02x%02x", color.x * 255.0, color.y * 255.0, color.z * 255.0)
end

---Convert a Table to Vector4.
---@param tbl table Table with 4 entries. Colors should be from 0 to 1.
---@return vector4
function M.from_table(tbl)
	return M.from_rgba(tbl[1], tbl[2], tbl[3], tbl[4])
end

---Convert a Table to Vector4.
---@param tbl table Table with 4 entries. Colors should be from 0 to 255.
---@return vector4
function M.from_table_255(tbl)
	return M.from_rgba_255(tbl[1], tbl[2], tbl[3], tbl[4])
end

---Convert a rgba part to Vector4.
---@param r number Red colors channel in a 0 to 1 format.
---@param g number Green colors channel in a 0 to 1 format.
---@param b number Blue colors channel in a 0 to 1 format.
---@param a number Alpha colors channel in a 0 to 1 format.
---@return vector4
function M.from_rgba(r, g, b, a)
	return vmath.vector4(r, g, b, a or 1)
end

--- Generate a random color
---@return vector4
function M.random()
	return vmath.vector4(math.random(), math.random(), math.random(), 1)
end

---Convert a rgba part to Vector4.
---@param r number Red colors channel in a 0 to 255 format.
---@param g number Green colors channel in a 0 to 255 format.
---@param b number Blue colors channel in a 0 to 255 format.
---@param a number Alpha colors channel in a 0 to 255 format.
---@return vector4
function M.from_rgba_255(r, g, b, a)
	return vmath.vector4(normalize_color(r), normalize_color(g), normalize_color(b), a and normalize_color(a) or 1)
end

--- Convert from hsv to a vector4.
---@param hue number
---@param saturation number
---@param value number
---@return vector4
function M.from_hsv(hue, saturation, value)
	if saturation == 0 then -- If it's achromatic, just return the value
		return vmath.vector4(value, value, value, 1)
	end

	-- Get the hue sector
	local hue_sector = math.floor(hue / 60)
	local hue_sector_offset = (hue / 60) - hue_sector

	local p = value * (1 - saturation)
	local q = value * (1 - saturation * hue_sector_offset)
	local t = value * (1 - saturation * (1 - hue_sector_offset))

	if hue_sector == 0 then
		return vmath.vector4(value, t, p, 1)
	elseif hue_sector == 1 then
		return vmath.vector4(q, value, p, 1)
	elseif hue_sector == 2 then
		return vmath.vector4(p, value, t, 1)
	elseif hue_sector == 3 then
		return vmath.vector4(p, q, value, 1)
	elseif hue_sector == 4 then
		return vmath.vector4(t, p, value, 1)
	elseif hue_sector == 5 then
		return vmath.vector4(value, p, q, 1)
	end
end

--- Convert from a vector4 to hue, saturation, value.
---@param color vector4
---@return number Hue
---@return number Saturation
---@return number Value
function M.to_hsv(color)
	local red = color.x
	local green = color.y
	local blue = color.z

	local hue, saturation, value

	local min_value = math.min(red, green, blue)
	local max_value = math.max(red, green, blue)

	value = max_value

	local value_delta = max_value - min_value

	if max_value ~= 0 then -- If the color is not black
		saturation = value_delta / max_value
	else -- If the color is purely black
		saturation = 0
		hue = -1
		return hue, saturation, value
	end

	if red == max_value then
		hue = (green - blue) / value_delta
	elseif green == max_value then
		hue = 2 + (blue - red) / value_delta
	else
		hue = 4 + (red - green) / value_delta
	end

	hue = hue * 60
	if hue < 0 then
		hue = hue + 360
	end

	return hue, saturation, value
end

return M

