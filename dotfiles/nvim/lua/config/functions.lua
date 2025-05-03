local M = {}

function M.format_all_buffers()
  local conform = require("conform")
  local formatted_count = 0

  vim.notify("Formatting all buffers...", vim.log.levels.INFO)

  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    local is_loaded = vim.api.nvim_buf_is_loaded(bufnr)
    local is_listed = vim.api.nvim_get_option_value("buflisted", { buf = bufnr })
    print(("Buffer %d: loaded=%s, listed=%s"):format(bufnr, tostring(is_loaded), tostring(is_listed)))
    if is_loaded and is_listed then
      local formatters = conform.list_formatters_for_buffer(bufnr)
      if formatters and #formatters > 0 then
        conform.format({ bufnr = bufnr })
        formatted_count = formatted_count + 1
      end
    end
  end

  vim.notify("Formatted " .. formatted_count .. " buffer(s).", vim.log.levels.INFO)
end

return M
