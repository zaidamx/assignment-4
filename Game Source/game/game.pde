// variables
Player player;
InputManager input;
Door door;
String gameState = "idle";

// initial setup
void setup(){
  size(450,450);
  
  player = new Player(2);// argument is speed, which movement vector is multiplied by
  input = new InputManager(player);
  input.reset();
  
  // test
  door = new Door(new PVector(100,100), new PVector(10, 200));
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
  
  boolean colliding = door.checkCollision(player);
  print("\nColliding with door:", colliding);
  
  // test door
  door.draw();
  
 // print("\n Player vel: ", player.vel);
}
