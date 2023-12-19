return {
  'nvim-neo-tree/neo-tree.nvim',
  opts = {
    event_handlers = {
      {
        event = 'neo_tree_buffer_leave',
        handler = function(_)
          vim.cmd('Neotree close')
        end,
      },
    },
    filesystem = {
      window = {
        mappings = {
          ['n'] = 'add',
          ['N'] = 'add_directory',

          -- fzf content of files in the dir under the cursor
          ['g'] = function(state)
            -- get the current node
            local node = state.tree:get_node()
            -- if the node is not a directory, walk up the tree until we find one
            while node and node.type ~= 'directory' do
              local parent_id = node:get_parent_id()
              if parent_id == nil then
                -- we must have reached the root node
                -- this should not happen because the root node is always a directory
                -- but just in case...
                node = nil
                break
              end
              node = state.tree:get_node(parent_id)
            end
            -- if we somehow didn't find a directory, just use the root node
            local path = node and node.path or state.path
            require('telescope.builtin').live_grep({
              search_dirs = { path },
              prompt_title = string.format(
                'Grep in [%s]',
                vim.fs.basename(path)
              ),
            })
          end,
        },
      },
    },
  },
}
