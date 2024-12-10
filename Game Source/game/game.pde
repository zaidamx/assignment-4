// variables
GameManager manager;
//String gameState = "idle";

// flags
int CURRENT_ROOM = 1;
boolean RESTARTING = false;

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
  
  // restart functionality when win or lose
  if (key == 'r' && (manager.gameState == "lost" || manager.gameState == "won") && RESTARTING == false) {
    RESTARTING = true;
    
    manager = new GameManager();
    manager.setupRoom(CURRENT_ROOM);
  
    // set-up input
    manager.input.reset();
    
    // set everything back to normal
    RESTARTING = false;
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
  if (RESTARTING == false) {
    manager.update();
  }
  // update the player and draw it every frame
  //player.update();
  //player.draw();
  
  // call input manager to update player's velocity
  //input.update();
}
