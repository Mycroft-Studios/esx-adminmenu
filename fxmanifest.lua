fx_version 'cerulean'
game 'gta5'

description 'esx-adminMenu'
version '1.0.0'

ui_page 'html/index.html'

shared_scripts {
    'config.lua',
    '@es_extended/imports.lua',
    '@es_extended/locale.lua',
    'locales/*.lua',
}

client_scripts {
    '@menuv/menuv.lua',
    'client/noclip.lua',
    'client/blipsnames.lua',
    'client/client.lua',
    'client/events.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua'
}

files { -- Credits to https://github.com/LVRP-BEN/bl_coords for clipboard copy method
    'html/index.html',
    'html/index.js'
}

dependency 'menuv'

lua54 'yes'
