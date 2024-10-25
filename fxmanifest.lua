fx_version 'cerulean'
game 'gta5'
description 'Weapon dealer script af Fisken'
lua54 'yes'
author 'Fisken'
version '1.0.0'

shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'shared/*.jua',
    'locales/locales.lua',
    'locales/*.lua'
}

client_scripts {
    './shared/*.lua',
    'client/*.lua',
    'locales/locales.lua',
    'locales/*.lua'
}

server_scripts {
    './shared/*.lua',
    'server/*.lua',
    'locales/locales.lua',
    'locales/*.lua'
}

dependencies {
	'es_extended'
}

files {
	'stream/playerhouse_hotel/playerhouse_hotel.ytyp',
	'stream/playerhouse_tier3/playerhouse_tier3.ytyp',
    'stream/playerhouse_tier1/playerhouse_tier1.ytyp'
}

data_file 'DLC_ITYP_REQUEST' 'stream/v_int_20.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/playerhouse_hotel/playerhouse_hotel.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/playerhouse_tier1/playerhouse_tier1.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/playerhouse_tier3/playerhouse_tier3.ytyp'

escrow_ignore {
  './shared/*.lua',
}