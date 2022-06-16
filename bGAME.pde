void game() {
  menu.pause();
  win.pause();
  menu.rewind();
  pause.pause();
  game.play();
  background(0);
  noStroke();
  //draw paddle
  fill(255, 255, 255);
  circle(paddleX, height, 130);

  //move paddles
  if (paddleX > 65) {

    if (leftkey == true) paddleX = paddleX - 7;
  };
  if (paddleX < width-65) {
    if (rightkey == true) paddleX = paddleX + 7;
  }


  //win
  if (score == 28) {
    mode = GAMEOVER;
  }


  //respawn

  counter = counter - 1;

  if (counter < 0) {
    ballx = ballx + vx;
    bally = bally + vy;
  }

  if (bally > height + 50) {
    vy = 2;  
    bally = 500;
    counter = 50;
    vx = 0;
    ballx = width/2;

    lives = lives - 1;
  }
  fill(255, 255, 255);
  textSize(40);
  text("Lives: " + lives, 700, 730);

  if (lives == 0) {

    mode = GAMEOVER;
  }

  //ball
  //movement
  circle(ballx, bally, balld);

  //bouncing
  if (bally < (balld/2) ) {
    vy = vy * -1;
    bounce.play();
    bounce.rewind();
  }
  if (ballx < balld/2 || ballx > width - balld/2) {
    vx = vx * -1;
    bounce.play();
    bounce.rewind();
  }







  //collision with paddles
  if (dist(paddleX, height, ballx, bally) < (balld/2 + 65)) {
    vy = bally/10 - height/10;
    vx = ballx/10 - paddleX/10;
  }


  //bricks=======================================================================================================================================================





  int i = 0;
  while (i < n) {

    if (alive[i] == true) {
      manageBrick(i);
    }

    i++;
  }
}

void gameClicks() {
   if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {

    mode = PAUSE;
   }
  
}



void manageBrick(int i) {

  if (i <= 6) {
    fill(255, 255, 255);
  } else if (i <= 13) {

    fill(255, 0, 0);
  } else if (i <= 20) {

    fill(235, 222, 207);
  } else if (i <= 27) {
    fill(137, 207, 240);
  }


  circle(x[i], y[i], brickd);

  //bouncing from bricks

  if (dist(ballx, bally, x[i], y[i]) < (balld/2 + brickd/2)) {
    scored.play();
    scored.rewind();
    score = score + 1;
    alive[i] = false;
    
    
    vx = (ballx - x[i])/8;
    vy = (bally - y[i])/8;
  }
}
