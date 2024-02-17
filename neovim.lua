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

vim.opt.completeopt = "menuone,longest" -- ,popup (0.10)
vim.opt.wildignore = "*.o,*.wasm,*/"
vim.keymap.set("n", "<C-p>", ":e **/*", { noremap = true });

vim.opt.background = "dark"

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

        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { noremap = true })
        vim.keymap.set("i", "<tab>", function() return vim.fn.pumvisible() == 1 and "<C-n>" or "<C-x><C-o>" end, { noremap = true, expr = true })
    end
})
