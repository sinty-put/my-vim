return {
  "lopi-py/luau-lsp.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    platform = {
      type = "roblox",
    },
    types = {
      roblox_security_level = "PluginSecurity",
    },
    plugin = {
      enable = true,
      port = 3667,
    },
    sourcemap = {
      enable = true,
      autogenerate = true,
      rojo_project_file = "default.project.json",
      sourcemap_file = "sourcemap.json",
    },
  },
}
