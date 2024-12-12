if scode.themes then
  local theme = ""
  for _, value in pairs(scode.themes or {}) do
    theme = value
  end
  pcall(vim.cmd.colorscheme, theme)
end
