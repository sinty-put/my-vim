return {
  "akinsho/pubspec-assist.nvim",
  dependencies = {
    "naufalulwan/custom-plenary",
  },
  cmd = {
    "PubspecAssistAddPackage",
    "PubspecAssistAddDevPackage",
    "PubspecAssistPickVersion",
  },
  ft = { "yaml" },
  event = "BufEnter pubspec.yaml",
  config = function()
    require("pubspec-assist").setup()
    vim.api.nvim_set_keymap("n", "<Leader>p", "<cmd>PubspecAssistPickVersion<CR>", { noremap = true, silent = true })
  end,
}
