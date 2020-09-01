local color = require "color.color"

local TOUCH = hash("touch")
local min = math.min
local max = math.max
local abs = math.abs

local SATURATION_HEIGHT = 500
local WHEEL_DIAMETER = 500

local M = {}

local update_fncs = {}

function M.init(self)
	self.wheel_control = gui.get_node("wheel_select")
	self.value_control = gui.get_node("value_select")
	self.output = gui.get_node("output")
	self.value_display = gui.get_node("value")
	self.wheel = gui.get_node("wheel")
	
	self.hue = 0
	self.saturation = 0
	self.value = 1
	self.picked_node = nil
end

function M.register_update_fnc(fnc)
	update_fncs[#update_fncs+1] = fnc
end

local function update_output(self)
	-- Update the color
	gui.set_color(self.output, color.from_hsv(self.hue, self.saturation, self.value))
	for _, fnc in pairs(update_fncs) do
		fnc(self)
	end
end

local function update_wheel(self)
	-- Calculate the saturation
	local p = gui.get_position(self.wheel_control)
	self.saturation = abs(vmath.length(p)) / (WHEEL_DIAMETER/2)

	-- Calculate the hue
	local zero = vmath.vector3(WHEEL_DIAMETER/2, 0, 0)
	local n_p = vmath.normalize(p)
	local n_zero = vmath.normalize(zero)
	local r = math.atan2(n_zero.y, n_zero.x) - math.atan2(n_p.y, n_p.x)
	self.hue = math.deg(r) + 180
	gui.set_color(self.value_display, color.from_hsv(self.hue, self.saturation, 1))
end

local function update_value(self)
	-- Calculate the value
	local y = gui.get_position(self.value_control).y
	self.value = 1 + (y / SATURATION_HEIGHT)
end

function M.on_input(self, action_id, action)
	if action_id == TOUCH then
		if action.pressed then
			if gui.pick_node(self.wheel_control, action.x, action.y) then
				self.picked_node = self.wheel_control
			elseif gui.pick_node(self.value_control, action.x, action.y) then
				self.picked_node = self.value_control
			elseif gui.pick_node(self.wheel, action.x, action.y) then
				self.picked_node = self.wheel
			end
		elseif action.released then
			self.picked_node = nil
		end
		if self.picked_node == self.wheel_control then
			local current = gui.get_position(self.wheel_control)
			local p = vmath.vector3(max(-WHEEL_DIAMETER/2, min(current.x + action.dx, WHEEL_DIAMETER/2)), max(-WHEEL_DIAMETER/2, min(current.y + action.dy, WHEEL_DIAMETER/2)), 0)
			if vmath.length(p) < WHEEL_DIAMETER/2 then
				gui.set_position(self.wheel_control, p)
			else
				local p_n = vmath.normalize(p) * WHEEL_DIAMETER/2
				gui.set_position(self.wheel_control, p_n)
			end
			update_wheel(self)
			update_output(self)
		elseif self.picked_node == self.value_control then
			local current = gui.get_position(self.value_control)
			local p = vmath.vector3(0, max(-SATURATION_HEIGHT, min(current.y + action.dy, 0)), 0)
			gui.set_position(self.value_control, p)
			update_value(self)
			update_output(self)
		elseif self.picked_node == self.wheel then
			local old_p = gui.get_position(self.wheel_control)
			gui.set_parent(self.wheel_control, nil, false)
			gui.set_position(self.wheel_control, vmath.vector3(action.x, action.y, 0))
			gui.set_parent(self.wheel_control, self.wheel, true)
			if vmath.length(gui.get_position(self.wheel_control)) <  WHEEL_DIAMETER/2 then
				update_wheel(self)
				update_output(self)
				self.picked_node = self.wheel_control
			else
				gui.set_position(self.wheel_control, old_p)
			end
		end
	end
end

return M