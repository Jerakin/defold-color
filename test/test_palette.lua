local cmath = require "color.math"
local palette = require "color.palette"

local function to_255(f)
	local f2 = math.max(0.0, math.min(1.0, f))
	return math.floor(f2 == 1.0 and 255 or (f2 * 256.0))
end

local function compare_color(color1, color2)
	return to_255(color1.x) == to_255(color2.x) and to_255(color1.y) == to_255(color2.y) and to_255(color1.z) == to_255(color2.z)
end

return function()
	describe("Palette", function()
		test("add", function()
			local rgb = {vmath.vector3(1, 0, 0),vmath.vector3(0, 1, 0), vmath.vector3(0, 0, 1)}
			palette.add("rgb", rgb)
			assert(palette.colors.rgb == rgb)
		end)
		test("random discard name", function()
			local color = palette.random()
			assert(type(color[1]) == "userdata")
			assert(color[1].x >= 0)
			assert(color[1].y >= 0)
			assert(color[1].z >= 0)
			assert(color[1].w >= 0)
		end)
		test("random with name", function()
			local color, name = palette.random()
			assert(type(color[1]) == "userdata")
			assert(color[1].x >= 0)
			assert(color[1].y >= 0)
			assert(color[1].z >= 0)
			assert(color[1].w >= 0)
			assert(type(name) == "string")
		end)
	end)
end

