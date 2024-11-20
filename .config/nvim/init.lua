vim.opt.smartindent = true

vim.opt.number = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.guicursor = ""
vim.opt.laststatus = 3
vim.opt.winbar = "%=%f %m"
vim.opt.completeopt = "menuone,popup"

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.mouse = ""

-- vim.opt.termguicolors = false
--
-- vim.api.nvim_create_autocmd("Colorscheme", { callback = function()
--     vim.api.nvim_set_hl(0, "Normal", { ctermbg = "none" })
--
--     for k, v in pairs({ Comment = "green", Constant = "blue" }) do
--         vim.api.nvim_set_hl(0, k, { ctermfg = v })
--     end
-- end})

vim.cmd.colorscheme("retrobox")
