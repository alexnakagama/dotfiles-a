return {
  {
    "folke/zen-mode.nvim",
    opts = {},
    keys = {
      {
        "<leader>zz",
        function()
          require("zen-mode").toggle()
        end,
        desc = "Zen Mode",
      },
    },
  },
}
