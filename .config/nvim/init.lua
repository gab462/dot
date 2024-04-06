vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.number = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.guicursor = ""
vim.opt.laststatus = 3
vim.opt.winbar = "%=%f %m"
vim.opt.termguicolors = false

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.mouse = ""

vim.opt.wildignore = "**/__pycache__/**,__pycache__/**"

vim.g.sexp_filetypes = "hy"

vim.keymap.set("n", "<C-p>", ":e **/*");

vim.api.nvim_create_autocmd("Colorscheme", { callback = function()
    vim.api.nvim_set_hl(0, "Normal", { ctermbg = "none" })

    for k, v in pairs({ Comment = "darkgreen", Constant = "darkblue", PreProc = "darkred" }) do
        vim.api.nvim_set_hl(0, k, { ctermfg = v })
    end
end})

vim.cmd.colorscheme("quiet")
