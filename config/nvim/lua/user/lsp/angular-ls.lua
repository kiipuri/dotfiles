local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

local npm_path = "/home/kiipuri/.local/share/npm/"

local cmd = { npm_path .. "bin/ngserver", "--stdio",
    "--tsProbeLocations", npm_path .. "lib/node_modules/typescript/", "--ngProbeLocations",
    npm_path .. "/lib/node_modules/@angular/language-server/node_modules/@angular/language-service/" }

lspconfig.angularls.setup {
    cmd = cmd,
    on_new_config = function(new_config)
        new_config.cmd = cmd
    end
}
