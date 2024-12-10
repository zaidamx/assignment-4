class Room {
  // arraylist that stores doors
  ArrayList<Door> doors = new ArrayList<Door>();
  
  // door stuff
  int doorsUp; // size: big x, pos: small y
  int doorsLeft; // size: big y, pos: small x
  int doorsRight; // size: big y, pos: big x
  int doorsDown; // size: bix x, pos: big y
  
  // game flags
  boolean touchedTrueDoor = false;
  
  Room(int numDoorsUp, int numDoorsLeft, int numDoorsRight, int numDoorsDown) {
    doorsUp = numDoorsUp;
    doorsLeft = numDoorsLeft;
    doorsRight = numDoorsRight;
    doorsDown = numDoorsDown;
  }
  
  void createDoors(String side, int doorLimit) {
    // create occupancy on this side
    boolean[] occupancy = new boolean[3];
    
    for (int door = 0; door < doorLimit; door++) {
      // find vacant door slot
      boolean foundVacancy = false;
      int occupant = 1;
      
      // this can get very inefficient, but i don't have a better way of doing this
      while (foundVacancy == false) {
        occupant = int(random(1,4));
        if (occupancy[occupant - 1] != true) {
          occupancy[occupant - 1] = true;
          foundVacancy = true;
        }
      }
      
      // determine position based on occupancy
      int newDoorLoc = (450 / 3) * occupant - 75; // choose between 3 pre-determined positions on each side
      
      // determine position
      PVector doorPos = new PVector(0,0); // empty variable
      PVector doorSize = new PVector(0,0); // empty variable, width = 100, height = 10
      if (side == "UP") {
        doorPos = new PVector(newDoorLoc, 15);
        doorSize = new PVector(100, 10);
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
    for (int door = 0; door < doors.size(); door++) {
      doors.get(door).draw();
      
      // check for player collision
    }
  }
}
