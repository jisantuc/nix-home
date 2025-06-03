vim.opt.colorcolumn = "120"

vim.opt_local.foldmethod = "expr"
vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt_local.spell = true

local function readingTime()
        local count = vim.fn.wordcount().words
        local readingTimeMinutes = count / 238
        print(string.format("%.1f", readingTimeMinutes) .. " minutes")
end

vim.api.nvim_create_user_command("ReadingTime", readingTime, {})
