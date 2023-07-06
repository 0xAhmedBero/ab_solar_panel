fx_version 'cerulean'
game 'gta5'

author 'ahmed bero'
description 'solar panel'
version '1.0.0'

lua54 'yes'

-- Specify the main script file for your resource
client_script 'client.lua'
server_script 'server.lua'

shared_script '@ox_lib/init.lua'


--[[

-- Define the files that should be included in the resource
files {
    'html/index.html',
    'html/script.js',
    'html/style.css',
}

-- Add any dependencies that your resource requires
dependencies {
    'essentialmode',
    'mysql-async'
}

-- Specify the NUI page to load
ui_page 'html/index.html'
]]