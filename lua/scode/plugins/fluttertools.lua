return {
  "naufalulwan/custom-flutter-tools",
  event = "VeryLazy",
  dependencies = {
    "naufalulwan/custom-plenary",
    "stevearc/dressing.nvim",
    "fei6409/log-highlight.nvim",
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
          enablesnippets = true,
        },
      },
      debugger = {
        enabled = false,
        run_via_dap = true,
        exception_breakpoints = {},
        register_configurations = function(paths)
          local dap = require("dap")
          dap.set_log_level("TRACE")
          -- See also: https://github.com/akinsho/flutter-tools.nvim/pull/292
          dap.adapters.dart = {
            type = "executable",
            -- command = vim.fn.exepath("pwsh.exe"),
            -- args = { "-Command", "flutter debug_adapter" },
            command = "C:\\src\\flutter.git\\bin\\flutter.bat",
            args = { "debug-adapter" },
            options = {
              initialize_timeout_sec = 30,
              detached = false,
            },
          }
          dap.configurations.dart = {}
          require("dap.ext.vscode").load_launchjs()
        end,
      },
      dev_log = {
        enabled = false,
        open_cmd = "10split",
        focus_on_open = true,
      },
      outline = {
        open_cmd = "30vnew",
        auto_open = false,
      },
      decorations = {
        statusline = {
          app_version = true,
          device = true,
          project_config = false,
        },
      },
    })
  end,
}
