#include "myLib.h"
#include "game.h"
#include "zombiedeath.h"
#include "sound.h"

//Variables
int hOff;
int vOff;
OBJ_ATTR shadowOAM[128];
PLAYER player;
ZOMBIE zombies[ZOMBIECOUNT];
int kills;

int cheatCount;
int cheat;


int steps;
int zombieTimeCount;

int score;

enum { RIGHTWALK, LEFTWALK, RIGHTPUNCH, LEFTPUNCH, DANCE, IDLE };

void initGame() {
	hOff = 0;
	vOff = 96;
	REG_BG1VOFF = vOff;
    kills = 0;

    score = 100000;
    initPlayer();
    initZombies();
}

void updateGame() {
    updatePlayer();
    for (int i = 0; i < ZOMBIECOUNT; i++) {
        updateZombie(&(zombies[i]));
    }
    score = score - 10;
}

void drawGame() {
    drawPlayer();
    drawZombies();

    shadowOAM[8].attr0 = 10 | ATTR0_WIDE;
    shadowOAM[8].attr1 = 10 | ATTR1_SMALL;
    shadowOAM[8].attr2 = ATTR2_TILEID(0, 18);

    shadowOAM[7].attr0 = 10 | ATTR0_SQUARE;
    shadowOAM[7].attr1 = 40 | ATTR1_TINY;
    shadowOAM[7].attr2 = ATTR2_TILEID(kills, 17);

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    REG_BG1HOFF = hOff;
    REG_BG2HOFF = hOff / 2;
}

void initPlayer() {
    player.screenRow = 100;
    player.screenCol = 10;
    player.worldRow = 100 + 96;
    player.worldCol = 10;
    player.cdel = 1;
    player.width = 16;
    player.height = 32;
    player.dancing = 0;
    player.attack = 0;
    player.right = 1;
    player.dead = 0;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFramesWalk = 8;
    player.numFramesPunch = 3;
    player.numFramesDance = 10;
    player.aniState = IDLE;
}

void updatePlayer() {

    if (player.aniState != IDLE) {
        player.prevAniState = player.aniState;
        player.aniState = IDLE;
    }

    if (player.aniCounter % 10 == 0) {
        player.curFrame++;
        if (player.prevAniState == RIGHTWALK || player.prevAniState == LEFTWALK) {
            if (player.curFrame == player.numFramesWalk) {
                player.curFrame = 0;
            }
        } else if (player.prevAniState == DANCE) {
            if (player.curFrame == player.numFramesDance) {
                player.curFrame = 0;
            }
        } else if (player.prevAniState == RIGHTPUNCH || LEFTPUNCH) {
            if (player.curFrame == player.numFramesPunch) {
                player.curFrame = 0;
            }
        }
    }

    if (BUTTON_HELD(BUTTON_LEFT) && player.dancing == 0 && player.attack == 0) {
        if (player.worldCol > 0) {
            player.worldCol -= player.cdel;
            player.right = 0;
            if (player.worldCol + player.width / 2 > SCREENWIDTH / 2
                && player.worldCol + player.width / 2 < MAPWIDTH - SCREENWIDTH / 2) {
                hOff -= player.cdel;
            }
        }
        player.aniState = LEFTWALK;
    }
    if (BUTTON_HELD(BUTTON_RIGHT) && player.dancing == 0 && player.attack == 0) {
        if (player.worldCol + player.width < MAPWIDTH) {
            player.worldCol += player.cdel;
            player.right = 1;
            if (player.worldCol + player.width / 2 > SCREENWIDTH / 2
                && player.worldCol + player.width / 2 < MAPWIDTH - SCREENWIDTH / 2) {
                hOff += player.cdel;
            }
        }
        player.aniState = RIGHTWALK;
    }

    player.screenCol = player.worldCol - hOff;

    if (BUTTON_HELD(BUTTON_B)) {
        player.dancing = 1;
        player.aniState = DANCE;
    } else {
        player.dancing = 0;
    }

    for (int i = 0; i < ZOMBIECOUNT; i++) {
        if (zombies[i].noticed == 1) {
            if ((zombies[i].right == 1 && player.worldCol - zombies[i].worldCol < 8)
                || (zombies[i].right == 0 && zombies[i].worldCol - player.worldCol < 8)) {
                if (cheat == 0) {
                    player.dead = 1;
                }
            }
        }
    }

    if (BUTTON_HELD(BUTTON_A)) {
        player.attack = 1;
        player.curFrame = 0;
        if (player.right == 1) {
            player.aniState = RIGHTPUNCH;
        } else {
            player.aniState = LEFTPUNCH;
        }
    } else {
        player.attack = 0;
    }

    if (player.aniState == IDLE) {
        player.curFrame = 0;
    } else {
        player.aniCounter++;
    }
}

void drawPlayer() {
    shadowOAM[0].attr0 = (ROWMASK & player.screenRow) | ATTR0_TALL;
    shadowOAM[0].attr1 = (COLMASK & player.screenCol) | ATTR1_MEDIUM;
    shadowOAM[0].attr2 = ATTR2_TILEID(player.aniState * 4, player.curFrame * 2);
}


void initZombies() {
    for (int i = 0; i < ZOMBIECOUNT; i++) {
        zombies[i].screenRow = 100;
        zombies[i].screenCol = 120 + 80 * i;
        zombies[i].worldRow = 100 + 96;
        zombies[i].worldCol = 120 + 80 * i;
        zombies[i].cdel = 1;
        zombies[i].width = 16;
        zombies[i].height = 32;
        zombies[i].right = 0;
        zombies[i].noticed = 0;
        zombies[i].active = 1;
        zombies[i].timeCount = 0;
        zombies[i].steps = 0;
        zombies[i].curFrame = 0;
        zombies[i].aniCounter = 0;
        zombies[i].numFramesDance = 10;
    }
}

void updateZombie(ZOMBIE* z) {
    if (z->aniCounter % 10 == 0) {
        z->curFrame++;
        
        if (z->curFrame == z->numFramesDance) {
            z->curFrame = 0;
        }
    }

    z->aniCounter++;

    if (z->active) {
        //Check if a zombie noticed the player
        if (z->right == 0
            && player.worldCol < z->worldCol
            && z->worldCol - player.worldCol < 80
            && player.dancing == 0) {
            z->noticed = 1;
        } else if (z->right == 1
            && player.worldCol > z->worldCol
            && player.worldCol - z->worldCol < 80
            && player.dancing == 0) {
            z->noticed = 1;
        } else {
            z->noticed = 0;
        }

        //Pattern while player not noticed
        if (z->timeCount % 3 == 0 && z->noticed == 0) {
            if (z->right == 0) {
                z->worldCol -= z->cdel;
                z->steps++;
                if (z->steps == 50) {
                    z->right = 1;
                    z->steps = 0;
                }
            }
            if (z->right == 1) {
                z->worldCol += z->cdel;
                z->steps++;
                if (z->steps == 50) {
                    z->right = 0;
                    z->steps = 0;
                }
            }
        }

        //Pattern while Player noticed
        if (z->timeCount % 2 == 0 && z->noticed == 1) {
            if (z->right == 1) {
                z->worldCol += z->cdel;
            } else if (z->right == 0) {
                z->worldCol -= z->cdel;
            }
        }

        z->screenCol = z->worldCol - hOff;
        z->timeCount++;
    }

    //Dies when player attacks the zombie from behind
    if (((player.right == 1 && z->right == 1 && z->worldCol - player.worldCol < 15 + player.width && z->worldCol > player.worldCol)
        || (player.right == 0 && z->right == 0 && player.worldCol - z->worldCol < 15 + z->width && z->worldCol < player.worldCol))
        && BUTTON_PRESSED(BUTTON_A) && z->active == 1) {
        playSoundB(zombiedeath, ZOMBIEDEATHLEN, ZOMBIEDEATHFREQ, 0);
        z->active = 0;
        score = score - 5000;
        kills++;
    }
}

void drawZombies() {
    for (int i = 0; i < ZOMBIECOUNT; i++) {
        shadowOAM[1 + i].attr0 = (ROWMASK & zombies[i].screenRow) | ATTR0_TALL;
        shadowOAM[1 + i].attr1 = (COLMASK & zombies[i].screenCol) | ATTR1_MEDIUM;
        if (zombies[i].active) {
            if (!(zombies[i].noticed)) {
                shadowOAM[1 + i].attr2 = ATTR2_TILEID(6 * 4, zombies[i].curFrame * 2);
            }
            if (zombies[i].noticed) {
                shadowOAM[1 + i].attr2 = ATTR2_TILEID(7 * 4, zombies[i].curFrame * 2);
            }
        } else {
            shadowOAM[1 + i].attr2 = ATTR2_TILEID(6 * 4, 11 * 2);
        }
    }
}
