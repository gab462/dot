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

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.mouse = ""

vim.opt.termguicolors = true
vim.opt.bg = "dark"

vim.g.c_syntax_for_h = true

vim.api.nvim_create_autocmd("Filetype", {
    pattern = "c",
    callback = function()
        vim.treesitter.start()

        local client = vim.lsp.start({
            name = "Clang",
            cmd = { "clangd" },
            root_dir = "."
        })

        vim.lsp.buf_attach_client(0, client)
    end
})
