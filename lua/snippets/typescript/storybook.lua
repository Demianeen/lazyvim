-- luasnip
local ls = require('luasnip')
local extras = require('luasnip.extras')
local fmt = require('luasnip.extras.fmt').fmt

-- lib
local get_filename_without_ext =
  require('snippets.lib.get_filename_without_ext')

local get_storybook_folder = ls.choice_node(2, {
  ls.text_node('pages'),
  ls.text_node('widgets'),
  ls.text_node('features'),
  ls.text_node('entities'),
  ls.text_node('shared'),
}) -- Choices for category

local storybookTemplate = ls.snippet(
  'sts',
  fmt(
    [[
        import type {{ Meta, StoryObj }} from '@storybook/react'
        import {{ {fileName} }} from "./{fileName}";

        export default {{
          title: "{folder}/{fileName}",
          component: {fileName},
          argTypes: {{
            backgroundColor: {{ control: "color" }},
          }},
        }} as Meta<typeof {fileName}>;

        type Story = StoryObj<typeof Page>

        export const Primary: Story = {{{}}}
        ]],
    {
      folder = get_storybook_folder,
      fileName = ls.function_node(get_filename_without_ext),
      ls.insert_node(1), -- Placeholder for component name
    }
  )
)

local createOneStory = ls.snippet(
  'st',
  fmt(
    [[
        export const {}: Story = {{}};
        ]],
    {
      ls.insert_node(1, 'StoryName'), -- Placeholder for story name
    }
  )
)

ls.add_snippets('typescriptreact', {
  storybookTemplate,
  createOneStory,
})
