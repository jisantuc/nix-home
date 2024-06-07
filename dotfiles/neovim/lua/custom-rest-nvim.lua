require("rest-nvim").setup({
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = false,
        -- Encode URL before making request
        encode_url = true,
        -- Highlight request on run
        highlight = {
                timeout = 150,
        },
        result = {
                split = {
                        horizontal = false,
                        in_place = false,
                        stay_in_current_window_after_split = true,
                },
                behavior = {
                        decode_url = true,
                        show_info = {
                                url = true,
                                headers = true,
                                http_info = true,
                                curl_command = true,
                        },
                        statistics = {
                                enable = true,
                                ---@see https://curl.se/libcurl/c/curl_easy_getinfo.html
                                stats = {
                                        { "total_time",      title = "Time taken:" },
                                        { "size_download_t", title = "Download size:" },
                                },
                        },
                        formatters = {
                                json = "jq",
                                html = function(body)
                                        if vim.fn.executable("tidy") == 0 then
                                                return body, { found = false, name = "tidy" }
                                        end
                                        local fmt_body = vim.fn.system({
                                                "tidy",
                                                "-i",
                                                "-q",
                                                "--tidy-mark", "no",
                                                "--show-body-only", "auto",
                                                "--show-errors", "0",
                                                "--show-warnings", "0",
                                                "-",
                                        }, body):gsub("\n$", "")

                                        return fmt_body, { found = true, name = "tidy" }
                                end,
                        },
                },
                keybinds = {
                        buffer_local = true,
                        prev = "H",
                        next = "L",
                },
        },
        env_file = '.env',
        custom_dynamic_variables = {},
})

-- set files with .http extension to "http" filetype
vim.filetype.add({
        extension = {
                http = "http"
        }
})
