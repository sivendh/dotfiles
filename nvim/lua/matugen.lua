 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#000000',
    base01 = '#18192a',
    base02 = '#202135',
    base03 = '#6c7086',
    base04 = '#a6adc8',
    base05 = '#cdd6f4',
    base06 = '#cdd6f4',
    base07 = '#cdd6f4',
    base08 = '#f38ba8',
    base09 = '#89dceb',
    base0A = '#89b4fa',
    base0B = '#74c7ec',
    base0C = '#92dfed',
    base0D = '#8fd2f0',
    base0E = '#85b1fa',
    base0F = '#b6d0fc',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#cdd6f4',          bg = '#000000' })
  hi('TelescopeBorder',         { fg = '#6c7086',             bg = '#000000' })
  hi('TelescopePromptNormal',   { fg = '#cdd6f4',          bg = '#000000' })
  hi('TelescopePromptBorder',   { fg = '#6c7086',             bg = '#000000' })
  hi('TelescopePromptPrefix',   { fg = '#74c7ec',             bg = '#000000' })
  hi('TelescopePromptCounter',  { fg = '#a6adc8',  bg = '#000000' })
  hi('TelescopePromptTitle',    { fg = '#000000',             bg = '#74c7ec' })
  hi('TelescopePreviewTitle',   { fg = '#000000',             bg = '#89b4fa' })
  hi('TelescopeResultsTitle',   { fg = '#000000',             bg = '#89dceb' })
  hi('TelescopeSelection',      { fg = '#cdd6f4',          bg = '#202135' })
  hi('TelescopeSelectionCaret', { fg = '#74c7ec',             bg = '#202135' })
  hi('TelescopeMatching',       { fg = '#74c7ec',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#cdd6f4',          bg = '#000000' })
  hi('MiniPickBorder',         { fg = '#6c7086',             bg = '#000000' })
  hi('MiniPickPrompt',   { fg = '#cdd6f4',          bg = '#000000' })
  hi('MiniPickPromptPrefix',   { fg = '#74c7ec',             bg = '#000000' })
  hi('MiniPickBorderText',    { fg = '#000000',             bg = '#74c7ec' })
  hi('MiniPickMatchCurrent',      { fg = '#cdd6f4',          bg = '#202135' })
  hi('MiniPickPromptCaret', { fg = '#74c7ec',             bg = '#202135' })
  hi('MiniPickMatchRanges',       { fg = '#74c7ec',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
