-- lua/redterminal/init.lua
local palette = require("badblood.palette")
local groups_mod = require("badblood.groups")

local function setup()
	-- Clear existing highlights
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	-- Enable truecolor
	vim.o.termguicolors = true
	vim.g.colors_name = "badblood"

	-- Set terminal colors to match your palette
	for i = 0, 15 do
		vim.g["terminal_color_" .. i] = palette["color" .. i]
	end

	-- Apply highlight groups
	local highlights = groups_mod.get_groups()
	for group, settings in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, settings)
	end
end

return { setup = setup }
