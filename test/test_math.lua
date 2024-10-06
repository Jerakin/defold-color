local color = require "color.color"
local cmath = require "color.math"

local function to_255(f)
	local f2 = math.max(0.0, math.min(1.0, f))
	return math.floor(f2 == 1.0 and 255 or (f2 * 256.0))
end

local function compare_color(color1, color2)
	return to_255(color1.x) == to_255(color2.x) and to_255(color1.y) == to_255(color2.y) and to_255(color1.z) == to_255(color2.z)
end

return function()
	describe("Math operations", function()
		test("color multiplication", function()
			assert(cmath.multiply(color.from_rgba_255(100, 100, 100), color.from_hsv(0, 1, 1)) == color.from_hex("640000"))
		end)
		test("color addition", function()
			assert(cmath.add(color.from_hex("ff9999"), color.from_rgba_255(10, 10, 10)) == color.from_rgba_255(255, 163, 163))
		end)
		test("color subtraction", function()
			assert(cmath.subtract(color.from_hex("aaffcc"), color.from_rgba_255(10, 10, 10)) == color.from_rgba_255(160, 245, 194))
		end)
		test("color divition", function()
			assert(cmath.divide(color.from_hex("ff7f7f"), color.from_hex("7f7f7f")) == color.from_hex("7fffff"))
		end)
	end)
	describe("Blend modes", function()
		test("screen", function()
			assert(cmath.screen(color.from_hex("ff9999"), color.from_rgba_255(10, 10, 10)) == color.from_hex("ff9d9d"))
		end)

		test("difference", function()
			assert(cmath.difference(color.from_hex("ff9999"), color.from_rgba_255(10, 10, 10)) == color.from_hex("f58f8f"))
		end)
		
		test("overlay", function()
			local overlay = cmath.overlay(color.from_rgba_255(195, 49, 171), color.from_rgba_255(107, 194, 145))
			assert(compare_color(overlay, color.from_rgba_255(164, 157, 183)))
		end)
		
		test("invert", function()
			assert(cmath.invert(color.from_hex("000000")) == color.from_rgba_255(255, 255, 255))
		end)

		test("test_color_burn", function()
			local overlay = cmath.color_burn(color.from_rgba_255(195, 49, 171), color.from_rgba_255(107, 194, 145))
			assert(compare_color(overlay, color.from_rgba_255(61, 0, 91)))
		end)

		test("test_linear_burn", function()
			local overlay = cmath.linear_burn(color.from_rgba_255(195, 49, 171), color.from_rgba_255(107, 194, 145))
			assert(compare_color(overlay, color.from_rgba_255(47, 0, 61)))
		end)

		test("test_linear_dodge", function()
			local overlay = cmath.linear_dodge(color.from_rgba_255(195, 49, 171), color.from_rgba_255(14, 19, 14))
			assert(compare_color(overlay, color.from_rgba_255(209, 68, 185)))
		end)

		test("test_color_dodge", function()
			local overlay = cmath.color_dodge(color.from_rgba_255(195, 49, 171), color.from_rgba_255(14, 19, 14))
			assert(compare_color(overlay, color.from_rgba_255(59, 23, 42)))
		end)
	end)
end