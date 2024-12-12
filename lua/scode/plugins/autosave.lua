return {
  "pocco81/auto-save.nvim",
  event = "VeryLazy",
  config = function()
    require("auto-save").setup({
      trigger_events = { "InsertLeave", "BufLeave", "FocusLost" },
    })
  end,
}
