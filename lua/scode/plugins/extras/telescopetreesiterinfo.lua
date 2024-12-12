return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "naufalulwan/custom-plenary",
    "roycrippen4/telescope-treesitter-info.nvim",
  },
  config = function()
    require("telescope").load_extension("treesitter_info")
  end,
  keys = {
    { "<leader>p", "<cmd>Telescope treesitter_info<cr>", desc = "Treesitter Info" },
  },
}
