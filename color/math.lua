local M = {}

---Subtracts two colors to get the difference. Subtracting two colors of the same value will give you 0 (i.e. black).
---@param base vector4
---@param blend vector4
---@return vector4
function M.difference(base, blend)
	return vmath.vector4(math.abs(base.x - blend.x), math.abs(base.y - blend.y), math.abs(base.z - blend.z), 1)
end

---The two values are inverted, multiplied then inverted again. The result is the opposite of multiply: wherever either layer was darker than white, the result is brighter.
---@param base vector4
---@param blend vector4
---@return vector4
function M.screen(base, blend)
	return vmath.vector4(
		1 - (((1 - base.x) * (1 - blend.x)) / 1),
		1 - (((1 - base.y) * (1 - blend.y)) / 1),
		1 - (((1 - base.z) * (1 - blend.z)) / 1),
		1
	)
end

--- Combines multiply and screen blend modes. Where the blend is lighter, the base becomes lighter; where the blend is dark, the base becomes darker; where the blend is mid grey, the base unaffected.
---@param base vector4
---@param blend vector4
---@return vector4
function M.overlay(base, blend)
	return M.screen(base, M.multiply(base, blend))
end

---Inverts the color, Leaving the alpha unaffected.
---@param color vector4
---@return vector4
function M.invert(color)
	return M.difference(color, vmath.vector4(1, 1, 1, 1))
end

---Multiplies to colors. Leaving the alpha unaffected.
---@param base vector4
---@param blend vector4
---@return vector4
function M.multiply(base, blend)
	return vmath.vector4(base.x * blend.x, base.y * blend.y, base.z * blend.z, 1)
end

---Add two colors together, clamping the result to 1. Leaving the alpha unaffected.
---@param base vector4
---@param blend vector4
---@return vector4
function M.add(base, blend)
	return vmath.vector4(math.min(1, base.x + blend.x), math.min(1, base.y + blend.y), math.min(1, base.z + blend.z), 1)
end

---Divide two colors. Leaving the alpha unaffected. Make sure the blend values are not zero.
---@param base vector4
---@param blend vector4
---@return vector4
function M.divide(base, blend)
	assert(blend.x > 0, "Zero Division Error")
	assert(blend.y > 0, "Zero Division Error")
	assert(blend.z > 0, "Zero Division Error")
	return vmath.vector4(blend.x / base.x, blend.y / base.y, blend.z / base.z, 1)
end

---Subtract blend color from the base. Leaving the alpha unaffected.
---@param base vector4
---@param blend vector4
---@return vector4
function M.subtract(base, blend)
	return vmath.vector4(
		math.max(0, (base.x - blend.x)),
		math.max(0, (base.y - blend.y)),
		math.max(0, (base.z - blend.z)),
		1
	)
end

return M
