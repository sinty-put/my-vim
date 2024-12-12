return {
  "echasnovski/mini.indentscope",
  event = { "BufRead", "BufNewFile" },
  config = function()
    require("mini.indentscope").setup({
      options = {
        try_as_border = false,
        indent_at_cursor = true,
      },
      draw = {
        delay = 100,
      },
      mappings = {
        object_scope = "ii",
        object_scope_with_border = "ai",
        goto_top = "[i",
        goto_bottom = "]i",
      },
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "help",
        "alpha",
        "Trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
        "NvimTree",
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
}
