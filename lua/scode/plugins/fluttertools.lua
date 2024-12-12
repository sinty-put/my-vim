return {
  "akinsho/flutter-tools.nvim",
  event = "VeryLazy",
  dependencies = {
    "naufalulwan/custom-plenary",
    "stevearc/dressing.nvim",
  },
  config = function()
    require("flutter-tools").setup({
      fvm = false,
      widget_guides = { enabled = true },
      lsp = {
        settings = {
          showtodos = true,
          completefunctioncalls = true,
          analysisexcludedfolders = {
            vim.fn.expand("$Home/.pub-cache"),
          },
          renamefileswithclasses = "prompt",
          updateimportsonrename = true,
          enablesnippets = false,
        },
      },
      debugger = {
        enabled = true,
        run_via_dap = true,
        exception_breakpoints = {},
        register_configurations = function(paths)
          local dap = require("dap")
          -- See also: https://github.com/akinsho/flutter-tools.nvim/pull/292
          dap.configurations.dart = {
            {
              type = "dart",
              request = "launch",
              name = "Launch flutter",
              flutterMode = "debug",
              args = { "--debug" },
              program = "${workspaceFolder}/lib/main.dart",
            },
          }
        end,
      },
    })
  end,
}
