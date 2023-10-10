-- toggle conceal level between 0 and 2
-- 0 conceals nothing, 2 makes links concealed
local function conceal()
        vim.opt.conceallevel = 2
end

local function noconceal()
        vim.opt.conceallevel = 0
end

vim.keymap.set("n", "<leader>osc", conceal, { desc = "conceal" })
vim.keymap.set("n", "<leader>osC", noconceal, { desc = "no conceal" })
