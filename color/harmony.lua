local color = require("color.color")

local M = {}

---Return a complementary color. The complementary color is the color on the opposite side of the color wheel.
---@param start_color Vector4
---@return Vector4
function M.complementary(start_color)
	local h, s, v = color.to_hsv(start_color)
	return color.from_hsv((h + 180) % 360, s, v)
end

---Generate an Array of colors that are all the varieties of a single hue—the tints, shades, and tones.
---@param start_color Vector4 The color you want to generate your other colors from.
---@param count number How many colors you want to generate.
---@return Vector4[] An Array of colors of length ` count`.
function M.monochromatic(start_color, count)
	local h, s, v = color.to_hsv(start_color)
	count = count or 1

	local s_step = s / (count + 1)

	local t = {}
	for i = count, 1, -1 do
		t[#t + 1] = color.from_hsv(h, s_step * i, v)
	end
	return t
end

---An analogous color scheme involves three hues, all of which are positioned next to each other on the color wheel.
---@param start_color Vector4 The color you want to generate from.
---@return Vector4[] Array if the two colors that are analogous to the `start_color`.
function M.analogous(start_color)
	local deg = 30
	local h, s, v = color.to_hsv(start_color)
	local h1 = h - 30 <= 0 and h + 360 - deg or h - deg
	return { color.from_hsv(h1, s, v), color.from_hsv((h + deg) % 360, s, v) }
end

---Generate the two colors lying on either side of the `start_color` (the complementary) color.
---@param start_color Vector4 The color you want to generate from.
---@return Vector4[] Array of the two complementary colors.
function M.split_complementary(start_color)
	local deg = 30
	local h, s, v = color.to_hsv(start_color)
	local h1 = h - 30 <= 0 and h + 360 - deg or h - deg
	return { color.from_hsv(h1, s, v), color.from_hsv((h + deg) % 360, s, v) }
end

---Generate the two colors that are triadic color. Triadic colors are equidistant on the color wheel.
---@param start_color Vector4 The color you want to generate from.
---@return Vector4[] Array of the two colors to complement the `start_color` to make a triadic color sheme.
function M.triadic(start_color)
	local h, s, v = color.to_hsv(start_color)
	return {
		color.from_hsv((h + 120) % 360, s, v),
		color.from_hsv((h + 240) % 360, s, v),
	}
end

---A tetrad is four colors, that is, two pairs of complementary combinations.
---@param start_color Vector4 The color you want to generate from.
---@return Vector4[] Array of the three colors to complement the starting color to make a tetradic color sheme.
function M.tetradic(start_color)
	local h, s, v = color.to_hsv(start_color)
	return {
		color.from_hsv((h + 60) % 360, s, v),
		color.from_hsv((h + 180) % 360, s, v),
		color.from_hsv((h + 180 + 60) % 360, s, v),
	}
end

return M

