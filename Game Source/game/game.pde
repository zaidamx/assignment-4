// variables
GameManager manager;
//String gameState = "idle";

// flags
int CURRENT_ROOM = 1;

// initial setup
void setup(){
  size(450,450);
  
  // set-up manager
  manager = new GameManager();
  manager.setupRoom(CURRENT_ROOM);
  
  // set-up input
  manager.input.reset();
}

// input stuff
void keyPressed(){
  // update input manager
  if (manager != null) {
    manager.input.KeyPressed(key);
  }
}

void keyReleased(){
  // update input manager
  if (manager != null) {
    manager.input.KeyReleased(key);
  }
}

// game stuff
void draw() {
  background(0,0,0);
  
  // game manager will update everything for us
  manager.update();
  // update the player and draw it every frame
  //player.update();
  //player.draw();
  
  // call input manager to update player's velocity
  //input.update();
}
