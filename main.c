/*

Done
2 Sprites (both animated)
- Player
- Zombie

2 simultaneous background during game state
- the ground
- background with the moon

6 States
- Start
- Instructions
- Game
- Pause
- Win
- Lose

Sounds
- In game state, the BGM and zombie dying sound (when killed) is played simultaneously
- The game state BGM loops

Cheat: Press Up button over five times in the Menu screen (Start state)
- Different BGM!

Background is copied from some other resource, but other sprites needed a lot of editing to fit into this game.
I personally like how the ! symbol is displayed when the enemy notices the player. (Like Metal Gear Solid).
Lose state is an homage to Dark Souls series.

I don't see any bugs, but if you notice, please let me know!

Thank you, TAs and Professor.
*/

#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include "myLib.h"
#include "game.h"
#include "text.h"
#include "sound.h"

#include "bgStart.h"

#include "bgStart1.h"
#include "bgStart2.h"

#include "bgInst.h"
#include "bgGame.h"
#include "bgGame2.h"
#include "bgPause.h"
#include "bgWin.h"
#include "bgLose.h"
#include "spritesheet.h"

#include "thriller8bit.h"
#include "startBGM.h"
#include "loseBGM.h"
#include "cheatBGM.h"

#include "MJWin.h"
//Prototypes
void initialize();

//State Prototypes
void goToStart1();
void start1();
void goToStart2();
void start2();
void goToInst();
void inst();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

char scoreBuffer[30];
SOUND soundA;
SOUND soundB;

//States
enum {START1, START2, INST, GAME, PAUSE, WIN, LOSE};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
        switch(state) {

            case START1:
                start1();
                break;
            case START2:
            	start2();
            	break;
            case INST:
            	inst();
            	break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }
               
    }
}

//Sets up GBA
void initialize() {
	//Set up the sprites
	DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen/2);
    hideSprites();

    setupSounds();
    setupInterrupts();

	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
	playSoundA(startBGM, STARTBGMLEN, STARTBGMFREQ, 1);

	goToStart1();
}

void goToStart1() {

	REG_DISPCTL = MODE0 | BG0_ENABLE;

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

	DMANow(3, bgStart1Pal, PALETTE, bgStart1PalLen / 2);
	DMANow(3, bgStart1Tiles, CHARBLOCK, bgStart1TilesLen / 2);
	DMANow(3, bgStart1Map, &SCREENBLOCK[31], bgStart1MapLen / 2);
	REG_BG0CNT = BG_SIZE_SMALL | BG_4BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

	state = START1;
}

void start1() {

	if (BUTTON_PRESSED(BUTTON_A)) {
		if (cheat == 0) {
			playSoundA(thriller8bit, THRILLER8BITLEN, THRILLER8BITFREQ, 1);
		} else {
			playSoundA(cheatBGM, CHEATBGMLEN, CHEATBGMFREQ, 1);
		}

		initGame();
		goToGame();
	}
	if (BUTTON_PRESSED(BUTTON_DOWN)) {
		goToStart2();
	}
	if (BUTTON_PRESSED(BUTTON_UP)) {
		cheatCount++;
	}
	if (cheatCount >= 5) {
		cheat = 1;
	}
}

void goToStart2() {

	DMANow(3, bgStart2Pal, PALETTE, bgStart2PalLen / 2);
	DMANow(3, bgStart2Tiles, CHARBLOCK, bgStart2TilesLen / 2);
	DMANow(3, bgStart2Map, &SCREENBLOCK[31], bgStart2MapLen / 2);
	REG_BG0CNT = BG_SIZE_SMALL | BG_4BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

	state = START2;
}

void start2() {

	if (BUTTON_PRESSED(BUTTON_UP)) {
		goToStart1();
	}

	if (BUTTON_PRESSED(BUTTON_A)) {
		goToInst();
	}
}

void goToInst() {
	REG_DISPCTL = MODE0 | BG0_ENABLE;

	hOff = 0;
	vOff = 0;
	DMANow(3, bgInstPal, PALETTE, bgInstPalLen / 2);
	DMANow(3, bgInstTiles, CHARBLOCK, bgInstTilesLen / 2);
	DMANow(3, bgInstMap, &SCREENBLOCK[31], bgInstMapLen / 2);

	state = INST;
}

void inst() {
	if (BUTTON_PRESSED(BUTTON_START)) {
		goToStart1();
	}
}

void goToGame() {
	REG_DISPCTL = MODE0 | BG1_ENABLE | BG2_ENABLE | SPRITE_ENABLE;

	unpauseSound();

    DMANow(3, bgGame2Pal, PALETTE, bgGame2PalLen / 2);
	DMANow(3, bgGame2Tiles, &CHARBLOCK[2], bgGame2TilesLen / 2);
	DMANow(3, bgGame2Map, &SCREENBLOCK[30], bgGame2MapLen / 2);
	REG_BG2CNT = BG_SIZE_WIDE | BG_CHARBLOCK(2) | BG_SCREENBLOCK(30);

	DMANow(3, bgGameTiles, &CHARBLOCK[3], bgGameTilesLen / 2);
	DMANow(3, bgGameMap, &SCREENBLOCK[28], bgGameMapLen / 2);
	REG_BG1CNT = BG_SIZE_WIDE | BG_CHARBLOCK(3) | BG_SCREENBLOCK(28);
	
	state = GAME;
}

void game() {
	updateGame();
	drawGame();
	if (BUTTON_PRESSED(BUTTON_START)) {
		goToPause();
	}
	if (player.worldCol >= MAPWIDTH - player.width) {
		goToWin();
	}
	if (player.dead) {
		stopSound();
		playSoundA(loseBGM, LOSEBGMLEN, LOSEBGMFREQ, 0);
		goToLose();
	}
}

void goToPause() {
	hideSprites();
	REG_DISPCTL = MODE0 | BG0_ENABLE;

	DMANow(3, bgPausePal, PALETTE, bgPausePalLen / 2);
	DMANow(3, bgPauseTiles, CHARBLOCK, bgPauseTilesLen / 2);
	DMANow(3, bgPauseMap, &SCREENBLOCK[31], bgPauseMapLen / 2);
	REG_BG0CNT = BG_SIZE_SMALL | BG_4BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

	pauseSound();

	state = PAUSE;
}

void pause() {
	if (BUTTON_PRESSED(BUTTON_START)) {
		goToGame();
	} else if (BUTTON_PRESSED(BUTTON_SELECT)) {
		goToStart1();
	}
}

void goToWin() {
	extern int score;
	hideSprites();
	REG_DISPCTL = MODE4 | BG2_ENABLE;
    DMANow(3, MJWinPal, PALETTE, 256);	
    drawFullscreenImage4(MJWinBitmap);

	drawString4(50, 178, "WIN", 255);
	drawString4(SCREENHEIGHT / 2, 150, "SCORE: ", 255);
	if (score < 0) {
		score = 0;
	}
	sprintf(scoreBuffer, "%d", score);
	if (cheat) {
		drawString4(SCREENHEIGHT / 2, 150 + 6 * 7, "0", 255);
	} else {
		drawString4(SCREENHEIGHT / 2, 150 + 6 * 7 , scoreBuffer, 255);		
	}
	drawString4(120, 80, "PRESS START TO GO TO MENU", 255);
	state = WIN;
}

void win() {
	if (BUTTON_PRESSED(BUTTON_START)) {
		playSoundA(startBGM, STARTBGMLEN, STARTBGMFREQ, 0);
		goToStart1();
	}
}

void goToLose() {
	hideSprites();
	REG_DISPCTL = MODE0 | BG0_ENABLE;
	DMANow(3, bgLosePal, PALETTE, bgLosePalLen / 2);
	DMANow(3, bgLoseTiles, CHARBLOCK, bgLoseTilesLen / 2);
	DMANow(3, bgLoseMap, &SCREENBLOCK[31], bgLoseMapLen / 2);
	REG_BG0CNT = BG_SIZE_SMALL | BG_4BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

	state = LOSE;
}

void lose() {
	if (BUTTON_PRESSED(BUTTON_START)) {
		playSoundA(startBGM, STARTBGMLEN, STARTBGMFREQ, 0);
		goToStart1();
	}
}