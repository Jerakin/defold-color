local color = require "color.color"
local colorpick = require "example.colorpick"

local TOUCH = hash("touch")
local min = math.min
local max = math.max
local abs = math.abs

local SATURATION_HEIGHT = 500
local WHEEL_DIAMETER = 500

local M = {}


function M.init(self)
	self.wheel_control = gui.get_node("wheel_select")
	self.shift = gui.get_node("shift/larrybutton")
end


function M.on_input(self, action_id, action)
	if action_id == TOUCH then
		if action.pressed and gui.pick_node(self.shift, action.x, action.y) then
			local current = gui.get_position(self.wheel_control)
			local shift_random_sim = math.random() * 0.01 + 0.01
			local rotation = math.rad(360*shift_random_sim)
			local r_x = math.cos(rotation) * current.x - math.sin(rotation) * current.y
			local r_y = math.sin(rotation) * current.x + math.cos(rotation) * current.y
			gui.set_position(self.wheel_control, vmath.vector3(r_x, r_y, 1))
			msg.post(".", "update")
		end
	end
end

return M