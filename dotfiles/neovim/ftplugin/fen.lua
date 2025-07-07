local function joinBy(strings, sep)
        if strings == {} then
                return ""
        else
                if #strings == 1 then
                        return strings[1]
                else
                        local head = table.remove(strings, 1)
                        return head .. sep .. joinBy(strings, sep)
                end
        end
end

local function lineToFen(s)
        local output = {};
        local nextOutputIdx = 1;
        local lastChar = nil;
        local emptyRun = 0;
        for i = 1, #s do
                local c = string.sub(s, i, i)
                if c == "." then
                        emptyRun = emptyRun + 1
                        if i == #s then
                                output[nextOutputIdx] = tostring(emptyRun)
                        end
                else
                        if lastChar == nil or lastChar ~= "." then
                                output[nextOutputIdx] = c
                                nextOutputIdx = nextOutputIdx + 1
                        else
                                if lastChar == "." then
                                        output[nextOutputIdx] = tostring(emptyRun)
                                        output[nextOutputIdx + 1] = c
                                        nextOutputIdx = nextOutputIdx + 2
                                        emptyRun = 0
                                end
                        end
                end
                lastChar = c
        end
        return joinBy(output, "")
end

local function boardToFen(opts)
        local startLine = opts["line1"]
        local endLine = opts["line2"]
        local lines = vim.api.nvim_buf_get_lines(0, startLine - 1, endLine, false)
        local tmp = {}
        for i, line in ipairs(lines) do
                tmp[i] = lineToFen(line)
        end
        local piecePlacement = joinBy(tmp, "/")
        local nextMove = opts.fargs[1]
        vim.cmd(":let @+ = \""
                -- where are all the pieces
                .. joinBy({
                                piecePlacement,
                                -- who moves next ("w" or "b")
                                nextMove,
                                -- king-/queen-side castling for White / black
                                -- maybe someday an argument when it becomes relevant in my chess book
                                "KQkq",
                                -- en passant positions
                                "-",
                                -- half move clock
                                "0",
                                -- completed turns
                                "1" },
                        " ")
                .. "\""
        )
        print("Position copied to clipboard with " .. nextMove .. " to move")
end

vim.api.nvim_buf_create_user_command(0, "BoardToFEN", boardToFen, {
        desc = "Convert a visual representation of a chess board to Forsyth-Edwards notation for piece positions",
        range = 2,
        line1 = vim.api.nvim_buf_get_mark(0, "<")[0],
        line2 = vim.api.nvim_buf_get_mark(0, ">")[0],
        nargs = 1,
})
