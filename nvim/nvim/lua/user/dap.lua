local dap = require("dap")
local dapui = require("dapui")
dapui.setup({
    icons = { collapsed = "⮞", expanded = "⮟" },
    sidebar = {
        elements = {
            { id = "breakpoints", size = 0.1 },
            { id = "stacks", size = 0.25 },
            { id = "watches", size = 0.1 },
            { id = "scopes", size = 0.55 },
        },
        size = 44,
        tray = {
            size = 8,
        },
    }
})

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

dap.adapters.python = {
    type = "executable";
    command = "python";
    args = { "-m", "debugpy.adapter" };
}
dap.configurations.python = {
    {
        type = "python";
        request = "launch";
        name = "Launch file";

        program = "/home/user/Rare/rare/__main__.py";
        pythonPath = "/usr/bin/python";
    },
}
