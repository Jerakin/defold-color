local M = {}

local initalized
function M.initialize()
	if initalized == nil then
		math.randomseed(socket.gettime())
		initalized = true
	end
end

return M