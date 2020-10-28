
//{{BLOCK(win)

//======================================================================
//
//	win, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 102 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 3264 + 2048 = 5824
//
//	Time-stamp: 2020-10-22, 16:40:23
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WIN_H
#define GRIT_WIN_H

#define winTilesLen 3264
extern const unsigned short winTiles[1632];

#define winMapLen 2048
extern const unsigned short winMap[1024];

#define winPalLen 512
extern const unsigned short winPal[256];

#endif // GRIT_WIN_H

//}}BLOCK(win)
