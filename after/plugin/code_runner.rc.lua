local status, code_runner = pcall(require, "code_runner")
if not status then return end

code_runner.setup({
    filetype = {
        python = "python3 -u",
        c = "cd $dir && gcc $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
        cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
        sh = "bash",
        go = "go run",
        lua = "lua",
        julia = "julia"
    }
})
