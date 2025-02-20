local config = require("color.config")
config.initialize()

local M = {}
local normalize_color = function(v)
	return v / 255
end

local to_255 = function(v)
	local v2 = math.max(0.0, math.min(1.0, v))
	return math.floor(v2 == 1.0 and 255 or (v2 * 256.0))
end


---@param str string Hex color, with or without the #.
---@return Vector4
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
---@param color Vector4
---@return string Hex color with the # prefix.
function M.to_hex(color)
	return string.format("#%02x%02x%02x", color.x * 255.0, color.y * 255.0, color.z * 255.0)
end

---Convert a Table to Vector4.
---@param tbl table Table with 4 entries. Colors should be from 0 to 1.
---@return Vector4
function M.from_table(tbl)
	return M.from_rgba(tbl[1], tbl[2], tbl[3], tbl[4])
end

---Convert a Vector4 to Table.
---@param color Vector4 Table with 4 entries. Colors are in the 0 to 1 format.
---@return table<number, number>
function M.to_table(color)
	return {color.x, color.y, color.z, color.x}
end


---Convert a Table to Vector4.
---@param tbl table Table with 4 entries. Colors are in the 0 to 255 format.
---@return Vector4
function M.from_table_255(tbl)
	return M.from_rgba_255(tbl[1], tbl[2], tbl[3], tbl[4])
end

---Convert a Vector4 to Table.
---@param color Vector4 Table with 4 entries. Colors should be from 0 to 255.
---@return table<number, number>
function M.to_table_255(color)
	return {to_255(color.x), to_255(color.y), to_255(color.z), to_255(color.x)}
end

---Convert a rgba part to Vector4.
---@param r number Red colors channel in a 0 to 1 format.
---@param g number Green colors channel in a 0 to 1 format.
---@param b number Blue colors channel in a 0 to 1 format.
---@param a|nil number Alpha colors channel in a 0 to 1 format.
---@return Vector4
function M.from_rgba(r, g, b, a)
	return vmath.vector4(r, g, b, a or 1)
end

--- Generate a random color
---@return Vector4
function M.random()
	return vmath.vector4(math.random(), math.random(), math.random(), 1)
end

---Convert a rgba part to Vector4.
---@param r number Red colors channel in a 0 to 255 format.
---@param g number Green colors channel in a 0 to 255 format.
---@param b number Blue colors channel in a 0 to 255 format.
---@param a number|nil Alpha colors channel in a 0 to 255 format.
---@return Vector4
function M.from_rgba_255(r, g, b, a)
	return vmath.vector4(normalize_color(r), normalize_color(g), normalize_color(b), a and normalize_color(a) or 1)
end

--- Convert from hsv to a Vector4.
---@param hue number
---@param saturation number
---@param value number
---@return Vector4
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
	end
	-- hue_sector == 5
	return vmath.vector4(value, p, q, 1)
end

--- Convert from a Vector4 to hue, saturation, value.
---@param color Vector4
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

	if value_delta == 0 then
		hue = 0
	elseif red == max_value then
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

--- Shift the color along the color wheel.
---@param color Vector4 The color to shift.
---@param value number|nil Percental shift (0-1) around the wheel, defaults to a random value of 1% - 2%
---@return Vector4 A new Vector4 of the resulting color.
function M.shift(color, value)
	local h, s, v = M.to_hsv(color)
	if value == nil then
		value = math.random() * 0.01 + 0.01
	end
	h = h + (value * 360)
	if h >= 360 then
		h = h - 360
	end
	return M.from_hsv(h, s, v)
end

return M

