void gameover() {
  menu.pause();
  menu.rewind();
  game.pause();
  paddleX = width/2;
  //reset bricks
  aliver = 0;
  while (aliver < n) {
   alive[aliver] = true;
   aliver++;
    
  }
    //reset ball
   ballx = 400;
   bally = 500;
   vx = 0;

counter = 50;
  if (score == 28) {
    background(0, 205, 0);
     textSize(100);
     fill(255,255,255);
    text("You win!", 395, 400);
    win.play();
    
    
  } else {
    
    lose.play();
    
    fill(255,255,255);
    background(255, 0, 0);
    textSize(100);
    text("You lose!", 395, 400);
    
  }
  
  
}

void gameoverClicks() {

  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {

    mode = INTRO;
  }
}
