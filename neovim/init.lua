require("nvim-tree").setup({renderer = { group_empty = true }})

-- activate and configure metals
local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach({})
  end,
  group = nvim_metals_group,
})

metals_config = require("metals").bare_config()
metals_config.settings = {
       showImplicitArguments = true,
       excludedPackages = {
        "akka.actor.typed.javadsl",
        "com.github.swagger.akka.javadsl"
       }
}
metals_config.init_options.statusBarProvider = "on"

-- configure lsp keybindings
vim.api.nvim_set_keymap(
  "n", -- mode
  "gd", -- key chord
  "<cmd>lua vim.lsp.buf.definition()<CR>", -- command to execute
  { noremap = true } -- some options, I don't know what I can do here
)

vim.api.nvim_set_keymap( "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true })
vim.api.nvim_set_keymap( "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true })
vim.api.nvim_set_keymap( "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true })
vim.api.nvim_set_keymap( "n", "gds", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", { noremap = true })
vim.api.nvim_set_keymap( "n", "gws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", { noremap = true })
vim.api.nvim_set_keymap( "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })
vim.api.nvim_set_keymap( "n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", { noremap = true })
vim.api.nvim_set_keymap( "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true })
vim.api.nvim_set_keymap( "n", "<leader>a", "<cmd>lua require(\"metals\").open_all_diagnostics()<CR>", { noremap = true })

-- make find much better
vim.opt.path:remove "/usr/include"
vim.opt.path:append "**"
vim.opt.wildignorecase = true
vim.opt.wildignore:append "**/node_modules/*"
vim.opt.wildignore:append "**/target/*"
vim.opt.wildignore:append "**/.bloop/*"
vim.opt.wildignore:append "**/.bsp/*"
vim.opt.wildignore:append "**/.metals/*"

-- make colors look nice
vim.opt.background = "light"
vim.cmd("colorscheme solarized")
