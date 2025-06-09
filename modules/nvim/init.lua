-- Add your config's Lua path manually
local config_path = vim.fn.stdpath("config") .. "/lua/?.lua;" ..
                    vim.fn.stdpath("config") .. "/lua/?/init.lua;"
package.path = config_path .. package.path

-- Show relative line numbers
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.extandtab = true

vim.opt.termguicolors = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require('armand-serrano-crucifixion.theme').colorscheme()


