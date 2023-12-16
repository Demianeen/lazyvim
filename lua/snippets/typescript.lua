-- luasnip
local ls = require('luasnip')
local extras = require('luasnip.extras')
local fmt = require('luasnip.extras.fmt').fmt

-- lib
local get_filename_without_ext =
  require('snippets.lib.get_filename_without_ext')

-- reused snippets
local clg = ls.snippet('clg', {
  ls.text_node('console.log('),
  ls.insert_node(1),
  ls.text_node(')'),
})

ls.add_snippets('typescriptreact', {
  clg,
  ls.snippet('co', {
    ls.dynamic_node(function()
      local register_data = vim.fn.getreg() .. ''
      if string.match(register_data, '[%d-]+,%s*[%d-]+') then
        return ls.snippet_node(nil, {
          ls.text_node('position([' .. register_data .. '])'),
        })
      end
    end),
  }),
  ls.snippet(
    'rc',
    fmt(
      [[
export interface {}Props {{
}}

export const {} = ({{}}: {}Props) => {{

  return (
    <div>
      {}
    </div>
  );
}};
]],
      {

        ls.function_node(get_filename_without_ext),
        ls.function_node(get_filename_without_ext),
        ls.function_node(get_filename_without_ext),
        ls.insert_node(1),
      }
    )
  ),
})

ls.add_snippets('typescript', {
  clg,
})
