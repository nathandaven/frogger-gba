typedef struct {
	int row;
	int col;
    int rdel;
    int cdel;
	int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int life;
} PLAYER; // player is animated

typedef struct {
	int row;
	int col;
    int cdel;
	int width;
    int height;
    int active;
    int direction;
} CAR;

typedef struct {
	int row;
	int col;
    int cdel;
	int width;
    int height;
    int active;
    int direction;
} LOG;

// used for animation
enum {SPRITEFRONT, SPRITEBACK, SPRITERIGHT, SPRITELEFT, SPRITEIDLE};

// size defines
#define TOTALCARS 16
#define TOTALLOGS 16

// additional defines
#define ACTIVE 1
#define INACTIVE 0
#define RIGHT 1
#define LEFT -1

// external objects
extern PLAYER player;
extern CAR cars[TOTALCARS];
extern LOG logs[TOTALLOGS];

// prototypes
void initGame();
void initPlayer();
void initCars();
void initLogs();
void addLog();
void addCar();
void resetLog(int i);
void resetCar(int i);
void playerHit();
void updateGame();
void updatePlayer();
void updateCars();
void updateLogs();
void drawGame();
void drawPlayer();
void drawCars();
void drawLogs();
