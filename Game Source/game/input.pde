class InputManager {
  
  // hold a list of keys being pressed
  boolean[] keysPressed = new boolean[4];
  
  Player player;
  
  // constructor
  InputManager(Player newPlayer) {
    player = newPlayer;
  }
  
  // update function will be ran every frame to update the player's velocity
  void update() {
    // grab current frame's movement vector
    PVector curVel = new PVector(0,0);
    
    // iterate through each key boolean
    if (keysPressed[0] == true) { // w
      curVel = new PVector(curVel.x, curVel.y - 1);
    }
    if (keysPressed[1] == true) { // a
      curVel = new PVector(curVel.x - 1, curVel.y);
    }
    if (keysPressed[2] == true) { // s
      curVel = new PVector(curVel.x, curVel.y + 1);
    }
    if (keysPressed[3] == true) { // d
      curVel = new PVector(curVel.x  + 1, curVel.y);
    }
    
    // set player vector to current frame's movement vector
    // additionally, normalize the movement vector so the magnitude of the vector is always 1 no matter the direction
    // (prevents speed up on moving diagonally);
    player.vel = curVel.normalize();
  }
  
  void reset() {
    for (int i = 1; i <= 4; i++) {
      keysPressed[i - 1] = false;
    }
  }

  // map each number in the array as a specific key to make things a lot easier
  /*
    [0] = w,
    [1] = a,
    [2] = s,
    [3] = d,
  */

  void KeyPressed(char Key) {
    
    // this is a little bad, but i don't know how else to do this
    if (Key == 'w') {
      keysPressed[0] = true;
    } else if (Key == 'a') {
      keysPressed[1] = true;
    } else if (Key == 's') {
      keysPressed[2] = true;
    } else if (Key == 'd') {
      keysPressed[3] = true;
    }
  }
  
  void KeyReleased(char Key) {
    
        // this is a little bad, but i don't know how else to do this
    if (Key == 'w') {
      keysPressed[0] = false;
    } else if (Key == 'a') {
      keysPressed[1] = false;
    } else if (Key == 's') {
      keysPressed[2] = false;
    } else if (Key == 'd') {
      keysPressed[3] = false;
    }
  }
}
