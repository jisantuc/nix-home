local function openTicket()
        local jiraRoot = os.getenv("JIRA_ROOT")
        if jiraRoot == nil then
                vim.notify("Can't browse tickets without a JIRA_ROOT env variable", vim.log.levels.ERROR)
                return
        end
        local ticketId = vim.fn.expand("<cWORD>")
        local url = jiraRoot .. "/browse/" .. ticketId
        vim.ui.open(url)
end

vim.api.nvim_create_user_command("JiraViewTicket", openTicket, {})
