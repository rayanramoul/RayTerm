return {
  "mfussenegger/nvim-dap-python",
  ft = "python",
  dependencies = { "mfussener/nvim-dap" },
  config = function(_, opts) -- luacheck: ignore 212
    local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
    require("dap-python").setup(path)
  end,
}
