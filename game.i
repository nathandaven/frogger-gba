# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern volatile unsigned short *videoBuffer;
# 85 "myLib.h"
typedef struct
{
    u16 tileimg[8192];
} charblock;


typedef struct
{
    u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();




typedef struct
{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 159 "myLib.h"
void hideSprites();






typedef struct
{
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
# 202 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 212 "myLib.h"
typedef volatile struct
{
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 253 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "game.c" 2
# 1 "text.h" 1

void drawChar3(int col, int row, char ch, unsigned short color);
void drawString3(int col, int row, char *str, unsigned short color);


void drawChar4(int col, int row, char ch, unsigned char colorIndex);
void drawString4(int col, int row, char *str, unsigned char colorIndex);
# 3 "game.c" 2
# 1 "game.h" 1
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
} PLAYER;

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


enum {SPRITEFRONT, SPRITEBACK, SPRITERIGHT, SPRITELEFT, SPRITEIDLE};
# 50 "game.h"
extern PLAYER player;
extern CAR cars[16];
extern LOG logs[16];


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
# 4 "game.c" 2
# 1 "background.h" 1
# 22 "background.h"
extern const unsigned short backgroundTiles[944];


extern const unsigned short backgroundMap[1024];


extern const unsigned short backgroundPal[256];
# 5 "game.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 6 "game.c" 2


PLAYER player;
CAR cars[16];
LOG logs[16];

int counter;


void initGame() {
 (*(volatile unsigned short *)0x4000000) = 0 | (1 << 8) | (1 << 12);


 DMANow(3, backgroundTiles, &((charblock *)0x6000000)[1], 1888 / 2);
 DMANow(3, backgroundMap, &((screenblock *)0x6000000)[29], 2048 / 2);
 DMANow(3, backgroundPal, ((unsigned short *)0x5000000), 512 / 2);





    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 512/2);
    DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768/2);

    initPlayer();
    initCars();
    initLogs();


    addCar();
    addLog();
}


void initPlayer() {
    player.width = 16;
    player.height = 16;
    player.cdel = 1;
    player.rdel = 1;
    player.col = 30;
 player.row = 160 - 20;
 player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 3;
 player.aniState = SPRITEFRONT;
    player.life = 3;
}


void initCars() {
    for (int i = 0; i < 16; i++) {
        cars[i].width = 32;
        if (i % 2 != 1) {
            cars[i].direction = 1;
            cars[i].row = 110;
            cars[i].col = 0;
        } else {
            cars[i].direction = -1;
            cars[i].row = 85;
            cars[i].col = 240;
        }

        cars[i].cdel = 1;
        cars[i].height = 16;
        cars[i].active = 0;

    }
}


void initLogs() {
    for (int i = 0; i < 16; i++) {
        logs[i].width = 32;
        if (i % 2 != 0) {
            logs[i].direction = 1;
            logs[i].row = 22;
            logs[i].col = 0;
        } else {
            logs[i].direction = -1;
            logs[i].row = 39;
            logs[i].col = 240;
        }
        logs[i].cdel = 1;
        logs[i].width = 32;
        logs[i].height = 16;
        logs[i].active = 0;
    }
}


void addLog() {
    for (int i = 0; i < 16; i++) {
        if (!logs[i].active) {
            logs[i].active = 1;
            break;
        }
    }
}


void addCar() {
    for (int i = 0; i < 16; i++) {
        if (!cars[i].active) {
            cars[i].active = 1;
            break;
        }
    }
}


void resetLog(int i) {
    if (i % 2 != 0) {
        logs[i].row = 21;
        logs[i].col = 0;
    } else {
        logs[i].row = 40;
        logs[i].col = 240;
    }
    logs[i].active = 0;
}


void resetCar(int i) {
    if (i % 2 != 1) {
        cars[i].row = 110;
        cars[i].col = 0;
    } else {
        cars[i].row = 85;
        cars[i].col = 240;
    }
    cars[i].active = 0;
}


void playerHit() {
    player.life--;
    player.col = 30;
 player.row = 160 - 20;
}


void updateGame() {
    counter++;

    if(counter % 46 == 0) {
        addCar();
    }
    if(counter % 52 == 0) {
        addLog();
    }



    updatePlayer();
    updateCars();
    updateLogs();
}


void updatePlayer() {
    player.prevAniState = player.aniState;
 player.aniState = SPRITEIDLE;


 if(player.aniCounter % 15 == 0) {


  player.curFrame++;
  if (player.curFrame > player.numFrames-1) {
   player.curFrame = 0;
  }
 }
 if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 6))) && player.row > 0) {
  player.aniState = SPRITEBACK;
  player.row--;
 }
 if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 7))) && player.row < 160 - player.height) {
  player.aniState = SPRITEFRONT;
  player.row++;
 }
 if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 5))) && player.col > 0) {
  player.aniState = SPRITELEFT;
  player.col--;
 }
 if((~((*(volatile unsigned short *)0x04000130)) & ((1 << 4))) && player.col < 240 - player.width) {
  player.aniState = SPRITERIGHT;
  player.col++;
 }

 if (player.aniState == SPRITEIDLE) {
  player.curFrame = 0;
  player.aniState = player.prevAniState;
 } else {
  player.aniCounter++;
 }



}


void updateCars() {


    for (int i = 0; i < 16; i++) {
        if (cars[i].active) {
            if (cars[i].direction == 1) {
                cars[i].col++;
            } else {
                cars[i].col--;
            }

            if (cars[i].col > 240 || (cars[i].col <= 0 && cars[i].direction == -1)) {
                resetCar(i);
            }


            if (collision( player.col, player.row, player.width, player.height, cars[i].col, cars[i].row, cars[i].width, cars[i].height)) {
                playerHit();
            }
        }
    }
}


void updateLogs() {
    int playerWasSafe = 0;


    for (int i = 0; i < 16; i++) {
        if (logs[i].active) {
            if (logs[i].direction == 1) {
                logs[i].col++;

            } else {
                logs[i].col--;
            }

            if (logs[i].col > 240 || (logs[i].col <= 0 && logs[i].direction == -1)) {
                resetLog(i);
            }



            if (collision(logs[i].col, logs[i].row, logs[i].width, logs[i].height, player.col, player.row, player.width, player.height)) {
                playerWasSafe = 1;
                if (logs[i].direction == 1) {
                    if (player.col+player.width < 240) {
                        player.col++;
                    }
                } else {
                    if (player.col > 0) {
                        player.col--;
                    }
                }
            }
        }
    }


    if (!playerWasSafe && ((player.row > 14 && player.row < 49) )) {
        playerHit();
    }
}


void drawGame() {
    hideSprites();

 DMANow(3, backgroundTiles, &((charblock *)0x6000000)[1], 1888 / 2);
 DMANow(3, backgroundMap, &((screenblock *)0x6000000)[29], 2048 / 2);

 DMANow(3, backgroundPal, ((unsigned short *)0x5000000), 512 / 2);



    drawPlayer();
    drawCars();
    drawLogs();


    for (int i = 0; i < player.life; i++) {
        shadowOAM[50 + i].attr0 = 0 | (0 << 13) | (0 << 14);
        shadowOAM[50 + i].attr1 = 240 - 42 + (12*i) | (0 << 14);
        shadowOAM[50 + i].attr2 = ((10)*32 + (0));
    }



 waitForVBlank();


    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 512);
}


void drawPlayer() {


 shadowOAM[0].attr0 = player.row | (0 << 13) | (0 << 14);
 shadowOAM[0].attr1 = player.col | (1 << 14);
 shadowOAM[0].attr2 = ((player.curFrame * 2)*32 + (player.aniState*2));
}


void drawCars() {
    for (int i = 0; i < 16; i++) {
        if (cars[i].active) {

            shadowOAM[i + 1].attr0 = cars[i].row | (0 << 13) | (1 << 14);
            shadowOAM[i + 1].attr1 = cars[i].col | (2 << 14);
            if (cars[i].direction == 1) {
                shadowOAM[i + 1].attr2 = ((8)*32 + (0));
            } else {
                shadowOAM[i + 1].attr2 = ((8)*32 + (4));
            }
        }
    }
}


void drawLogs() {
    for (int i = 0; i < 16; i++) {
        if (logs[i].active) {

            shadowOAM[i + 1 + 16].attr0 = logs[i].row | (0 << 13) | (1 << 14);
            shadowOAM[i + 1 + 16].attr1 = logs[i].col | (2 << 14);
            shadowOAM[i + 1 + 16].attr2 = ((6)*32 + (0));
        }

    }
}
