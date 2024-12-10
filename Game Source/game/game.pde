// variables
Player player;
InputManager input;
String gameState = "idle";

// test
Room testRoom;

// initial setup
void setup(){
  size(450,450);
  
  player = new Player(5);// argument is speed, which movement vector is multiplied by
  input = new InputManager(player);
  input.reset();
  
  // test room
  testRoom = new Room(3,3,3,3);
  testRoom.setup();
  
  gameState = "running";
}

// input stuff
void keyPressed(){
  // update input manager
  input.KeyPressed(key);
}

void keyReleased(){
  input.KeyReleased(key);
}

// game stuff
void draw() {
  background(0,0,0);
  
  // update the player and draw it every frame
  player.update();
  player.draw();
  
  // call input manager to update player's velocity
  input.update();
  
  // draw all doors
  testRoom.draw();
  
 // print("\n Player vel: ", player.vel);
}
