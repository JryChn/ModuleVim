local M = {}

-- Ordered list for cycling and a map for validation
M.list = {
  "github_dark",
  "gruvbox-material",
  "everforest",
  "onebuddy",
  "gruvbuddy",
  "edge",
}

local set_ok, _ = pcall(vim.cmd.colorscheme, "default")

local function normalize(name)
  return (name or ""):gsub("%s+", "")
end

function M.set(name)
  name = normalize(name)
  if name == "" then return end

  -- Some themes have extra globals; set sane defaults when present
  if name == "gruvbox-material" then
    vim.g.gruvbox_material_background = vim.g.gruvbox_material_background or "medium"
    vim.g.gruvbox_material_enable_bold = 1
    vim.g.gruvbox_material_enable_italic = 1
  elseif name == "everforest" then
    vim.g.everforest_background = vim.g.everforest_background or "soft"
    vim.g.everforest_enable_italic = 1
  elseif name == "edge" then
    vim.g.edge_style = vim.g.edge_style or "neon"
    vim.g.edge_enable_italic = 1
  end

  local ok, err = pcall(vim.cmd.colorscheme, name)
  if ok then
    vim.g.modulevim_theme = name
    -- Keep transparent toggle behavior working
    -- lualine is set to theme = "auto" so no extra work here
  else
    vim.notify("Colorscheme '" .. name .. "' not found: " .. tostring(err), vim.log.levels.WARN)
  end
end

function M.apply_current()
  local name = normalize(vim.g.modulevim_theme) ~= "" and vim.g.modulevim_theme or M.list[1]
  M.set(name)
end

function M.cycle()
  local current = normalize(vim.g.modulevim_theme) ~= "" and vim.g.modulevim_theme or M.list[1]
  local idx = 1
  for i, n in ipairs(M.list) do
    if n == current then idx = i break end
  end
  local next_idx = (idx % #M.list) + 1
  M.set(M.list[next_idx])
end

return M
