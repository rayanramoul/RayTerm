require("nvim-tree").setup({
actions = {
    open_file = {
      quit_on_open = true,
    },
  },
    sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})
