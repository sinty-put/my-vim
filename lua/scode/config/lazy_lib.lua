-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)
vim.opt.number = false

local icons = require("scode.user.icons").ui
-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- initialisasi plugins
local importdata = {
  { import = "scode.plugins" },
}
-- load theme
local theme = scode.themes or {}
for key, _ in pairs(theme) do
  table.insert(importdata, { import = "scode.plugins.theme." .. key })
end
-- load extras plugins
local extras = scode.extras or {}
for key, value in pairs(extras) do
  if value then
    table.insert(importdata, { import = "scode.plugins.extras." .. key })
  end
end
-- load language config
local lang = scode.lang or {}
for key, value in pairs(lang) do
  if value then
    table.insert(importdata, { import = "scode.plugins.lang." .. key })
  end
end
-- load transparant config
local transparant = scode.transparent or false
if transparant then
  table.insert(importdata, { import = "scode.plugins.extras.transparent" })
end
-- add overide path
table.insert(importdata, { import = "scode.user.custom" })
-- Setup lazy.nvim
require("lazy").setup({
  spec = importdata,
  ui = {
    backdrop = 100, -- Menyeting backdrop UI
    border = "rounded", -- Mengatur border UI ke rounded
    browser = "chrome", -- Menggunakan Chrome sebagai browser default
    throttle = 40, -- Menyeting throttle
    custom_keys = {
      ["<localleader>l"] = false, -- Menonaktifkan kunci lokal leader l
    },
    icons = {
      ft = icons.ft,
      lazy = icons.Bell .. " ",
      loaded = icons.CheckCircle,
      not_loaded = icons.not_loaded,
    },
  },
  change_detection = { enabled = false, notify = false }, -- Nonaktifkan deteksi perubahan
  -- automatically check for plugin updates
  checker = { enabled = true },
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
