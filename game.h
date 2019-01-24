//Player Struct
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
	int right; //1 if looking right, 0 if looking left
	int noticed;
	int active;
	int timeCount;
	int steps;
	int aniCounter;
	int curFrame;
	int numFramesDance;
} ZOMBIE;

//Constants
#define MAPHEIGHT 256
#define MAPWIDTH 512
#define ZOMBIECOUNT 5

//Variables
extern int hOff;
extern int vOff;
extern OBJ_ATTR shadowOAM[128];
extern PLAYER player;
extern ZOMBIE zombies[ZOMBIECOUNT];
extern int cheatCount;
extern int cheat;


//Prototypes
void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void drawPlayer();

void initZombies();
void updateZombie(ZOMBIE*);
void drawZombies();

