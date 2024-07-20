return {
  "p5quared/apple-music.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = true,
  keys = {
    -- { "<leader>amp", function() require("apple-music").toggle_play() end,               desc = "Toggle [P]layback" },
    -- { "<leader>ams", function() require("apple-music").toggle_shuffle() end,            desc = "Toggle [S]huffle" },
    -- { "<leader>fp",  function() require("apple-music").select_playlist_telescope() end, desc = "[F]ind [P]laylists" },
    -- { "<leader>fa",  function() require("apple-music").select_album_telescope() end,    desc = "[F]ind [A]lbum" },
    {
      "<leader>afs",
      function()
        require("apple-music").select_track_telescope()
      end,
      desc = "[F]ind [S]ong",
    },
    -- { "<leader>amx", function() require("apple-music").cleanup_all() end,               desc = "Cleanup Temp Playlists" },
  },
}
