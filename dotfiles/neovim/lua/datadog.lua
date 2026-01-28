local function openTraceLogs()
        local traceId = vim.fn.expand("<cword>")
        local url = "https://app.datadoghq.com/logs?query=trace_id%3A" .. traceId
        vim.ui.open(url)
end

vim.api.nvim_create_user_command("DataDogTraceLogs", openTraceLogs, {})
