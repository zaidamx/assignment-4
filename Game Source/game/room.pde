class Room {
  // arraylist that stores doors
  ArrayList<Door> doors = new ArrayList<Door>();
  
  // door stuff
  int doorsUp; // size: big x, pos: small y
  int doorsLeft; // size: big y, pos: small x
  int doorsRight; // size: big y, pos: big x
  int doorsDown; // size: bix x, pos: big y
  
  Player player;
  
  // game flags
  String state = "idle";
  
  Room(int numDoorsUp, int numDoorsLeft, int numDoorsRight, int numDoorsDown, Player nPlayer) {
    doorsUp = numDoorsUp;
    doorsLeft = numDoorsLeft;
    doorsRight = numDoorsRight;
    doorsDown = numDoorsDown;
    
    player = nPlayer;
  }
  
  void createDoors(String side, int doorLimit) {
    
    // create occupancy on this side
    boolean[] occupancy = new boolean[3];
    
    for (int door = 0; door < doorLimit; door++) {
      // find vacant door slot
      boolean foundVacancy = false;
      int occupant = 1;
      
      // loop through occupants and found a slot that is vacant
      while (foundVacancy == false) {
        occupant = int(random(1,4)); 
        
        if (occupancy[occupant - 1] != true) {
          occupancy[occupant - 1] = true;
          foundVacancy = true;
        }
      }
      
      // determine position on the side based on occupancy
      int newDoorLoc = (450 / 3) * occupant - 75; // choose between 3 pre-determined positions on each side
      
      // define position and size
      PVector doorPos = new PVector(0,0); // empty variable
      PVector doorSize = new PVector(0,0); // empty variable, width = 100, height = 10
      
      // determine position and size based on side given
      if (side == "UP") {
        doorPos = new PVector(newDoorLoc, 15);
        doorSize = new PVector(100,10);
      } else if (side == "LEFT") {
        doorPos = new PVector(15, newDoorLoc);
        doorSize = new PVector(10, 100);
      } else if (side == "RIGHT") {
        doorPos = new PVector(435, newDoorLoc);
        doorSize = new PVector(10, 100);
      } else if (side == "DOWN") {
        doorPos = new PVector(newDoorLoc, 435);
        doorSize = new PVector(100, 10);
      }
      
      // add to array list
      doors.add(new Door(doorPos, doorSize, false));
    }
  }
  
  void setup() {

    createDoors("UP", doorsUp);
    createDoors("LEFT", doorsLeft);
    createDoors("RIGHT", doorsRight);
    createDoors("DOWN", doorsDown);
    
    // set true door to a true door
    int trueDoor = int(random(1, doors.size() + 1));
    doors.get(trueDoor - 1).trueDoor = true;
  }
  
  void draw() {
    // loop through each door in this room
    for (int door = 0; door < doors.size(); door++) {
      Door currentDoor = doors.get(door); // store current door into a variable
      currentDoor.draw();
      
      // check for player collision during the "idle" room state
      if (state == "idle") {
        boolean colliding = currentDoor.checkCollision(player);
        
        if (colliding == true && currentDoor.trueDoor == true) { // colliding and is true door
          state = "TouchedTrueDoor";
        } else if (colliding == true && currentDoor.trueDoor == false) {
          state = "TouchedFalseDoor";
        }
      }
    }
  }
  
  void clear() {
    // clear doors
    for (int door = 0; door < doors.size(); door++) {
      doors.remove(door);
    }
    
    // clear door array itself
    doors = null;
  }
}
