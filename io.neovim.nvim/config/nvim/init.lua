vim.opt.smartindent = true

vim.opt.number = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.guicursor = ""

vim.opt.backup = false
vim.opt.swapfile = false

vim.opt.mouse = ""

vim.opt.laststatus = 3
vim.opt.winbar = "%=%f %m"

vim.cmd.colorscheme("quiet")

vim.api.nvim_set_hl(0, "Normal", { ctermbg = "none" })

for k, v in pairs({ Comment = "green", Constant = "blue", PreProc = "red" }) do
	vim.api.nvim_set_hl(0, k, { ctermfg = v })
end
