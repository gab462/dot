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

vim.o.background = "dark"

vim.cmd.colorscheme("gruvbox")

vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "WinBar", { bg = "NONE" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function() vim.treesitter.start() end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "cpp",
    callback = function()
        local client = vim.lsp.start({
            name = "Clang",
            cmd = { "clangd" },
            root_dir = ".",
        })
        vim.lsp.buf_attach_client(0, client)
    end
})
