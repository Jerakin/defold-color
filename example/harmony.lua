local color = require "color.color"
local harmony = require "color.harmony"

local dirtylarry = require "dirtylarry.dirtylarry"

local TOUCH = hash("touch")

local M = {}

local last

function M.redraw_last(self)
	if last then
		last(self)
	end
end

local function toggle_nodes(self, amount)
	for i, node in pairs(self.output_nodes) do
		gui.set_enabled(node, i <= amount)
	end
end

local function complementary(self)
	toggle_nodes(self, 1)
	gui.set_color(self.output_nodes[1], harmony.complementary(color.from_hsv(self.hue, self.saturation, self.value)))
end

local last_count = 0
local function monochromatic(self, count)
	if count then
		last_count = count
	else
		count = last_count
	end
	toggle_nodes(self, count)
	local colors = harmony.monochromatic(color.from_hsv(self.hue, self.saturation, self.value), count)
	for i=1, count do
		gui.set_color(self.output_nodes[i], colors[i])
	end
end

local function triadic(self)
	toggle_nodes(self, 2)
	local colors = harmony.triadic(color.from_hsv(self.hue, self.saturation, self.value))
	gui.set_color(self.output_nodes[1], colors[1])
	gui.set_color(self.output_nodes[2], colors[2])
end

local function tetradic(self)
	toggle_nodes(self, 3)
	local colors = harmony.tetradic(color.from_hsv(self.hue, self.saturation, self.value))
	gui.set_color(self.output_nodes[1], colors[1])
	gui.set_color(self.output_nodes[2], colors[2])
	gui.set_color(self.output_nodes[3], colors[3])
end

local function split_complementary(self)
	toggle_nodes(self, 2)
	local colors = harmony.split_complementary(color.from_hsv(self.hue, self.saturation, self.value))
	gui.set_color(self.output_nodes[1], colors[1])
	gui.set_color(self.output_nodes[2], colors[2])
end

local function analogous(self)
	toggle_nodes(self, 2)
	local colors = harmony.analogous(color.from_hsv(self.hue, self.saturation, self.value))
	gui.set_color(self.output_nodes[1], colors[1])
	gui.set_color(self.output_nodes[2], colors[2])
end

function M.init(self)
	self.output_nodes = {
		gui.get_node("harmony1"), gui.get_node("harmony2"),
		gui.get_node("harmony3"), gui.get_node("harmony4")
	}
	toggle_nodes(self, 0)
end

function M.on_input(self, action_id, action)
	dirtylarry.button(self, "complementary", action_id, action, function()
		complementary(self)
		last = complementary
	end)
	dirtylarry.button(self, "split_complementary", action_id, action, function()
		split_complementary(self)
		last = split_complementary
	end)
	dirtylarry.button(self, "analogous", action_id, action, function()
		analogous(self)
		last = analogous
	end)
	dirtylarry.button(self, "monochromatic", action_id, action, function()
		monochromatic(self, 1)
		last = monochromatic
	end)
	dirtylarry.button(self, "monochromatic2", action_id, action, function()
		monochromatic(self, 2)
		last = monochromatic
	end)
	dirtylarry.button(self, "monochromatic3", action_id, action, function()
		monochromatic(self, 3)
		last = monochromatic
	end)
	dirtylarry.button(self, "triadic", action_id, action, function()
		triadic(self)
		last = triadic
	end)
	dirtylarry.button(self, "tetradic", action_id, action, function()
		tetradic(self)
		last = tetradic
	end)
	if action_id == TOUCH and action.pressed then
		for _, node in pairs(self.output_nodes) do
			if gui.pick_node(node, action.x, action.y) then
				print(color.to_hex(gui.get_color(node)))
			end
		end
	end
end

return M