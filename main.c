#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "text.h"
#include "title.h"
#include "game.h"
#include "spritesheet.h"
#include "win.h"
#include "lose.h"
#include "pause.h"

// Prototypes
void initialize();

// State Prototypes
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// States
enum
{
    START,
    GAME,
    PAUSE,
    WIN,
    LOSE
};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Shadow OAM
OBJ_ATTR shadowOAM[128];

int main()
{
    hideSprites();
    initialize();

    while (1)
    {
        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
        switch (state)
        {
        case START:
            start();
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

// Sets up GBA
void initialize()
{
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE; // Bitwise OR the BG(s) you want to use and Bitwise OR SPRITE_ENABLE if you want to use sprites
    // Don't forget to set up whatever BGs you enabled in the line above!
	REG_BG1CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
	REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(29);

	// Load tiles into the charblock that your background 0 is using
	DMANow(3, titleTiles, &CHARBLOCK[1], titleTilesLen / 2);

	// Load tile map into the screenblock that your background 0 is using
	DMANow(3, titleMap, &SCREENBLOCK[29], titleMapLen / 2);

    buttons = BUTTONS;
    oldButtons = 0;

    goToStart();
}

/// Sets up the start state
void goToStart() {
	REG_DISPCTL = MODE0 | BG0_ENABLE;
	DMANow(3, titleTiles, &CHARBLOCK[1], titleTilesLen / 2);
	DMANow(3, titleMap, &SCREENBLOCK[29], titleMapLen / 2);
	DMANow(3, titlePal, PALETTE, titlePalLen / 2);
    
    waitForVBlank();
    state = START;
}

// Runs every frame of the start state
void start() {


    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        hideSprites();
        initGame();
        goToGame();
    }
}

// Sets up the game state
void goToGame() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    state = GAME;
}

// Runs every frame of the game state
void game() {

    // game
    updateGame();
    drawGame();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (player.life <= 0) {
        goToLose();
    }
    if (player.row < 4) {
        goToWin();
    }

}

// Sets up the pause state
void goToPause() {
    REG_DISPCTL = MODE0 | BG0_ENABLE;
	DMANow(3, pauseTiles, &CHARBLOCK[1], pauseTilesLen / 2);
	DMANow(3, pauseMap, &SCREENBLOCK[29], pauseMapLen / 2);
	DMANow(3, pausePal, PALETTE, pausePalLen / 2);

    waitForVBlank();
    hideSprites();

    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
        goToGame();
    }
    else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

// Sets up the win state
void goToWin() {
    REG_DISPCTL = MODE0 | BG0_ENABLE;
	DMANow(3, winTiles, &CHARBLOCK[1], winTilesLen / 2);
	DMANow(3, winMap, &SCREENBLOCK[29], winMapLen / 2);
	DMANow(3, winPal, PALETTE, winPalLen / 2);

    waitForVBlank();

    state = WIN;
}

// Runs every frame of the win state
void win() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

// Sets up the lose state
void goToLose() {
    REG_DISPCTL = MODE0 | BG0_ENABLE;
	DMANow(3, loseTiles, &CHARBLOCK[1], loseTilesLen / 2);
	DMANow(3, loseMap, &SCREENBLOCK[29], loseMapLen / 2);
	DMANow(3, losePal, PALETTE, losePalLen / 2);

    waitForVBlank();
    state = LOSE;
}

// Runs every frame of the lose state
void lose() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();         
    }
}