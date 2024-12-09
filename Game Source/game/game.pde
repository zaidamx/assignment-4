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

Player player = new Player();

void setup(){
  size(600,600);
}


void draw() {
  background(0,0,0);
  
  // update the player and draw it every frame
  player.update();
  player.draw();
  
  // check for user input and update velocity accordingly
  if (keyPressed) {
    
    PVector currentVel = new PVector(0,0);
    if (key == 'w') {
      currentVel = new PVector(currentVel.x, currentVel.y - 1);
    }

    if (key == 'a') {
      currentVel = new PVector(currentVel.x - 1, currentVel.y);
    }
    
    if (key == 's') {
      currentVel = new PVector(currentVel.x, currentVel.y + 1);
    }
    
    if (key == 'd') {
      currentVel = new PVector(currentVel.x + 1, currentVel.y);
    }
    
    // update vel
    player.vel = currentVel;
    
  } else {
    player.vel = new PVector(0,0); // reset if no key is being pressed
  }
}
