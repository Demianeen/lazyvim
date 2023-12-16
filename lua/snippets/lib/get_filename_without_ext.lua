local get_filename_without_ext = function()
  return vim.fn.expand('%:t:r')
end

return get_filename_without_ext
