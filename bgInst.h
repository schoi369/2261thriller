
//{{BLOCK(bgInst)

//======================================================================
//
//	bgInst, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 389 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 12448 + 2048 = 15008
//
//	Time-stamp: 2018-12-03, 23:44:14
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BGINST_H
#define GRIT_BGINST_H

#define bgInstTilesLen 12448
extern const unsigned short bgInstTiles[6224];

#define bgInstMapLen 2048
extern const unsigned short bgInstMap[1024];

#define bgInstPalLen 512
extern const unsigned short bgInstPal[256];

#endif // GRIT_BGINST_H

//}}BLOCK(bgInst)
