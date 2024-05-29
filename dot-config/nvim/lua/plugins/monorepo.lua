return {
  "imNel/monorepo.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  config = function()
    require("monorepo").setup({
      -- Your config here!
    })
  end,
}
