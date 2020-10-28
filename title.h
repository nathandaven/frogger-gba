
//{{BLOCK(title)

//======================================================================
//
//	title, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 136 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 4352 + 2048 = 6912
//
//	Time-stamp: 2020-10-20, 19:39:17
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_TITLE_H
#define GRIT_TITLE_H

#define titleTilesLen 4352
extern const unsigned short titleTiles[2176];

#define titleMapLen 2048
extern const unsigned short titleMap[1024];

#define titlePalLen 512
extern const unsigned short titlePal[256];

#endif // GRIT_TITLE_H

//}}BLOCK(title)
