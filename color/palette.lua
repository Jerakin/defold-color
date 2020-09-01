local color = require "color.color"

local M = {}

M.colors = {
	miner = {"264653","2a9d8f","e9c46a","f4a261","e76f51"},
	rediron = {"e63946","f1faee","a8dadc","457b9d","1d3557"},
	cottoncandy = {"ffadad","ffd6a5","fdffb6","caffbf","9bf6ff","a0c4ff","bdb2ff","ffc6ff","fffffc"},
	ice = {"03045e","023e8a","0077b6","0096c7","00b4d8","48cae4","90e0ef","ade8f4","caf0f8"},
	glowingsteel = {"003049","d62828","f77f00","fcbf49","eae2b7"},
	icecream = {"cb997e","eddcd2","fff1e6","f0efeb","ddbea9","a5a58d","b7b7a4"},
	railroad = {"006d77","83c5be","edf6f9","ffddd2","e29578"},
	blackwhitehighlight = {"000000","14213d","fca311","e5e5e5","ffffff"},
	glowing = {"7400b8","6930c3","5e60ce","5390d9","4ea8de","48bfe3","56cfe1","64dfdf","72efdd","80ffdb"},
	fire = {"03071e","370617","6a040f","9d0208","d00000","dc2f02","e85d04","f48c06","faa307","ffba08"},
	sunsetoverteal = {"1a535c","4ecdc4","f7fff7","ff6b6b","ffe66d"},
	forest = {"606c38","283618","fefae0","dda15e","bc6c25"},
	skin = {"ffb5a7","fcd5ce","f8edeb","f9dcc4","fec89a"},
	sickly = {"d8e2dc","ffe5d9","ffcad4","f4acb7","9d8189"},
	greyscale = {"f8f9fa","e9ecef","dee2e6","ced4da","adb5bd","6c757d","495057","343a40","212529"},
	greyscale = {"eddcd2","fff1e6","fde2e4","fad2e1","c5dedd","dbe7e4","f0efeb","d6e2e9","bcd4e6","99c1de"},
	steel = {"21295c","1b3b6f","065a82","1c7293","9eb3c2"},
	desaturated = {"ef476f","ffd166","06d6a0","118ab2","073b4c"},
	colorful = {"ffbe0b","fb5607","ff006e","8338ec","3a86ff"},
	unicorn = {"ffcbf2","f3c4fb","ecbcfd","e5b3fe","e2afff","deaaff","d8bbff","d0d1ff","c8e7ff","c0fdff"},
	verdant = {"007f5f","2b9348","55a630","80b918","aacc00","bfd200","d4d700","dddf00","eeef20","ffff3f"},
	bluesteel = {"0466c8","0353a4","023e7d","002855","001845","001233","33415c","5c677d","7d8597","979dac"},
	orange = {"ff4800","ff5400","ff6000","ff6d00","ff7900","ff8500","ff9100","ff9e00","ffaa00","ffb600"},
	green = {"daf2da","b8e6b8","98d998","7acc7a","60bf60","47b347","32a632","1f991f","118c11","008000"},
	brown = {"774936","6e4230","653a2a","5c3324","532c1e","4a2419","411d13","38160d","2f0e07","260701"},
	colorchaos = {"669900","99cc33","ccee66","006699","3399cc","990066","cc3399","ff6600","ff9900","ffcc00"},
	sunsetoverforest = {"f94144","f3722c","f8961e","f9c74f","90be6d","43aa8b","577590"}
}
local _amount_of_colors = 0


local initalized
if not initalized then
	for name, colors in pairs(M.colors) do
		_amount_of_colors = _amount_of_colors + 1
		local t = {}
		for i, c in pairs(colors) do
			t[i] = color.from_hex(c)
		end
		M.colors[name] = t
	end
	initalized = true
end

function M.random()
	local r = math.random(1, _amount_of_colors)
	local i = 0
	for _, c in pairs(M.colors) do
		i = i + 1
		if i == r then
			return c
		end
	end
end

return M