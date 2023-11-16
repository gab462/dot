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
        end
    },
    {
        "Mofiqul/adwaita.nvim",
        config = function()
            vim.g.adwaita_transparent = true
            vim.cmd.colorscheme("adwaita")
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
                options = {
                    icons_enabled = false,
                    theme = "adwaita",
                    section_separators = "",
                    component_separators = ""
                },
            })
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
