# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern unsigned short *videoBuffer;
# 91 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int row, int col, unsigned short color);
void drawRect3(int row, int col, int height, int width, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int row, int col, int height, int width, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int row, int col, unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int row, int col, int height, int width, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 163 "myLib.h"
void hideSprites();






typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 206 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 217 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 257 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
# 353 "myLib.h"
typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;
# 2 "game.c" 2
# 1 "game.h" 1

typedef struct {
 int screenRow;
 int screenCol;
 int worldRow;
 int worldCol;
 int cdel;
 int width;
 int height;
 int dancing;
 int attack;
 int right;
 int dead;
 int aniCounter;
 int aniState;
 int prevAniState;
 int curFrame;
 int numFramesWalk;
 int numFramesPunch;
 int numFramesDance;
} PLAYER;

typedef struct {
 int screenRow;
 int screenCol;
 int worldRow;
 int worldCol;
 int cdel;
 int width;
 int height;
 int right;
 int noticed;
 int active;
 int timeCount;
 int steps;
 int aniCounter;
 int curFrame;
 int numFramesDance;
} ZOMBIE;







extern int hOff;
extern int vOff;
extern OBJ_ATTR shadowOAM[128];
extern PLAYER player;
extern ZOMBIE zombies[5];
extern int cheatCount;
extern int cheat;



void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void drawPlayer();

void initZombies();
void updateZombie(ZOMBIE*);
void drawZombies();
# 3 "game.c" 2
# 1 "zombiedeath.h" 1
# 20 "zombiedeath.h"
extern const unsigned char zombiedeath[7805];
# 4 "game.c" 2
# 1 "sound.h" 1
SOUND soundA;
SOUND soundB;

void setupSounds();
void playSoundA( const unsigned char* sound, int length, int frequency, int loops);
void playSoundB( const unsigned char* sound, int length, int frequency, int loops);

void setupInterrupts();
void interruptHandler();

void pauseSound();
void unpauseSound();
void stopSound();
# 5 "game.c" 2


int hOff;
int vOff;
OBJ_ATTR shadowOAM[128];
PLAYER player;
ZOMBIE zombies[5];
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
 (*(volatile unsigned short *)0x04000016) = vOff;
    kills = 0;

    score = 100000;
    initPlayer();
    initZombies();
}

void updateGame() {
    updatePlayer();
    for (int i = 0; i < 5; i++) {
        updateZombie(&(zombies[i]));
    }
    score = score - 10;
}

void drawGame() {
    drawPlayer();
    drawZombies();

    shadowOAM[8].attr0 = 10 | (1<<14);
    shadowOAM[8].attr1 = 10 | (1<<14);
    shadowOAM[8].attr2 = ((0)*32+(18));

    shadowOAM[7].attr0 = 10 | (0<<14);
    shadowOAM[7].attr1 = 40 | (0<<14);
    shadowOAM[7].attr2 = ((kills)*32+(17));

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);

    (*(volatile unsigned short *)0x04000014) = hOff;
    (*(volatile unsigned short *)0x04000018) = hOff / 2;
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

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<5))) && player.dancing == 0 && player.attack == 0) {
        if (player.worldCol > 0) {
            player.worldCol -= player.cdel;
            player.right = 0;
            if (player.worldCol + player.width / 2 > 240 / 2
                && player.worldCol + player.width / 2 < 512 - 240 / 2) {
                hOff -= player.cdel;
            }
        }
        player.aniState = LEFTWALK;
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<4))) && player.dancing == 0 && player.attack == 0) {
        if (player.worldCol + player.width < 512) {
            player.worldCol += player.cdel;
            player.right = 1;
            if (player.worldCol + player.width / 2 > 240 / 2
                && player.worldCol + player.width / 2 < 512 - 240 / 2) {
                hOff += player.cdel;
            }
        }
        player.aniState = RIGHTWALK;
    }

    player.screenCol = player.worldCol - hOff;

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<1)))) {
        player.dancing = 1;
        player.aniState = DANCE;
    } else {
        player.dancing = 0;
    }

    for (int i = 0; i < 5; i++) {
        if (zombies[i].noticed == 1) {
            if ((zombies[i].right == 1 && player.worldCol - zombies[i].worldCol < 8)
                || (zombies[i].right == 0 && zombies[i].worldCol - player.worldCol < 8)) {
                if (cheat == 0) {
                    player.dead = 1;
                }
            }
        }
    }

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<0)))) {
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
    shadowOAM[0].attr0 = (0xFF & player.screenRow) | (2<<14);
    shadowOAM[0].attr1 = (0x1FF & player.screenCol) | (2<<14);
    shadowOAM[0].attr2 = ((player.aniState * 4)*32+(player.curFrame * 2));
}


void initZombies() {
    for (int i = 0; i < 5; i++) {
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


    if (((player.right == 1 && z->right == 1 && z->worldCol - player.worldCol < 15 + player.width && z->worldCol > player.worldCol)
        || (player.right == 0 && z->right == 0 && player.worldCol - z->worldCol < 15 + z->width && z->worldCol < player.worldCol))
        && (!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0)))) && z->active == 1) {
        playSoundB(zombiedeath, 7805, 11025, 0);
        z->active = 0;
        score = score - 5000;
        kills++;
    }
}

void drawZombies() {
    for (int i = 0; i < 5; i++) {
        shadowOAM[1 + i].attr0 = (0xFF & zombies[i].screenRow) | (2<<14);
        shadowOAM[1 + i].attr1 = (0x1FF & zombies[i].screenCol) | (2<<14);
        if (zombies[i].active) {
            if (!(zombies[i].noticed)) {
                shadowOAM[1 + i].attr2 = ((6 * 4)*32+(zombies[i].curFrame * 2));
            }
            if (zombies[i].noticed) {
                shadowOAM[1 + i].attr2 = ((7 * 4)*32+(zombies[i].curFrame * 2));
            }
        } else {
            shadowOAM[1 + i].attr2 = ((6 * 4)*32+(11 * 2));
        }
    }
}
