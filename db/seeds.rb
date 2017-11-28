# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Platform.create([
  {
    "api_id": 3,
    "name": "Linux",
    "photo": "images.igdb.com/igdb/image/upload/t_thumb/pilogm8rythuvcg4cslx.jpg",
    "url": "https://www.igdb.com/platforms/linux",
  },
  {
    "api_id": 4,
    "name": "Nintendo 64",
    "url": "https://www.igdb.com/platforms/n64",
    "generation": 5,
  },
  {
    "api_id": 5,
    "name": "Wii",
    "photo": "images.igdb.com/igdb/image/upload/t_thumb/v5dyn1jxgkoqmnng7jpf.jpg",
    "url": "https://www.igdb.com/platforms/wii",
    "generation": 7,
  },
  {
    "api_id": 6,
    "name": "PC (Microsoft Windows)",
    "photo": "images.igdb.com/igdb/image/upload/t_thumb/e9w12ei09dljpsiwz7pv.jpg",
    "url": "https://www.igdb.com/platforms/win",
  },
  {
    "api_id": 7,
    "name": "PlayStation",
    "photo": "images.igdb.com/igdb/image/upload/t_thumb/ptlxti6tzdpma71s5tkm.jpg",
    "url": "https://www.igdb.com/platforms/ps",
    "generation": 5,
  },
  {
    "api_id": 8,
    "name": "PlayStation 2",
    "photo": "images.igdb.com/igdb/image/upload/t_thumb/i3giprz2ekmbt9vxfdh5.jpg",
    "url": "https://www.igdb.com/platforms/ps2",
    "generation": 6,
  },
  {
    "api_id": 9,
    "name": "PlayStation 3",
    "photo": "images.igdb.com/igdb/image/upload/t_thumb/m8syn0cuupt7skqtghuz.jpg",
    "url": "https://www.igdb.com/platforms/ps3",
    "generation": 7,
  },
  {
    "api_id": 11,
    "name": "Xbox",
    "photo": "images.igdb.com/igdb/image/upload/t_thumb/amc434vnchq0cssuy17g.jpg",
    "url": "https://www.igdb.com/platforms/xbox",
    "generation": 6,
  },
  {
    "api_id": 12,
    "name": "Xbox 360",
    "url": "https://www.igdb.com/platforms/xbox360",
    "generation": 7,
  },
  {
    "api_id": 13,
    "name": "PC DOS",
    "photo": "images.igdb.com/igdb/image/upload/t_thumb/eol7qkkbbo6fmguuuemm.jpg",
    "url": "https://www.igdb.com/platforms/dos",
  },
  {
    "api_id": 14,
    "name": "Mac",
    "photo": "images.igdb.com/igdb/image/upload/t_thumb/uplojim9a0xki7fdcif8.jpg",
    "url": "https://www.igdb.com/platforms/mac",
  },
  {
    "api_id": 15,
    "name": "Commodore C64/128",
    "url": "https://www.igdb.com/platforms/c64",
  },
  {
    "api_id": 16,
    "name": "Amiga",
    "url": "https://www.igdb.com/platforms/amiga",
  },
  {
    "api_id": 18,
    "name": "Nintendo Entertainment System (NES)",
    "photo": "images.igdb.com/igdb/image/upload/t_thumb/lw8btnttipihkxxd4z9b.jpg",
    "url": "https://www.igdb.com/platforms/nes",
    "generation": 3,
  },
  {
    "api_id": 19,
    "name": "Super Nintendo Entertainment System (SNES)",
    "photo": "images.igdb.com/igdb/image/upload/t_thumb/nqrluqtict46fjfwebkv.jpg",
    "url": "https://www.igdb.com/platforms/snes--1",
    "generation": 4,
  },
  {
    "api_id": 20,
    "name": "Nintendo DS",
    "photo": "images.igdb.com/igdb/image/upload/t_thumb/mzyp4uwiyorjqskgzrmj.jpg",
    "url": "https://www.igdb.com/platforms/nds",
    "generation": 7,
  },
  {
    "api_id": 21,
    "name": "Nintendo GameCube",
    "photo": "images.igdb.com/igdb/image/upload/t_thumb/c9s0knwiwmy0nohd5h62.jpg",
    "url": "https://www.igdb.com/platforms/ngc",
    "generation": 6,
  },
  {
    "api_id": 22,
    "name": "Game Boy Color",
    "photo": "images.igdb.com/igdb/image/upload/t_thumb/uvq2ugd4uhhdecklozdd.jpg",
    "url": "https://www.igdb.com/platforms/gbc",
    "generation": 5,
  },
  {
    "api_id": 23,
    "name": "Dreamcast",
    "photo": "images.igdb.com/igdb/image/upload/t_thumb/pj6p7nmyctusjiabjtrg.jpg",
    "url": "https://www.igdb.com/platforms/dc",
    "generation": 6,
  },
  {
    "api_id": 24,
    "name": "Game Boy Advance",
    "photo": "images.igdb.com/igdb/image/upload/t_thumb/cv5cil3p4qztffdjxfcq.jpg",
    "url": "https://www.igdb.com/platforms/gba",
    "generation": 6,
  },
  {
    "api_id": 25,
    "name": "Amstrad CPC",
    "photo": "images.igdb.com/igdb/image/upload/t_thumb/yks0aeiimnxuffovjuih.jpg",
    "url": "https://www.igdb.com/platforms/acpc",
  },
  {
    "api_id": 26,
    "name": "ZX Spectrum",
    "url": "https://www.igdb.com/platforms/zxs",
  },
  {
    "api_id": 27,
    "name": "MSX",
    "url": "https://www.igdb.com/platforms/msx",
  },
  {
    "api_id": 29,
    "name": "Sega Mega Drive/Genesis",
    "photo": "images.igdb.com/igdb/image/upload/t_thumb/ubpm8f0b34akrxex8b58.jpg",
    "url": "https://www.igdb.com/platforms/smd",
    "generation": 4,
  },
  {
    "api_id": 30,
    "name": "Sega 32X",
    "url": "https://www.igdb.com/platforms/sega32",
    "generation": 4,
  },
  {
    "api_id": 32,
    "name": "Sega Saturn",
    "photo": "images.igdb.com/igdb/image/upload/t_thumb/zedfg10bisqshzrfcuzn.jpg",
    "url": "https://www.igdb.com/platforms/saturn",
    "generation": 5,
  },
  {
    "api_id": 33,
    "name": "Game Boy",
    "photo": "images.igdb.com/igdb/image/upload/t_thumb/sd2n5b9gwfbwizeqpfgc.jpg",
    "url": "https://www.igdb.com/platforms/gb",
    "generation": 4,
  }
])
