local present, dap = pcall(require, "dap")

if not present then return end

-- Config for dart language
dap.adapters.dart = {
  type = "executable",
  command = "node",
  args = {os.getenv('HOME') .. "/Dart-Code/out/dist/debug.js", "flutter"}
}
dap.configurations.dart = {
  {
    type = "dart",
    request = "launch",
    name = "Launch flutter",
    dartSdkPath = os.getenv('HOME') .. "/dev/flutter/bin/cache/dart-sdk/",
    flutterSdkPath = os.getenv('HOME') .. "/dev/flutter",
    program = "${workspaceFolder}/lib/main.dart",
    cwd = "${workspaceFolder}"
  }
}

-- Config breakpoint catching method
dap.defaults.fallback.exception_breakpoints = {}

-- Custom breakpoint icon and color
vim.api.nvim_set_hl(0, 'DapBreakpoint',
                    {ctermbg = 0, fg = '#ef2929', bg = '#31353f'})
vim.api.nvim_set_hl(0, 'DapLogPoint',
                    {ctermbg = 0, fg = '#32afff', bg = '#31353f'})
vim.api.nvim_set_hl(0, 'DapStopped',
                    {ctermbg = 0, fg = '#8ae234', bg = '#31353f'})
vim.api.nvim_set_hl(0, 'DapLine', {ctermbg = 0, bg = '#31353f'})

vim.fn.sign_define('DapBreakpoint', {
  text = '●',
  texthl = 'DapBreakpoint',
  linehl = 'DapLine',
  numhl = 'DapBreakpoint'
})
vim.fn.sign_define('DapBreakpointCondition', {
  text = '●',
  texthl = 'DapBreakpoint',
  linehl = 'DapBreakpoint',
  numhl = 'DapBreakpoint'
})
vim.fn.sign_define('DapBreakpointRejected', {
  text = '●',
  texthl = 'DapBreakpoint',
  linehl = 'DapBreakpoint',
  numhl = 'DapBreakpoint'
})
vim.fn.sign_define('DapLogPoint', {
  text = '●',
  texthl = 'DapLogPoint',
  linehl = 'DapLogPoint',
  numhl = 'DapLogPoint'
})
vim.fn.sign_define('DapStopped', {
  text = '●',
  texthl = 'DapStopped',
  linehl = 'DapStopped',
  numhl = 'DapStopped'
})

-- Setting hot reload
local autocmd = vim.api.nvim_create_autocmd
autocmd({"BufWritePost"}, {
  pattern = {"*.dart"},
  command = "silent lua require('dap').hot_reload()"
})

dap.listeners.after.event_initialized["dapui_config"] = function()
  -- require'dapui'.open({layout = 2})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  require'dapui'.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  require'dapui'.close()
end
