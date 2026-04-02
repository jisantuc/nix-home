-- list things that link to the currently opened wiki file
vim.api.nvim_set_keymap("n", "<leader>wlb", "<cmd>VimwikiBacklinks<CR>", { noremap = true, desc = "List backlinks" })
-- confirm all links in this wiki are reachable
vim.api.nvim_set_keymap("n", "<leader>wlc", "<cmd>VimwikiCheckLinks<CR>", { noremap = true, desc = "Check all links" })
-- generate a table of contents
vim.api.nvim_set_keymap("n", "<leader>wo", "<cmd>VimwikiTOC<CR>",
  { noremap = true, desc = "Insert or update table of contents" })

vim.opt_local.spell = true
vim.opt_local.shiftwidth = 2

local function createCards()
  local resultTable = vim.system({ "repeater", "create", vim.fn.expand("%") },
    { text = true, cwd = vim.fn.expand("$HOME") .. "/srs" }):wait()
  local stdErr = resultTable["stderr"]
  local expectedErrorStart = string.find(stdErr, "Device not configured")
  if expectedErrorStart == nil and stdErr ~= nil
  then
    vim.print(stdErr)
  else
    print("Cards created 📝")
  end
end

vim.api.nvim_create_user_command("CreateCards", createCards, {})

local function findCheckedItems()
        local query = vim.treesitter.query.parse("markdown", [[
  (list_item _ (task_list_marker_checked)) @li
]])
        local tree = vim.treesitter.get_parser():parse()[1]
        local bufnr = vim.api.nvim_get_current_buf()

        for id, node, metadata, match in query:iter_captures(tree:root(), bufnr, 0, -1) do
                -- Print the node name and source text.
                vim.print({ node, vim.treesitter.get_node_text(node, bufnr) })
                -- TODO: delete/yank all text from the matched nodes so I can paste it elsewhere
        end
end

vim.api.nvim_create_user_command("YankChecked", findCheckedItems, {})
