void intro() {
  lose.pause();
  win.pause();
  menu.play();
  lose.rewind();
  win.rewind();
  game.rewind();
  scored.rewind();


  //gif
  image(gif[f], 0, 0, width, height);
  f++;
  if (f == numberOfFrames) {
   f = 0; 
    
  }
  


  //expansion of text

  textSize(size);
  textAlign(CENTER);

  score = 0;
  lives = 3;

  if (i > 0 && i < 25) {
    size = size + 2;
  } else if (i > 25 && i < 50) {

    size = size - 2;
  }
  if (i > 50) {
    i = 0;
  }




  i++;
  text("Breakout!", 403, 250);
  textSize(40);
  text("Click to start", 390, 550);
}

void introClicks() {

  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
    mode = GAME;
  }
}
