// variables
GameManager manager;

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
  
  // game manager will update everything for us
  if (RESTARTING == false) {
    background(manager.roomNum*10);
    manager.update();
  } else{
    background(0);
  }
}
