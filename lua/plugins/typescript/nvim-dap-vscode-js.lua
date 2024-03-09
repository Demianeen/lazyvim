return {
  'mfussenegger/nvim-dap',
  opts = function()
    local languages =
      { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' }

    local dap = require('dap')

    dap.adapters['pwa-node'] = {
      type = 'server',
      host = 'localhost',
      port = '${port}',
      executable = {
        command = 'js-debug-adapter',
        args = { '${port}' },
      },
    }

    dap.adapters['pwa-chrome'] = {
      type = 'server',
      host = 'localhost',
      port = '${port}',
      executable = {
        command = 'js-debug-adapter',
        args = { '${port}' },
      },
    }

    require('dap.ext.vscode').load_launchjs(nil, {
      ['pwa-node'] = languages,
      ['node'] = languages,
      ['chrome'] = languages,
      ['pwa-chrome'] = languages,
    })

    for _, language in ipairs(languages) do
      vim.list_extend(dap.configurations[language], {
        -- {
        --   type = 'pwa-node',
        --   request = 'launch',
        --   name = 'Launch JS file',
        --   program = '${file}',
        --   cwd = '${workspaceFolder}',
        -- },
        {
          type = 'pwa-node',
          request = 'launch',
          name = 'Launch file',
          cwd = '${workspaceFolder}',
          -- NOTE: you would need to have tsx installed globally
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
          request = 'launch',
          name = 'Run and Debug Custom Command',
          -- you need to have tsx globally or locally installed
          runtimeExecutable = 'tsx',
          runtimeArgs = function()
            local input =
              vim.fn.input({ prompt = 'Command to run: ', completion = 'file' })
            print(input)
            return input
          end,
          cwd = '${workspaceFolder}',
          sourceMaps = true,
          protocol = 'inspector',
          skipFiles = { '<node_internals>/**', 'node_modules/**' },
        },
        {
          type = 'pwa-node',
          request = 'attach',
          name = 'Attach to process',
          processId = require('dap.utils').pick_process,
          cwd = '${workspaceFolder}',
        },
        -- {
        --   type = 'pwa-chrome',
        --   request = 'launch',
        --   name = 'Start Chrome with "localhost:3000"',
        --   url = 'http://localhost:3000',
        --   webRoot = '${workspaceFolder}',
        --   userDataDir = '${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir',
        -- },
        {
          type = 'pwa-chrome',
          request = 'launch',
          name = 'Start Chrome on port',
          url = function()
            local port = vim.fn.input({
              prompt = 'Port ',
              completion = 'file',
            })
            return 'http://localhost:3000' .. port
          end,
          webRoot = '${workspaceFolder}',
          userDataDir = '${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir',
        },
      })
    end
  end,
}
