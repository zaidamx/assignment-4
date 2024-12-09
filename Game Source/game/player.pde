class Player {
  PVector pos;
  PVector vel;
  
  // constructor
  Player() {
    // always set the player at the center of the screen
    pos = new PVector(300,300);
    vel = new PVector(0,0);
  }
  
  // always draw player with the origin at the center
  void draw() {
    rectMode(CENTER);
    square(pos.x, pos.y, 20);
  }
  
  // update position based on velocity
  void update() {
    pos = new PVector(pos.x + vel.x, pos.y + vel.y);
  }
}
