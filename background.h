
//{{BLOCK(background)

//======================================================================
//
//	background, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 59 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1888 + 2048 = 4448
//
//	Time-stamp: 2020-10-22, 16:37:16
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BACKGROUND_H
#define GRIT_BACKGROUND_H

#define backgroundTilesLen 1888
extern const unsigned short backgroundTiles[944];

#define backgroundMapLen 2048
extern const unsigned short backgroundMap[1024];

#define backgroundPalLen 512
extern const unsigned short backgroundPal[256];

#endif // GRIT_BACKGROUND_H

//}}BLOCK(background)
