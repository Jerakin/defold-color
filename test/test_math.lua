local color = require "color.color"
local cmath = require "color.math"

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
			assert(color.to_hex(cmath.overlay(color.from_hex("ff9999"), color.from_rgba_255(10, 10, 10))) == color.to_hex(color.from_hex("ff9b9b")))
		end)
		
		test("invert", function()
			assert(cmath.invert(color.from_hex("000000")) == color.from_rgba_255(255, 255, 255))
		end)
	end)
end