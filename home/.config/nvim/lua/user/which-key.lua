local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

which_key.register({
    f = {
        name = "File",
        f = "Find file",
        p = "Open projects"
    },
    d = {
        name = "Dap",
        b = "Toggle breakpoint",
        c = "Continue",
        i = "Step into",
        l = "Run last",
        O = "Step out",
        o = "Step over",
        r = "Toggle REPL",
        t = "Terminate",
        u = "Toggle UI",
        e = "Evaluate word"
    },
    r = "Refactor",
    s = "Show line diagnostics",
    t = "Toggle floating terminal",
    n = "Toggle NvimTree",
}, { prefix = "<leader>" })

which_key.register({
    g = {
        c = "Toggle linewise comment",
        b = "Toggle blockwise comment"
    }
})
