vim.opt.mouse = ""
vim.opt.guicursor = ""
vim.opt.hlsearch = false
vim.opt.laststatus = 3
vim.opt.winbar = "%=%m %f"

vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.api.nvim_create_autocmd("Colorscheme", {
    callback = function()
        for _, name in ipairs({ "Normal", "Winbar", "WinbarNC", "WinSeparator" }) do
            vim.api.nvim_set_hl(0, name, { bg = nil })
        end

        for name, color in pairs({ ["Comment"] = "lightgreen",
                                   ["PreProc"] = "lightred",
                                   ["Constant"] = "lightblue" }) do
            vim.api.nvim_set_hl(0, name, { fg = color })
        end
    end
})

vim.cmd.colorscheme("quiet")
