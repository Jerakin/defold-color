local M = {}

---Subtracts two colors to get the difference. Subtracting two colors of the same value will give you 0 (i.e. black).
---@param base Vector4
---@param blend Vector4
---@return Vector4
function M.difference(base, blend)
	return vmath.vector4(math.abs(base.x - blend.x), math.abs(base.y - blend.y), math.abs(base.z - blend.z), 1)
end

---The two values are inverted, multiplied then inverted again. The result is the opposite of multiply: wherever either layer was darker than white, the result is brighter.
---@param base Vector4
---@param blend Vector4
---@return Vector4
function M.screen(base, blend)
	return vmath.vector4(
		1 - (((1 - base.x) * (1 - blend.x)) / 1),
		1 - (((1 - base.y) * (1 - blend.y)) / 1),
		1 - (((1 - base.z) * (1 - blend.z)) / 1),
		1
	)
end

---A combination of multiply and screen.
--- Where the base layer is light, the top layer becomes lighter; where the base layer is dark,
--- the top becomes darker; where the base layer is mid grey, the top is unaffected.
--- An overlay with the same picture looks like an S-curve.
---@param base Vector4
---@param blend Vector4
---@return Vector4
function M.overlay(base, blend)
	return vmath.vector4(
		(blend.x > 0.5 and 1 or 0) * (1 - (1-2 * (blend.x-0.5)) * (1 - base.x)) + (blend.x <= 0.5 and 1 or 0) * ((2 * blend.x) * base.x),
		(blend.y > 0.5 and 1 or 0) * (1 - (1-2 * (blend.y-0.5)) * (1 - base.y)) + (blend.y <= 0.5 and 1 or 0) * ((2 * blend.y) * base.y),
		(blend.z > 0.5 and 1 or 0) * (1 - (1-2 * (blend.z-0.5)) * (1 - base.z)) + (blend.z <= 0.5 and 1 or 0) * ((2 * blend.z) * base.z),
		1
	)
end

---Inverts the color, Leaving the alpha unaffected.
---@param color Vector4
---@return Vector4
function M.invert(color)
	return M.difference(color, vmath.vector4(1, 1, 1, 1))
end

---Multiplies to colors. Leaving the alpha unaffected.
---@param base Vector4
---@param blend Vector4
---@return Vector4
function M.multiply(base, blend)
	return vmath.vector4(base.x * blend.x, base.y * blend.y, base.z * blend.z, 1)
end

---Add two colors together, clamping the result to 1. Leaving the alpha unaffected.
---@param base Vector4
---@param blend Vector4
---@return Vector4
function M.add(base, blend)
	return vmath.vector4(math.min(1, base.x + blend.x), math.min(1, base.y + blend.y), math.min(1, base.z + blend.z), 1)
end

---Divide two colors. Leaving the alpha unaffected. Make sure the blend values are not zero.
---@param base Vector4
---@param blend Vector4
---@return Vector4
function M.divide(base, blend)
	assert(blend.x > 0, "Zero Division Error")
	assert(blend.y > 0, "Zero Division Error")
	assert(blend.z > 0, "Zero Division Error")
	return vmath.vector4(blend.x / base.x, blend.y / base.y, blend.z / base.z, 1)
end

---Subtract blend color from the base. Leaving the alpha unaffected.
---@param base Vector4
---@param blend Vector4
---@return Vector4
function M.subtract(base, blend)
	return vmath.vector4(
		math.max(0, (base.x - blend.x)),
		math.max(0, (base.y - blend.y)),
		math.max(0, (base.z - blend.z)),
		1
	)
end

---Brighter than the Screen blend mode. Results in an intense,
---contrasty color-typically results in saturated mid-tones and blown highlights.
---@param base Vector4
---@param blend Vector4
---@return Vector4
function M.color_dodge(base, blend)
	return vmath.vector4(
		math.max(0, math.min(1, blend.x / (1 - base.x))),
		math.max(0, math.min(1, blend.y / (1 - base.y))),
		math.max(0, math.min(1, blend.z / (1 - base.z))),
		1
	)
end

---Blend mode. Brighter than the Color Dodge blend mode, but less saturated and intense.
---@param base Vector4
---@param blend Vector4
---@return Vector4
function M.linear_dodge(base, blend)
	return M.add(base, blend)
end

---Darker than Multiply, with more highly saturated mid-tones and reduced highlights.
---@param base Vector4
---@param blend Vector4
---@return Vector4
function M.color_burn(base, blend)
	return vmath.vector4(
	math.max(0, math.min(1, 1 - (1 - blend.x) / base.x)),
	math.max(0, math.min(1, 1 - (1 - blend.y) / base.y)),
	math.max(0, math.min(1, 1 - (1 - blend.z) / base.z)),
	1
)
end

---Darker than Multiply, with more highly saturated mid-tones and reduced highlights.
---@param base Vector4
---@param blend Vector4
---@return Vector4
function M.linear_burn(base, blend)
	return vmath.vector4(
	math.max(0, math.min(1, base.x + blend.x - 1)),
	math.max(0, math.min(1, base.y + blend.y - 1)),
	math.max(0, math.min(1, base.z + blend.z - 1)),
	1
)
end


return M
