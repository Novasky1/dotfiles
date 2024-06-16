return {
    { "Mofiqul/vscode.nvim" },
    { "Mofiqul/adwaita.nvim" },
    { "nyoom-engineering/oxocarbon.nvim" },
    {
        "rose-pine/neovim",
        name = 'rose-pine',
        opts = {
            groups = {
                background = "#171717",
            },
        },
    },
    {
        "LazyVim/LazyVim",
        opts = { colorscheme = "catppuccin" },
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        opts = {
            -- transparent_background = true,
            flavour = "mocha",
            color_overrides = {
                mocha = {
                    red = "#ff2c13",
                    green = "#FFFF00",
                    peach = "#878787", -- color del require
                    blue = "#808080",
                    mauve = "#00FFFF",
                    sky = "#50e6e6",
                    pink = "#e781d6",

                    maroon = "#ff3ffd",
                    teal = "#43c383",
                    yellow = "#d8e77b",
                    lavender = "#878787", --color de variable
                    flamingo = "#8861dd",
                    sapphire = "#43c3c3",
                    rosewater = "#C0C0C0", --color celeste chido

                    text = "#e7e7e7",
                    subtext1 = "#dbdbdb",
                    subtext2 = "#cacaca",

                    overlay2 = "#b2b5b3",
                    overlay1 = "#a8aba9",
                    overlay0 = "#ffd6e0", --- color de texto en codigo

                    surface2 = "#353331",
                    surface1 = "#2f2e2d",
                    surface0 = "#2c2a2a",

                    base = "#000000",
                    mantle = "#111111",
                    crust = "#000000",
                  },
            },
        },
    },
}
