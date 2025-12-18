local server_cmd;

-- Prefer ty if it's available, otherwise fall back to pyright
if vim.fn.executable("ty") == 1 then
        server_cmd = {"ty", "server"}
else
        server_cmd = { "pyright-langserver", "--stdio" }
end

return {
        cmd = server_cmd,
        filetypes = { "python" },
        root_markers = {
                "pyproject.toml",
                "setup.py",
                "setup.cfg",
                "requirements.txt",
                "Pipfile",
                "pyrightconfig.json",
        },
        settings = {
                python = {
                        analysis = {
                                autoSearchPaths = true,
                                useLibraryCodeForTypes = true,
                        },
                },
        },
}
