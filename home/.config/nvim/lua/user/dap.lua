--[[ local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
    return
end ]]

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
    return
end

local dap_python_status_ok, dap_python = pcall(require, "dap-python")
if not dap_python_status_ok then
    return
end

dapui.setup {
    layouts = {
        {
            elements = {
                "breakpoints",
                "scopes",
            },
            size = 40,
            position = "left"
        },
        {
            elements = {
                "console"
            },
            size = 0.25,
            position = "bottom"
        }
    }
}
dap_python.setup ("/usr/bin/python", {})
