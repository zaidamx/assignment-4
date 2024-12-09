Player player;
InputManager input;

// game stuff
void setup(){
  size(450,450);
  
  player = new Player(10);// argument is speed, which movement vector is multiplied by
  input = new InputManager(player);
  input.reset();
}

// input stuff
void keyPressed(){
  // update input manager
  input.KeyPressed(key);
}

void keyReleased(){
  input.KeyReleased(key);
}

void draw() {
  background(0,0,0);
  
  // update the player and draw it every frame
  player.update();
  player.draw();
  
  // call input manager to update player's velocity
  input.update();
  
 // print("\n Player vel: ", player.vel);
}
