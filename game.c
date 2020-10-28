#include "myLib.h"
#include "text.h"
#include "game.h"
#include "background.h"
#include "spritesheet.h"

// extern objects
PLAYER player;
CAR cars[TOTALCARS];
LOG logs[TOTALLOGS];

int counter;

// initializes game
void initGame() {
	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    // background tiles into DMA for game state
	DMANow(3, backgroundTiles, &CHARBLOCK[1], backgroundTilesLen / 2);
	DMANow(3, backgroundMap, &SCREENBLOCK[29], backgroundMapLen / 2);
	DMANow(3, backgroundPal, PALETTE, backgroundPalLen / 2);


    //sprites

    // load spritessheets into DMA
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen/2);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);

    initPlayer();
    initCars();
    initLogs();

    // initalizing first objects
    addCar();
    addLog();
}

// initializes player
void initPlayer() {
    player.width = 16;
    player.height = 16;
    player.cdel = 1;
    player.rdel = 1;
    player.col = 30;
	player.row = SCREENHEIGHT - 20;
	player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 3;
	player.aniState = SPRITEFRONT; 
    player.life = 3;
}

// initializes cars
void initCars() { //79-104, 102-133
    for (int i = 0; i < TOTALCARS; i++) {
        cars[i].width = 32;
        if (i % 2 != 1) { // moving right
            cars[i].direction = RIGHT;
            cars[i].row = 110;
            cars[i].col = 0;
        } else { // moving left
            cars[i].direction = LEFT;
            cars[i].row = 85;
            cars[i].col = SCREENWIDTH;
        }

        cars[i].cdel = 1;
        cars[i].height = 16;
        cars[i].active = INACTIVE;

    }
}

//initalizes logs
void initLogs() {
    for (int i = 0; i < TOTALLOGS; i++) {
        logs[i].width = 32;
        if (i % 2 != 0) {
            logs[i].direction = RIGHT;
            logs[i].row = 22;
            logs[i].col = 0;
        } else {
            logs[i].direction = LEFT;
            logs[i].row = 39;
            logs[i].col = SCREENWIDTH;
        }
        logs[i].cdel = 1;
        logs[i].width = 32;
        logs[i].height = 16;
        logs[i].active = INACTIVE;
    }
}

// addsa  new log to the screen
void addLog() {
    for (int i = 0; i < TOTALLOGS; i++) {
        if (!logs[i].active) {
            logs[i].active = ACTIVE;
            break;
        }
    }
}

// adds a new car to the screen
void addCar() {
    for (int i = 0; i < TOTALCARS; i++) {
        if (!cars[i].active) {
            cars[i].active = ACTIVE;
            break;
        }
    }
}

// resets a log struct
void resetLog(int i) {
    if (i % 2 != 0) {
        logs[i].row = 21;
        logs[i].col = 0;
    } else {
        logs[i].row = 40;
        logs[i].col = SCREENWIDTH;
    }
    logs[i].active = INACTIVE;
}

// resets a car struct
void resetCar(int i) {
    if (i % 2 != 1) { // moving right
        cars[i].row = 110;
        cars[i].col = 0;
    } else { // moving left
        cars[i].row = 85;
        cars[i].col = SCREENWIDTH;
    }
    cars[i].active = INACTIVE;
}

// used when player takes damage
void playerHit() {
    player.life--;
    player.col = 30;
	player.row = SCREENHEIGHT - 20;
}

// updates data for game
void updateGame() {
    counter++;
    // math for adding log and car entities at random
    if(counter % 46 == 0) {
        addCar();
    }
    if(counter % 52 == 0) {
        addLog();
    }

    // updating lives

    updatePlayer();
    updateCars();
    updateLogs();
}

// updates player data
void updatePlayer() {
    player.prevAniState = player.aniState;
	player.aniState = SPRITEIDLE;
	
    // Change the animation frame every 15 frames of gameplay
	if(player.aniCounter % 15 == 0) {
		// TODO 2.2: Change the frame here
		//           Remember that there are only numFrames number of frames
		player.curFrame++;
		if (player.curFrame > player.numFrames-1) {
			player.curFrame = 0;
		}
	}	
	if(BUTTON_HELD(BUTTON_UP) && player.row > 0) {
		player.aniState = SPRITEBACK;
		player.row--;
	}
	if(BUTTON_HELD(BUTTON_DOWN) && player.row < SCREENHEIGHT - player.height) {
		player.aniState = SPRITEFRONT;
		player.row++;
	}
	if(BUTTON_HELD(BUTTON_LEFT) && player.col > 0) {
		player.aniState = SPRITELEFT;
		player.col--;
	}
	if(BUTTON_HELD(BUTTON_RIGHT) && player.col < SCREENWIDTH - player.width) {
		player.aniState = SPRITERIGHT;
		player.col++;
	}

	if (player.aniState == SPRITEIDLE) {
		player.curFrame = 0;
		player.aniState = player.prevAniState;
	} else {
		player.aniCounter++;
	}

    // row = 21 to 57 is the death range for river

}

// updates car data
void updateCars() {

    // movement logic
    for (int i = 0; i < TOTALCARS; i++) {
        if (cars[i].active) {
            if (cars[i].direction == RIGHT) {
                cars[i].col++;
            } else {
                cars[i].col--;
            }

            if (cars[i].col > SCREENWIDTH || (cars[i].col <= 0 && cars[i].direction == LEFT)) {
                resetCar(i);
            }

            //collision logic - player dies on touch
            if (collision( player.col, player.row, player.width, player.height, cars[i].col, cars[i].row, cars[i].width, cars[i].height)) {
                playerHit();
            }
        }
    }
}

// updates log data
void updateLogs() {
    int playerWasSafe = 0;

    // movement logic
    for (int i = 0; i < TOTALLOGS; i++) {
        if (logs[i].active) {
            if (logs[i].direction == RIGHT) {
                logs[i].col++;

            } else {
                logs[i].col--;
            }

            if (logs[i].col > SCREENWIDTH || (logs[i].col <= 0 && logs[i].direction == LEFT)) {
                resetLog(i);
            }

            //collision logic - player doesnt die on touch and moves with the log
            //if (player.row > logs[i].row && player.row < logs[i].row+logs[i].height && player.col > logs[i].col && player.col < logs[i].col+logs[i].height) {
            if (collision(logs[i].col, logs[i].row, logs[i].width, logs[i].height, player.col, player.row, player.width, player.height)) {
                playerWasSafe = 1;
                if (logs[i].direction == RIGHT) {
                    if (player.col+player.width < SCREENWIDTH) {
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

    // if player is within 16x32 of log && ((player.row > 23 && player.row < 39) ||  (player.row < 49 && player. row > 33)) 24, 54
    if (!playerWasSafe && ((player.row > 14 && player.row < 49) )) {
        playerHit();
    }
}

// draws the new data onto the screen
void drawGame() {
    hideSprites();
    // tiles and map into DMA
	DMANow(3, backgroundTiles, &CHARBLOCK[1], backgroundTilesLen / 2);
	DMANow(3, backgroundMap, &SCREENBLOCK[29], backgroundMapLen / 2);
    // bg pallete into DMA
	DMANow(3, backgroundPal, PALETTE, backgroundPalLen / 2);

    //hideSprites();

    drawPlayer();
    drawCars();
    drawLogs();

    //drawing lives
    for (int i = 0; i < player.life; i++) {
        shadowOAM[50 + i].attr0 = 0 | ATTR0_4BPP | ATTR0_SQUARE;  
        shadowOAM[50 + i].attr1 = SCREENWIDTH - 42 + (12*i) | ATTR1_TINY;
        shadowOAM[50 + i].attr2 = ATTR2_TILEID(0, 10);
    }


    // locks framerate to 60 fps
	waitForVBlank();

    // DMAs shadowOAM into DMA
    DMANow(3, shadowOAM, OAM, 512);
}

// draws player
void drawPlayer() {

    // use shadow OAM to load the sprite attributes
	shadowOAM[0].attr0 = player.row | ATTR0_4BPP | ATTR0_SQUARE;  
	shadowOAM[0].attr1 = player.col | ATTR1_SMALL;
	shadowOAM[0].attr2 = ATTR2_TILEID(player.aniState*2, player.curFrame * 2);
}

// draws all of the cars from pool
void drawCars() {
    for (int i = 0; i < TOTALCARS; i++) {
        if (cars[i].active) {
            // use shadow OAM to load the sprite attributes
            shadowOAM[i + 1].attr0 = cars[i].row | ATTR0_4BPP | ATTR0_WIDE;  
            shadowOAM[i + 1].attr1 = cars[i].col | ATTR1_MEDIUM;
            if (cars[i].direction == RIGHT) {
                shadowOAM[i + 1].attr2 = ATTR2_TILEID(0, 8);
            } else {
                shadowOAM[i + 1].attr2 = ATTR2_TILEID(4, 8);
            }
        }
    }
}

// draws all logs from the pool
void drawLogs() {
    for (int i = 0; i < TOTALLOGS; i++) {
        if (logs[i].active) {
            // use shadow OAM to load the sprite attributes
            shadowOAM[i + 1 + TOTALCARS].attr0 = logs[i].row | ATTR0_4BPP | ATTR0_WIDE;  
            shadowOAM[i + 1 + TOTALCARS].attr1 = logs[i].col | ATTR1_MEDIUM;
            shadowOAM[i + 1 + TOTALCARS].attr2 = ATTR2_TILEID(0, 6);
        }

    }
}
