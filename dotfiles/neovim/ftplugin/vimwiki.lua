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
    { text = true }):wait()
  local stdErr = resultTable["stderr"]
  local macErrorStart = string.find(stdErr, "Device not configured")
  local linuxErrorStart = string.find(stdErr, "No such device or address")
  if macErrorStart == nil and linuxErrorStart == nil and stdErr ~= nil
  then
    vim.print(stdErr)
  else
    print("Cards created 📝")
  end
end

vim.api.nvim_create_user_command("CreateCards", createCards, {})
