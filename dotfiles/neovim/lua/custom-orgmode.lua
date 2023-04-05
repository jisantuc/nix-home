require("orgmode").setup({
  org_agenda_files = {"~/.org/agenda/*"},
  org_default_notes_file = "~/.org/refile.org",

  win_split_mode = "vertical",

  org_todo_keywords = {'TODO', 'BLOCKED', '|', 'DONE', 'DELEGATED'}
})

-- it's not clear to me whether this is actually doing anything.
-- vimPlugins ensures that treesitter has _an_ orgmode grammar,
-- and I can't run :TSUpdate ___ because of permissions in the
-- /nix store, but this makes an annoying warning go away at
-- startup, so it's still nice to have
require("orgmode").setup_ts_grammar()
