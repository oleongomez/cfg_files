---@tag startup_nvim.headers
---@brief [[
--- This are headers which you can use to build your own startup.nvim theme.
---@brief ]]
local startup_headers = {}

local log = require("startup.log")

---a neovim banner
function startup_headers.neovim_banner()
    log.warn(
        "`headers.neovim_banner()` is deprecated. Use `headers.neovim_banner_header`"
    )
    return {
        [[                                          /$$              ]],
        [[                                         |__/              ]],
        [[ /$$$$$$$   /$$$$$$   /$$$$$$  /$$    /$$ /$$ /$$$$$$/$$$$ ]],
        [[| $$__  $$ /$$__  $$ /$$__  $$|  $$  /$$/| $$| $$_  $$_  $$]],
        [[| $$  \ $$| $$$$$$$$| $$  \ $$ \  $$/$$/ | $$| $$ \ $$ \ $$]],
        [[| $$  | $$| $$_____/| $$  | $$  \  $$$/  | $$| $$ | $$ | $$]],
        [[| $$  | $$|  $$$$$$$|  $$$$$$/   \  $/   | $$| $$ | $$ | $$]],
        [[|__/  |__/ \_______/ \______/     \_/    |__/|__/ |__/ |__/]],
    }
end

startup_headers.neovim_banner_header = {
    [[                                          /$$              ]],
    [[                                         |__/              ]],
    [[ /$$$$$$$   /$$$$$$   /$$$$$$  /$$    /$$ /$$ /$$$$$$/$$$$ ]],
    [[| $$__  $$ /$$__  $$ /$$__  $$|  $$  /$$/| $$| $$_  $$_  $$]],
    [[| $$  \ $$| $$$$$$$$| $$  \ $$ \  $$/$$/ | $$| $$ \ $$ \ $$]],
    [[| $$  | $$| $$_____/| $$  | $$  \  $$$/  | $$| $$ | $$ | $$]],
    [[| $$  | $$|  $$$$$$$|  $$$$$$/   \  $/   | $$| $$ | $$ | $$]],
    [[|__/  |__/ \_______/ \______/     \_/    |__/|__/ |__/ |__/]],
}

---a hydra
function startup_headers.hydra()
    log.warn("`headers.hydra()` is deprecated. Use `headers.hydra_header`")
    return {
        [[   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ]],
        [[    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ]],
        [[          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ]],
        [[           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ]],
        [[          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ]],
        [[   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ]],
        [[  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ]],
        [[ ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ]],
        [[ ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ]],
        [[      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ]],
        [[       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ]],
    }
end

startup_headers.hydra_header = {
    [[   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ]],
    [[    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ]],
    [[          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ]],
    [[           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ]],
    [[          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ]],
    [[   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ]],
    [[  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ]],
    [[ ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ]],
    [[ ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ]],
    [[      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ]],
    [[       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ]],
}

---a neovim `n`
function startup_headers.neovim_logo()
    log.warn(
        "`headers.neovim_logo()` is deprecated. Use `headers.neovim_logo_header`"
    )
    return {
        [[⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣄⠀⠀⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⣀⣶⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣷⣄⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⣀⣶⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣷⣄⠀⠀⠀]],
        [[⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣷⡀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣷⣄⠀]],
        [[⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠄⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣷]],
        [[⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡂⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿]],
        [[⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿]],
        [[⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿]],
        [[⠀⣿⣿⣿⣿⣿⣿⣿⣿⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿]],
        [[⠀⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿]],
        [[⠀⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⣿⣿⣿⣿⣿⣿⣿⣿]],
        [[⠀⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿]],
        [[⠀⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
        [[⠀⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
        [[⠀⢿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿]],
        [[⠀⠀⠙⢿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀]],
        [[⠀⠀⠀⠀⠙⢿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠙⢿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⡿⠋⠀⠀⠀⠀⠀]],
        [[⠀⠀⠀⠀⠀⠀⠀⠀⠙⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠋       ]],
    }
end

startup_headers.neovim_logo_header = {
    [[⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣄⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⣀⣶⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣷⣄⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⣀⣶⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣷⣄⠀⠀⠀]],
    [[⠀⠀⣠⣶⣿⣿⣿⣿⣿⣿⣿⣷⡀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣷⣄⠀]],
    [[⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠄⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣷]],
    [[⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡂⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⠀⣿⣿⣿⣿⣿⣿⣿⣿⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⠀⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣦⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⠀⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⠀⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⠀⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⠀⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
    [[⠀⢿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿]],
    [[⠀⠀⠙⢿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀]],
    [[⠀⠀⠀⠀⠙⢿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⡿⠋⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠙⢿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⡿⠋⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠙⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠋       ]],
}
startup_headers.mine_header = {
    [[⢕⠕⠅⠡⠁⡁⠂⠐⡀⠂⠠⠀⠄⢀⠀⠠⠐⢀⠢⢢⠐⡰⡡⡱⡱⡱⡡⡘⢄⠹⡺⣝⡾⡝⠀⢀⠠⢀⢎⠪⡢⢱⠨⡂⡑⠌⡂⡑⢀⠂⡐⠠⠐⠠⠀⠂⠊⠐⠅⡊⠔⡠]],
    [[⠁⠂⢁⠠⠀⡀⢀⢀⢀⠀⠀⠀⠀⠠⠐⡡⣈⢆⡎⡎⢎⢮⣜⣮⢎⢆⢇⠕⢅⠢⡹⢜⠄⡁⠄⠠⢠⠱⡘⡌⢎⢢⠣⡊⢆⢕⠐⢌⢐⢐⠀⡂⠡⠐⡈⠠⡁⣐⠀⠐⠀⠂]],
    [[⠠⡁⡢⡈⠆⠌⠢⠀⠂⠁⠀⠀⣀⢤⢯⣺⢮⣳⢽⣺⣿⣿⡳⡯⣻⡪⡐⢅⠢⡁⠎⡇⡧⡃⠀⢎⢢⢣⢣⢪⢪⢢⠣⡣⢱⠨⡊⡆⡂⡂⠅⢐⠀⠅⡀⠡⢐⠠⠙⢦⡑⣄]],
    [[⢜⠌⡢⠪⠈⠈⠀⠀⠀⠀⡀⣜⢮⢯⣳⣿⣿⣺⡿⣾⣿⣾⢽⣝⣞⣞⢜⢜⢸⢸⠸⢌⠪⡲⠱⠑⠑⡐⢁⢇⢕⢕⢱⢑⢕⢱⢑⢌⠆⡂⠅⡂⢅⠂⠄⠀⠐⢈⠐⡀⠑⢮]],
    [[⢕⠑⡁⠐⠈⠀⠀⡀⢂⣁⢺⣺⣿⣿⣿⣿⣻⣻⢽⡽⣻⢞⣷⡳⣧⢧⣳⠱⠡⡑⢅⠕⠈⡂⠅⠌⠠⠀⠅⢃⢾⡼⡱⣑⢭⢎⢢⡱⡘⢄⠕⡨⢐⠨⢂⢐⠈⡀⠀⠄⠁⠪]],
    [[⠕⠀⠄⠈⠀⡀⠄⣸⢱⢝⣷⣽⣿⣷⣿⡿⣿⣗⡗⡝⡜⡕⡿⣿⣿⢯⣞⢝⠕⡨⠂⠄⠀⠠⠈⠀⠂⠡⠐⢰⣿⣇⡗⣕⢕⢏⡎⡖⡅⠧⢌⠢⢑⢈⢂⢂⠅⡂⠄⠀⢂⠠]],
    [[⠀⡁⠄⠐⠀⡀⠒⡮⡷⣝⣾⣟⣯⣿⣿⢿⠫⣺⢱⢣⢣⢯⣻⣿⣿⢕⡏⢔⠡⠂⠐⠀⠠⠀⠂⡁⠂⡁⢂⢸⣿⣿⣮⣳⡕⡵⢝⡜⡌⡇⡇⡧⡣⡢⠢⡡⢂⠆⠅⠂⠠⠀]],
    [[⠀⠠⠐⡀⠡⠐⠽⢼⣾⣻⣿⡿⣿⡿⡫⠁⣐⢺⠠⢁⣳⣻⣿⣿⡹⠃⠌⠠⠡⠁⠀⠁⡀⠀⠄⠀⠅⡀⠂⡀⢟⣯⣿⣷⡽⡸⢊⠎⠎⠃⠩⠈⠪⠨⠈⠐⢐⠅⠅⠅⡀⠈]],
    [[⠀⠅⢂⠐⡈⣐⣐⢤⣫⣿⣟⢿⢝⠊⡀⣐⣘⣐⠁⢄⢮⢯⢿⡞⣎⠁⠄⢁⣅⠅⡀⠁⠀⢀⢠⣁⡐⠀⡂⠠⠐⠡⢟⠽⡃⠀⢄⢌⡢⡑⡀⠐⠀⠐⢀⠐⠀⠅⠕⡡⠀⠀]],
    [[⢈⠐⢀⢢⢬⢜⣞⢽⢾⣫⠟⠊⠅⠖⠉⠈⠊⠛⡻⡔⡕⡕⢝⢜⢔⢝⢜⢼⣿⣧⡄⢈⠀⡀⣾⣺⢄⡥⣢⠐⠨⡐⢄⢑⠠⠡⠳⠑⠂⠀⠈⠑⢄⡁⡀⠀⡀⠐⡡⢂⢂⠀]],
    [[⣀⡢⢬⢖⡶⣝⡾⡙⠉⠀⠀⠁⠀⢀⠄⠔⠒⠂⡀⠹⢸⣟⣾⢜⢌⢆⢇⣿⣿⣿⣿⢠⠀⡆⡬⣻⣗⣟⢎⠕⡱⡔⣰⢔⠁⠀⡐⠋⢁⢄⣅⠀⠀⢀⠀⠀⡀⠀⠠⢑⠔⡀]],
    [[⡔⡖⡽⣕⣯⢷⣧⣐⠀⠄⢶⣶⣆⠠⣫⢧⢦⡪⠮⠀⣹⣿⣿⣷⡑⣕⣿⣿⣿⢿⣾⢧⢣⢪⢺⣿⣟⠺⢔⠡⣓⣽⣺⢽⡀⠐⡕⡵⡵⣝⠎⢂⡵⣲⠆⠠⠀⡀⠀⢁⢊⠄]],
    [[⡊⡢⡑⠔⡜⢋⣿⣷⡉⠀⡀⠻⣿⣧⣦⣩⣩⣨⢄⠀⢘⣿⣿⡟⡼⣞⣿⣿⣻⣿⣿⡽⡪⡺⣽⢿⣿⠣⡑⢕⢆⢷⢽⡓⠁⠀⢨⡼⣬⣴⣮⣷⢟⠉⡠⠁⠠⠀⠠⠀⠂⠕]],
    [[⢌⠢⡊⠢⢐⢿⡷⡝⡷⡥⡠⠄⡈⠙⢛⠿⣟⣿⣥⣤⠀⢝⣿⣿⣼⢴⡹⣾⣿⣻⣿⢯⡳⣸⣺⣿⣯⠪⠌⡢⠱⡹⡜⡄⠀⣞⣝⣟⢟⡳⡍⡂⠐⠀⠄⠀⠂⡀⠄⠀⠐⢅]],
    [[⢅⠕⠌⢌⠐⣽⣗⢕⠕⡜⢀⢂⠠⣸⣪⢯⣗⣟⡿⣕⢌⢂⠙⡞⡮⡷⣝⣿⣿⣟⣷⢯⣚⢞⣞⡮⠧⡃⡂⢀⠁⠐⠑⢁⢀⢓⢗⡕⣗⢝⠮⣒⠔⡐⠠⠀⢁⠀⢀⠐⠀⠅]],
    [[⢅⢇⠑⠠⠀⠺⣯⢇⢣⢣⠡⡠⠘⡜⡼⣫⣺⣺⢽⢽⡸⠠⡱⣘⢽⣝⢾⣿⣻⡾⡯⠧⠗⣟⢾⢽⣕⢔⢈⢀⠐⠈⠀⠀⠢⡁⢇⡃⢇⢯⢹⢔⢅⢊⠈⠀⡀⢀⠀⠀⠀⠡]],
    [[⠕⡐⠈⠄⠡⡠⠃⢟⣜⢜⠜⡔⡄⢣⠱⢕⡺⡸⡜⡎⠊⡸⣕⣗⢷⢽⡿⡛⡉⢄⢂⢐⢐⠠⢈⠛⡆⡂⡂⠢⢀⠂⢀⠁⠀⢊⠔⡂⠑⡕⡅⡇⡑⠄⠅⠁⠀⠀⠀⠈⠀⠀]],
    [[⢐⠀⠅⠨⠀⢇⢧⠠⢸⡪⢪⠪⡸⠠⠈⠄⢢⢱⢱⠨⡰⣫⡺⡪⡯⡪⡪⡐⢌⢐⢐⢐⢄⢑⠀⡂⠌⠢⠨⡈⠢⡈⡂⠢⡀⠠⠈⠄⡀⠑⠜⡐⠌⢌⠀⡈⠀⠈⠀⠈⠀⡀]],
    [[⢀⠂⠡⠈⠄⢱⡱⣅⠐⠈⠂⢨⠂⠐⡀⢁⠢⡣⡑⠐⣝⢼⡸⡕⡕⢜⢌⠪⢐⢐⢐⢐⢐⢐⢐⠠⠈⠌⠢⠨⡈⠢⡈⡂⡂⠄⠀⠂⠀⠄⠀⡀⠐⠀⠠⠀⠀⠁⠀⠁⠀⠀]],
    [[⠐⡈⠄⠡⢈⢸⣞⣮⣗⣄⡁⠠⠀⠁⠄⠂⡱⡑⠀⡀⠣⠃⠀⢣⢃⢇⢂⠅⡂⡂⠢⠂⡂⠂⠂⠅⡊⢄⠁⠅⢌⢂⢂⠢⠨⠀⠠⠈⢀⠀⡁⠀⢀⠈⠀⡀⠈⠀⠈⠀⠈⠀]],
    [[⢐⠠⢈⠐⡠⠘⣿⣻⣷⢕⢿⣢⠀⠅⡠⢸⢸⠀⠄⢀⠠⡰⡸⣜⢌⢎⢢⠨⠐⡀⠡⠀⠄⠂⠁⠠⠐⠀⠅⠅⡂⡂⠢⠡⠁⠐⠀⠄⠀⠠⠀⢀⠀⠀⠄⠀⡀⠈⠀⠈⠀⡀]],
    [[⢐⠀⡂⡂⠌⡐⢽⣿⣿⣷⣝⡾⡰⣕⢡⢢⡳⡑⠁⠀⡘⡎⡗⡕⡇⡇⡕⢕⢅⠄⡐⢈⠀⠄⢁⢂⢅⢆⢤⢁⠢⠨⠨⠈⠄⢂⠁⡀⠂⠀⠄⠀⡀⠄⠠⠀⡀⠀⠁⢀⠁⠀]],
    [[⢐⠀⢂⠢⠨⢐⠑⣿⣿⣟⣯⣾⢽⠢⡱⡑⠅⠂⡨⡸⠰⡱⡸⡨⡪⣜⢜⢬⢢⢣⢒⢄⢂⠡⡸⡨⡲⡕⡧⡳⠅⠅⠅⠨⢨⢐⠨⡐⡀⠠⠀⢀⠠⠀⠄⠠⠀⠐⠈⠀⡀⠂]],
    [[⠠⠈⠄⠨⠠⠑⠨⠐⢝⣿⣿⣿⣟⠨⡂⡂⠅⡔⢜⠜⡄⠀⠳⡱⠁⠂⠀⠄⠁⡑⠣⠣⠳⠜⠜⠊⠁⠁⡀⠈⡈⢈⠀⠂⠸⡰⡅⣆⡢⠀⡀⠀⡀⠄⠂⠠⠈⠀⢀⠂⢀⠀]],
    [[⠨⠀⠅⠨⠀⠅⠨⠐⡀⠸⡯⡿⣳⢑⠐⠨⡪⢊⠎⡎⡪⡀⠂⢀⠠⠐⠀⠠⠀⢀⠠⠐⠀⠠⠀⠄⠂⠀⡀⠄⠀⡀⠀⡄⡇⡇⡙⢆⠣⡁⠀⠀⡀⠄⠂⠀⠂⠀⠄⠠⠀⠄]],
    [[⠨⠀⠅⠨⠀⠅⠨⠀⡂⢐⠀⠂⢣⢑⠸⠐⠔⠗⡓⣾⣾⡜⡌⡄⡀⢀⠠⠀⠄⠀⢀⠀⠄⠀⠄⠀⠠⠀⠀⢀⢀⢄⢎⢎⢎⠆⠪⠐⠁⠂⠁⠀⠠⠀⠈⠀⠐⠀⠐⠀⠄⠂]],
    [[⠈⠄⠡⠀⠅⠨⠀⠅⢐⠀⠄⠁⢘⢆⢌⢮⣬⣰⣐⢤⢁⢱⠱⣘⣬⣶⣴⣀⠀⠠⠀⠀⡀⠄⠀⠐⠀⡠⣸⣰⣱⣱⢱⡁⠄⡀⠄⠄⠄⠂⠄⠐⠀⠀⠁⠀⠂⠀⡁⠐⠀⠄]],
    [[⠀⡁⠠⠈⠄⠡⢈⢐⠀⡂⠐⠈⢈⠪⠐⡩⡛⠿⠿⢿⠿⠿⠿⠿⢿⣿⣿⣿⣦⠄⠀⠂⠀⠀⠐⣠⣾⣿⡿⠟⢋⠛⠣⠑⠀⠐⠀⡂⠌⠀⠁⡈⠀⠈⠀⠐⠈⠀⠀⠄⠁⡀]],
    [[⠀⠠⠐⠈⠄⡁⠄⢐⠐⠄⠂⠈⢘⢜⢌⢄⢢⢑⢌⢰⢨⢨⠰⡨⣠⣨⡙⡛⢝⣋⢆⠀⠐⢀⣼⣿⣦⣀⠐⢈⠠⠀⠂⠄⠂⡁⠂⡀⠂⡁⠂⠠⠐⠀⠁⠀⠐⠀⢁⠀⠂⠀]],
    [[⠀⠂⠠⠁⠂⠀⢐⠀⠅⠅⠂⢁⠀⢌⢔⠑⢑⢑⠝⡛⢟⠻⡛⢿⣿⣿⣿⣿⣿⣿⣗⠅⠀⡾⡿⣿⣿⣿⣿⣦⣔⡈⠐⡈⠄⠂⢁⠀⠁⡀⠐⠀⢀⠠⠐⠈⠀⠁⡀⠄⠈⡀]],
    [[⠀⢐⠈⠄⠁⠈⡀⢂⠡⡑⠈⢀⠀⠂⠕⠕⠕⠅⡇⡣⣷⣷⣿⣿⣿⣿⣿⣿⣿⣽⢮⠃⢸⢸⢯⢛⢝⢿⣿⣟⢿⣿⣷⣄⠂⡁⠄⠈⠄⠂⠀⠈⠀⠀⠀⡀⠈⡀⠄⠀⠂⠀]],
    [[⠀⡂⠐⠀⠂⢁⠐⡐⡐⠨⠀⠄⢀⠁⡀⠈⡀⠡⠱⡑⡿⣿⣿⢿⢿⠫⢭⠍⠇⠃⢁⠀⠀⠁⠊⠊⠊⠖⢜⢜⢕⢍⠛⡛⠀⠂⡈⠀⠂⠀⠁⠀⠂⠀⠂⢀⠀⠠⠐⠈⠠⠁]],
    [[⠐⠀⠐⠀⠨⢀⢂⠢⠨⡨⠀⠂⡀⠄⠠⠀⢀⠀⠁⠊⠌⠌⠌⠊⠐⢉⢀⠠⠠⢐⢀⢂⠨⢀⠠⠀⢄⡄⣄⣀⠁⠁⠁⠠⠈⠠⠀⠈⠀⡀⠁⠀⠐⠀⢀⠀⠐⠀⠐⠀⠂⠈]],
    [[⠀⠁⡀⠡⡘⡐⠄⡅⠕⢄⠡⠀⠄⢐⠀⠂⠀⠀⡐⡐⢄⠄⢄⣢⣵⣻⣽⢯⣮⡶⣖⢢⠡⣑⢐⡽⣵⣯⡷⣯⣷⣦⣆⣄⠄⠠⠐⠈⠀⠀⢀⠈⠀⡀⠀⢀⠈⡀⢁⠀⡁⠄]],
    [[⠀⠂⠐⡌⠢⡨⢂⠪⠨⠂⠠⠐⠀⢅⠀⠂⠁⠀⠐⣼⣞⣿⣻⡿⣾⢯⣗⢵⣟⣯⢯⡯⡇⣿⣗⣿⢷⣯⡿⣷⢿⡾⣯⢿⣝⠄⡀⠀⠠⠈⠀⠀⠀⢀⠀⢀⠀⠠⠀⠀⠄⠀]],
    [[⠀⢄⠱⠨⡨⢐⢑⠨⠨⠨⠀⠐⢈⢂⠅⠐⠀⢈⢼⣯⣿⣽⣯⣿⣻⡿⣞⣿⢯⣿⣽⣺⣳⢽⣾⣻⣟⢮⣿⣻⣟⢟⣿⢯⡪⢃⠔⠀⠀⠠⠀⠰⡁⠤⠠⣀⠀⠐⠈⡀⠄⠁]],
    [[⡰⡑⢅⠕⡨⢐⠐⢄⠣⡁⠄⠁⢌⠔⡨⡀⠈⣐⢿⣺⡷⣿⣞⣯⡷⣻⢯⣟⣿⣗⣗⡗⣗⡿⣯⡿⣕⢻⣕⣯⢫⡳⣭⢻⠯⠠⠁⠀⠐⡐⠊⠀⢱⠀⢀⠔⠀⠀⠂⢀⠀⠂]],
    [[⡪⡊⠢⡑⠨⠠⡑⡡⢊⠄⡀⠈⢔⠨⢐⢐⠀⠡⣰⢟⠍⣽⠞⢃⢯⢯⣻⢽⣗⢿⣽⡆⢱⢋⢿⡇⡿⠐⡽⣾⡀⠩⢊⢕⠕⠂⠀⠈⠀⠈⠢⠄⠎⢎⠈⠐⠢⠀⠐⠀⠀⠂]],
    [[⡪⢊⠢⠨⡨⢊⠔⢌⠢⢁⠂⢀⢑⠨⠂⡅⠅⡀⢁⠀⠀⠀⠀⠎⡞⡹⢮⣻⠅⢻⢵⠄⠀⢸⣭⢳⢹⠀⠍⡇⡇⠀⠡⠄⡣⠀⠁⠀⠐⠀⠠⠃⠀⠘⡄⣀⠀⠁⠀⠀⢁⠀]],
    [[⡪⢂⢑⠡⡂⢅⠊⢔⠡⡂⠅⠀⠢⠡⡑⠌⡂⠠⠀⠠⢈⠀⠈⢠⠁⠗⠠⠑⡇⢸⢹⠀⠠⠑⢼⢸⠸⠀⠁⡇⠇⠀⠀⠀⠨⠀⠀⠂⠀⠄⠀⠄⠀⠊⠸⡀⠀⠀⠂⠁⠀⠀]],
    [[⡪⠐⢌⠔⠨⡂⢅⠕⡐⠌⠄⠂⠅⡣⢐⢑⠌⡠⠂⠐⠀⢅⠄⠀⢕⠁⠄⢁⠀⠘⠈⠀⠀⠂⠂⠌⠠⠀⠘⠀⠀⠀⠀⠂⠀⠑⠀⠠⠀⠀⡀⠀⡀⠠⠀⠀⠀⡀⠀⡀⠀⠀]],
}
return startup_headers
