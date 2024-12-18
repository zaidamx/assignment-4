class Player {
  PVector pos;
  PVector size;
  PVector vel; // more accurately movement vector
  float speed;
  
  // flags
  boolean stop = false;
  boolean isDead = false;
  
  // constructor
  Player(float newSpeed) {
    // always set the player at the center of the screen
    pos = new PVector(225,225);
    vel = new PVector(0,0);
    size = new PVector(20,20);
    
    speed = newSpeed;
  }
  
  // always draw player with the origin at the center
  void draw() {
    rectMode(CENTER);
    if (isDead == true) {
      fill(255,0,0);
    } else {
      fill(255,255,255);
    }
    
    square(pos.x, pos.y, 20);
    
  }
  
  // update position based on velocity
  void update() {
    if (stop == false) {
      pos = new PVector(pos.x + (vel.x * speed), pos.y + (vel.y * speed));
      
      // revert position if we're moving past the screen's bounding box
      if (pos.x - size.x / 2 < 0 || pos.x + size.x / 2 > 450) { // going past the left and ride side of the screen
        pos = new PVector(pos.x - (vel.x * speed), pos.y);;
      }
      if (pos.y + size.y / 2 > 450 || pos.y - size.y / 2 < 0) { // going past the bottom and top side of the screen
        pos = new PVector(pos.x, pos.y - (vel.y * speed));
      }
    }
  }
}
