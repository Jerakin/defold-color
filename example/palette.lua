local color = require "color.color"
local palette = require "color.palette"

local dirtylarry = require "dirtylarry.dirtylarry"

local TOUCH = hash("touch")

local M = {}

function M.init(self)
	self.random_nodes = {
		gui.get_node("random1"),
		gui.get_node("random2"),
		gui.get_node("random3"),
		gui.get_node("random4"),
		gui.get_node("random5"),
		gui.get_node("random6"),
		gui.get_node("random7"),
		gui.get_node("random8"),
		gui.get_node("random9"),
		gui.get_node("random10"),
	}
	for i=1, #self.random_nodes do
		gui.set_enabled(self.random_nodes[i], false)
	end
end

local function random(self)
	local colors = palette.random()
	for i=1, #self.random_nodes do
		gui.set_enabled(self.random_nodes[i], false)
	end
	for i=1, #colors do
		gui.set_enabled(self.random_nodes[i], true)
		gui.set_color(self.random_nodes[i], colors[i])
	end
end

function M.on_input(self, action_id, action)
	dirtylarry.button(self, "random", action_id, action, function()
		random(self)
	end)
end

return M