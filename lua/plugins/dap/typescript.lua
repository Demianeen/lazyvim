return {
  'mfussenegger/nvim-dap',
  dependencies = {
    {
      'mxsdev/nvim-dap-vscode-js',
      opts = {
        -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
        debugger_path = vim.fn.stdpath('data') .. '/lazy/vscode-js-debug',
        -- debugger_cmd = { "extension" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
        adapters = {
          'chrome',
          'pwa-node',
          'pwa-chrome',
          'pwa-msedge',
          'node-terminal',
          'pwa-extensionHost',
          'node',
          'chrome',
        }, -- which adapters to register in nvim-dap
        -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
        -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
        -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
      },
    },
    {
      'microsoft/vscode-js-debug',
      lazy = true,
      build = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out',
    },
  },
  opts = function()
    local languages =
      { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' }

    for _, language in ipairs(languages) do
      require('dap').configurations[language] = {
        {
          type = 'pwa-node',
          request = 'launch',
          name = 'Launch JS file',
          program = '${file}',
          cwd = '${workspaceFolder}',
        },
        {
          type = 'pwa-node',
          request = 'launch',
          name = 'Launch TS file',
          cwd = '${workspaceFolder}',
          runtimeExecutable = 'tsx',
          args = { '${file}' },
          sourceMaps = true,
          protocol = 'inspector',
          skipFiles = { '<node_internals>/**', 'node_modules/**' },
          resolveSourceMapLocations = {
            '${workspaceFolder}/**',
            '!**/node_modules/**',
          },
        },
        {
          type = 'pwa-node',
          request = 'attach',
          name = 'Attach',
          processId = require('dap.utils').pick_process,
          cwd = '${workspaceFolder}',
        },
        {
          type = 'pwa-chrome',
          request = 'launch',
          name = 'Start Chrome with "localhost"',
          url = 'http://localhost:3000',
          webRoot = '${workspaceFolder}',
          userDataDir = '${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir',
        },
      }
    end

    require('dap.ext.vscode').load_launchjs(nil, {
      ['pwa-node'] = languages,
      ['node'] = languages,
      ['chrome'] = languages,
      ['pwa-chrome'] = languages,
    })
  end,
}