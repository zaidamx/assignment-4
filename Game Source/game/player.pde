class Player {
  PVector pos;
  PVector vel; // more accurately movement vector
  float speed;
  
  // constructor
  Player(float newSpeed) {
    // always set the player at the center of the screen
    pos = new PVector(225,225);
    vel = new PVector(0,0);
    speed = newSpeed;
  }
  
  // always draw player with the origin at the center
  void draw() {
    rectMode(CENTER);
    square(pos.x, pos.y, 20);
  }
  
  // update position based on velocity
  void update() {
    pos = new PVector(pos.x + (vel.x * speed), pos.y + (vel.y * speed));
  }
}
