local status, hop = pcall(require, "hop")
if not status then return end

hop.setup {
    keys = 'etovxqpdygfblzhckisuran',
    quit_key = '<ESC>',
    jump_on_sole_occurrence = true,
    case_insensitive = true
}
