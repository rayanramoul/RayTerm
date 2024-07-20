return {
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = function()
      local actions = require("diffview.actions")

      require("diffview").setup({
        enhanced_diff_hl = true,
        use_icons = true,
        icons = {
          folder_closed = "",
          folder_open = "",
        },
        signs = {
          fold_closed = "",
          fold_open = "",
          done = "✓",
        },
        view = {
          merge_tool = {
            layout = "diff3_mixed",
            disable_diagnostics = true,
          },
        },
        keymaps = {
          view = {
            ["<leader>gda"] = actions.conflict_choose("ours"),
            ["<leader>gdt"] = actions.conflict_choose("theirs"),
            ["<leader>gdn"] = actions.next_conflict,
            ["<leader>gdp"] = actions.prev_conflict,
          },
        },
      })
    end,
    keys = {
      { "<leader>gd", desc = "Git Diffview" },
      { "<leader>gda", desc = "Git Conflict Accept Ours" },
      { "<leader>gdt", desc = "Git Conflict Accept Theirs" },
      { "<leader>gdn", desc = "Git Conflict Next Conflict" },
      { "<leader>gdp", desc = "Git Conflict Previous Conflict" },
      { "<leader>gdo", ":DiffviewOpen<CR>", desc = "Git Diffview Open" },
      { "<leader>gdc", ":DiffviewClose<CR>", desc = "Git Diffview Close" },
    },
  },
}
