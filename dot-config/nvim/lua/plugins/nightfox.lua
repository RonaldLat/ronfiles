return {
  "EdenEast/nightfox.nvim",

  opts = {
    -- custom options here
  },
  config = function(_, opts)
    require("nightfox").setup({
      options = {
        transparent = false,
        styles      = {
          comments = "italic",
          keywords = "bold",
          types = "italic,bold",
        }
      }
    }) -- calling setup is optional
    -- vim.cmd [[colorscheme nightfox]]
  end,

} -- lazy
