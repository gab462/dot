vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.number = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.guicursor = ""

vim.opt.backup = false
vim.opt.swapfile = false

vim.opt.mouse = ""

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = "all",
                highlight = {
                    enable = true
                }
            })

            vim.cmd.colorscheme("quiet")
            vim.opt.termguicolors = false

            vim.api.nvim_set_hl(0, "Normal", { ctermbg = "none" })

            colors = {
                Comment = "green",
                Constant = "blue",
                PreProc = "red"
            }

            for k, v in pairs(colors) do
                vim.api.nvim_set_hl(0, k, { ctermfg = v })
            end
        end
    },
    {
        "echasnovski/mini.comment",
        config = function()
            require("mini.comment").setup({
                options = {
                    ignore_blank_line = true
                }
            })
        end
    },
    {
        "echasnovski/mini.surround",
        config = function()
            require("mini.surround").setup()
        end
    },
    {
        "echasnovski/mini.pairs",
        config = function()
            require("mini.pairs").setup()
        end
    },
    {
        "ggandor/leap.nvim",
        config = function()
            require('leap').add_default_mappings()
        end
    }
},
{
    ui = {
        icons = {
            cmd = "⌘",
            config = "🛠",
            event = "📅",
            ft = "📂",
            init = "⚙",
            keys = "🗝",
            plugin = "🔌",
            runtime = "💻",
            require = "🌙",
            source = "📄",
            start = "🚀",
            task = "📌",
            lazy = "💤 ",
        },
    },
})
