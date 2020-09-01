local color = require "color.color"

local M = {}

function M.complementary(start_color)
	local h, s, v = color.to_hsv(start_color)
	return color.from_hsv((h+180)%360, s, v)
end

function M.monochromatic(start_color, count)
	local h, s, v = color.to_hsv(start_color)
	count = count or 1
	
	local s_step = s / (count + 1)
	local v_step = 0

	local t = {}
	for i=count, 1, -1 do
		t[#t+1] = color.from_hsv(h, s_step*i, v)
	end
	return t
end

function M.analogous(start_color)
	local h, s, v = color.to_hsv(start_color)
	return {color.from_hsv(math.abs(h-30), s, v), color.from_hsv((h+30)%360, s, v)}
end

function M.split_complementary(start_color)
	local deg = 30
	local comp = M.complementary(start_color)
	local h, s, v = color.to_hsv(start_color)
	local h1 = h-30 <= 0 and h+360-deg or h-deg
	return {color.from_hsv(h1, s, v), color.from_hsv((h+deg)%360, s, v)}
end

function M.triadic(start_color)
	local h, s, v = color.to_hsv(start_color)
	return {
		color.from_hsv((h+120)%360, s, v),
		color.from_hsv((h+240)%360, s, v)
	}
end

function M.tetradic(start_color)
	local h, s, v = color.to_hsv(start_color)
	return {
		color.from_hsv((h+60)%360, s, v),
		color.from_hsv((h+180)%360, s, v),
		color.from_hsv((h+180+60)%360, s, v)
	}
end

return M