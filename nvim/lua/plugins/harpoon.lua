return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },

    config = function()
      local harpoon = require("harpoon")
      local keymap = vim.keymap.set

      harpoon:setup()

      -- Agregar archivo
      keymap("n", "<leader>a", function()
        harpoon:list():add()
      end, {
        desc = "Harpoon add file",
      })

      -- Abrir menú
      keymap("n", "<leader>m", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, {
        desc = "Harpoon menu",
      })

      -- Cerrar archivo
      keymap("n", "<leader>r", function()
        harpoon:list():clear()
      end, {
        desc = "Clear Harpoon",
      })

      -- Saltos rápidos
      keymap("n", "<leader>1", function()
        harpoon:list():select(1)
      end, {
        desc = "Harpoon file 1",
      })

      keymap("n", "<leader>2", function()
        harpoon:list():select(2)
      end, {
        desc = "Harpoon file 2",
      })

      keymap("n", "<leader>3", function()
        harpoon:list():select(3)
      end, {
        desc = "Harpoon file 3",
      })

      keymap("n", "<leader>4", function()
        harpoon:list():select(4)
      end, {
        desc = "Harpoon file 4",
      })
    end,
  },
}
