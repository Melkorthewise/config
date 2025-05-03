-- ~/.config/nvim/lua/armand-serrano-crucifixion/theme.lua
vim.cmd('highlight clear')

vim.o.background = 'dark'
vim.o.termguicolors = true

-- Define highlight groups
-- Enable transparent background
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

-- Set the color for strings (e.g., green)
vim.api.nvim_set_hl(0, "String", { fg = "#D57C39", bg = "none", italic = true })
vim.api.nvim_set_hl(0, "Statement", { fg = "#D57C39", bg = "none" })
vim.api.nvim_set_hl(0, "Function", { fg = "#80281B", bg = "none" })
vim.api.nvim_set_hl(0, "Delimiter", { fg = "#948487", bg = "none" })
vim.api.nvim_set_hl(0, "Special", { fg = "#948487", bg = "none" })


