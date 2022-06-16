import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

PImage[] gif;
int numberOfFrames;
int f;



//music
Minim minim;
AudioPlayer menu, lose, win, game, pause, scored, bounce;
//gif


//Brick variables
int[] x;
int[] y;
boolean[] alive;
int brickd;
int n;
int tempx, tempy;


//Breakout

int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;
final int OPTIONS = 5;
int size = 110;
int i = 0;
int aliver;
float paddleX = 400;
float vx = 0;
float vy = 2;
int lives = 3;
//ball
float ballx = 400;
float bally = 500;
float balld = 15;
int counter, score;
//boolean variables
boolean leftkey, rightkey;


void setup() {

  //gif
  numberOfFrames = 36;

  gif = new PImage[numberOfFrames];

  int giffer = 0;
  while (giffer < numberOfFrames) {
    gif[giffer] = loadImage("frame_" + giffer + "_delay-0.01s.gif");

    giffer++;
  }


  minim = new Minim(this);
  lose = minim.loadFile("lose.mp3");
  menu = minim.loadFile("menu.mp3");
  win = minim.loadFile("win.mp3");
  game = minim.loadFile("game.mp3");
  pause = minim.loadFile("pause.mp3");
  scored = minim.loadFile("score.mp3");
  bounce = minim.loadFile("bounce.mp3");
  menu.play();
  brickd = 50;

  counter = 60;
  score = 0;

  n = 28;
  x = new int[n];
  y = new int[n];
  alive = new boolean[n];
  tempx = 160;
  tempy = 120;

  int i = 0;
  while (i < n) {

    x[i] = tempx;
    y[i] = tempy;
    alive[i] = true;
    tempx = tempx + 80;
    if (tempx == 720) {

      tempy = tempy + 100;
      tempx = 160;
    }

    i++;
  }




  size(800, 800);
  mode = INTRO;
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {

    println("Mode error: " + mode);
  }
}
