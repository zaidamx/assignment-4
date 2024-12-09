class Player {
  float x,y; // store player position
  PVector moveVector; // store player movement direction
  
  // constructor
  Player() {
    // always set the player at the center of the screen
    x = 300;
    y = 300;
    
    moveVector = new PVector(0,0); // so it is not moving
  }
  
  // always draw player with the origin at the center
  void draw() {
    rectMode(CENTER);
    square(x,y,10);
  }
}

Player player = new Player();

void setup(){
  size(600,600);
}


void draw() {
  background(0,0,0);
  player.draw();
}
