local M = {}

function M.difference(base, blend)
	return vmath.vector4(
		math.abs(base.x - blend.x),
		math.abs(base.y - blend.y),
		math.abs(base.z - blend.z),
		1
	)
end

function M.screen(base, blend)
	return vmath.vector4(
		1 - (((1 - base.x) * (1 - blend.x)) / 1),
		1 - (((1 - base.y) * (1 - blend.y)) / 1),
		1 - (((1 - base.z) * (1 - blend.z)) / 1),
		1
	)
end

function M.overlay(base, blend)
	return M.screen(base, M.multiply(base, blend))
end

function M.invert(color)
	return M.difference(color, vmath.vector4(1, 1, 1, 1))
end

function M.multiply(base, blend)
	return vmath.vector4(
		base.x * blend.x,
		base.y * blend.y,
		base.z * blend.z,
		1
	)
end

function M.add(base, blend)
	return vmath.vector4(
		math.min(1, base.x + blend.x),
		math.min(1, base.y + blend.y),
		math.min(1, base.z + blend.z),
		1
	)
end

function M.divide(base, blend)
	assert(blend.x > 0, "Zero Division Error")
	assert(blend.y > 0, "Zero Division Error")
	assert(blend.z > 0, "Zero Division Error")
	return vmath.vector4(
		blend.x / base.x,
		blend.y / base.y,
		blend.z / base.z,
		1
	)
end

function M.subtract(base, blend)
	return vmath.vector4(
		math.max(0, (base.x - blend.x)),
		math.max(0, (base.y - blend.y)),
		math.max(0, (base.z - blend.z)),
		1
	)
end

return M
