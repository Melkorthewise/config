local M = {}

-- M.custom_lualine_theme = {
--   normal = {
--     a = { fg = '#282828', bg = '#a89984', gui = 'bold' },
--     b = { fg = '#ebdbb2', bg = '#504945' },
--     c = { fg = '#ebdbb2', bg = '#3c3836' },
--   },
--   insert = { a = { fg = '#282828', bg = '#b8bb26', gui = 'bold' } },
--   visual = { a = { fg = '#282828', bg = '#83a598', gui = 'bold' } },
--   replace = { a = { fg = '#282828', bg = '#fb4934', gui = 'bold' } },
--   inactive = {
--     a = { fg = '#a89984', bg = '#282828', gui = 'bold' },
--     b = { fg = '#a89984', bg = '#282828' },
--     c = { fg = '#a89984', bg = '#282828' },
--   },
-- }

function M.colorscheme()
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
end

return M
