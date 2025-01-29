return {
  {
    "ibhagwan/fzf-lua",
    opts = function()
      local fzf = require("fzf-lua")
      local config = fzf.config
      local actions = fzf.actions

      config.defaults.actions.files["ctrl-p"] = actions.find_files
    end,
  },
}
