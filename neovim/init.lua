-- turn on line numbers, like we had in the old country
vim.wo.number = true
vim.wo.relativenumber = true

-- customize nvim-tree rendering
require("nvim-tree").setup({
  renderer = {
    group_empty = true,
    highlight_git = true
  },
  view = {
    adaptive_size = true
  },
  diagnostics = { enable = true },
  filters = { dotfiles = false }
})

-- setup neogit
local neogit = require("neogit")
neogit.setup {
  kind = "vsplit"
}

-- activate and configure metals
local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt", ".worksheet.sc" },
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

metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

-- activate rnix-lsp
require("lspconfig").rnix.setup{}

-- activate purescript ls
require("lspconfig").purescriptls.setup{}

-- configure lsp keybindings
vim.api.nvim_set_keymap(
  "n", -- mode
  "gd", -- key chord
  "<cmd>lua vim.lsp.buf.definition()<CR>", -- command to execute
  { noremap = true } -- some options, I don"t know what I can do here
)

vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "gds", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "gws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>cl", "<cmd>lua vim.lsp.codelens.run()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>aa", "<cmd>lua vim.diagnostic.setqflist()<CR>", { noremap = true }) -- all workspace diagnostics
vim.api.nvim_set_keymap("n", "<leader>ae", "<cmd>lua vim.diagnostic.setqflist({severity = \"E\"})<CR>", { noremap = true }) -- all workspace errors
vim.api.nvim_set_keymap("n", "<leader>aw", "<cmd>lua vim.diagnostic.setqflist({severity = \"W\"})<CR>", { noremap = true }) -- all workspace warnings
vim.api.nvim_set_keymap("n", "<leader>d", "<cmd>lua vim.diagnostic.setloclist()<CR>", { noremap = true }) -- buffer diagnostics only

-- make find much better
vim.opt.path:remove "/usr/include"
vim.opt.path:append "**"
vim.opt.wildignorecase = true
vim.opt.wildignore:append "**/node_modules/*"
vim.opt.wildignore:append "**/.bloop/*"
vim.opt.wildignore:append "**/target/*"
vim.opt.wildignore:append "**/.bsp/*"
vim.opt.wildignore:append "**/.metals/*"
vim.api.nvim_set_keymap("n", "<space>ff", "<cmd>:FzfLua files<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>fb", "<cmd>:FzfLua buffers<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>fg", "<cmd>:FzfLua git_files<CR>", { noremap = true })

-- launch git conveniently
vim.api.nvim_set_keymap("n", "<space>gs", "<cmd>:Neogit<CR>", { noremap = true })

-- tree view mappings
-- launch it
vim.api.nvim_set_keymap("n", "<space>tt", "<cmd>:NvimTreeToggle<CR>", { noremap = true })
-- find file
vim.api.nvim_set_keymap("n", "<space>tf", "<cmd>:NvimTreeFindFile<CR>", { noremap = true })

require("nvim-web-devicons").setup {
  color_icons = true;
  default = true;
}

-- make colors look nice
vim.opt.background = "light"
vim.cmd("colorscheme solarized")

-- launch markdown preview
vim.api.nvim_set_keymap("n", "<leader>mp", "<cmd>MarkdownPreview<CR>", { noremap = true });

-- make completion fancier
local cmp = require("cmp")

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
    ["<CR>"] = cmp.mapping.confirm({ select = true })
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" }  }, {
    { name = "buffer" },
  })
})

-- Example filetype config for nvim-cmp
-- cmp.setup.filetype("gitcommit", {
--   sources = cmp.config.sources({
--     { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
--   }, {
--     { name = "buffer" },
--   })
-- })

