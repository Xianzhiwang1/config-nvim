local function hello()
    return [[hello world]]
end

local util = require('vim.lsp.util')

local function get_keys(t)
    local keys = {}
    for key, _ in pairs(t) do
        table.insert(keys, key)
    end
    return keys
end

local function help2()
    local params = util.make_position_params()
    result = vim.lsp.buf_request_sync(
        0,
        "textDocument/signatureHelp",
        params,
        100
    -- function(_, result)
    --     if result and result.signatures and result.signatures[1] then
    --         print(result.signatures[1].label)
    --     end
    -- end
    )
    --     if result and result.signatures and result.signatures[1] then
    --         print(result.signatures[1].label)
    --     end
    return result[1].result.signatures[1].label
end

require('lualine').setup({
    options = {
        icons_enabled = false,
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
}
)
