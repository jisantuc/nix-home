vim.g.rest_nvim = {
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = false,
        -- Encode URL before making request
        encode_url = true,
        -- Highlight request on run
        highlight = {
                timeout = 150,
        }
}

-- set files with .http extension to "http" filetype
vim.filetype.add({
        extension = {
                http = "http"
        }
})
