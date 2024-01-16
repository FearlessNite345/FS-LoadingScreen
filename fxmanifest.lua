fx_version 'cerulean'
game "gta5"
author "FearlessStudios"
version '1.1.1'
lua54 'yes'

loadscreen 'nui/index.html'
loadscreen_manual_shutdown 'yes'

client_script {
  'client/**',
}

server_script {
  "server/**",
}

shared_script {
  'config/**'
}

files {
  'nui/**',
}
