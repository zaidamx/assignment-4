Player player = new Player();
// ArrayList<char> keysPressed = new ArrayList<char>();

// update velocity according to keys being pressed
void keyPressed() {
  
}

// game stuff
void setup(){
  size(600,600);
}

void draw() {
  background(0,0,0);
  
  // update the player and draw it every frame
  player.update();
  player.draw();
  
  print("\n Player vel: ", player.vel);
}
