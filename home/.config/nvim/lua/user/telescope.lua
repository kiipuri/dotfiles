local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

telescope.setup {
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
        }
    },
    pickers = {
        find_files = {
            find_command = { "fd", "--strip-cwd-prefix", "--ignore-file", "~/.config/fd/ignore" }
        }
    }
}
telescope.load_extension"projects"
telescope.load_extension"fzf"
