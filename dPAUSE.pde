void pause() {
  
  game.pause();
  pause.play();
  
  background(0,0,0);
  textSize(120);
  fill(255,255,255);
  text("Paused", 400, 400);
  
  
}

void pauseClicks() {
   if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {

    mode = GAME;
  
   }
  
  
}
