class GameManager {
  // info
  Player player;
  InputManager input;
  int roomNum;
  Room currentRoom;
  
  // FLAGS
  String gameState = "idling";
  
  // constructor
  GameManager() {
    player = new Player(5);
    input = new InputManager(player);
    roomNum = 1;
  }
  
  void setupRoom(int room) {
    gameState = "roomSetup";
    
    // stop the player from moving
    player.stop = true;
    
    // clear previous room if there is a room
    if (currentRoom != null) {
      currentRoom.clear();
      currentRoom = null;
    }
    
    // determine the amount of doors in the room
    int totalDoors = constrain(4 + floor(room / 2), 4, 12);
    int currentDoorCount = 0;
    int doorsRemaining = totalDoors;
    
    // decide the amount of doors for each side
    int[] doors = new int[4]; // 0 = up, 1 = down, 2 = Right, 3 = Left

    while (currentDoorCount < totalDoors){
      
      // add 1 to all rooms if the difference between current door count and total doors is divisible by 4
      if ((doorsRemaining - currentDoorCount) >= 0) {
        currentDoorCount += 4;
        doorsRemaining -= 4;
        doors[0] += 1;
        doors[1] += 1;
        doors[2] += 1;
        doors[3] += 1;
        
      } else {
        int difference = totalDoors - currentDoorCount;
        boolean[] occupancy = new boolean[4];
        
        // iterate for each door left in the sequence, again i think it's inefficient (while unlikely) but i don't have a better idea of doing this
        for (int door = 0; door < difference; door++) {
          int occupant = 1; // get random side via occupancy boolean table
          boolean isVacant = false;
          
          while (isVacant == false){
            // refresh the occupant variable in case we dont get a vacancy
            occupant = int(random(1, 5));
            
            // if occupancy is set to false and door count is less than 3
            if (occupancy[occupant - 1] != true && doors[occupant - 1] < 3) {
              isVacant = true;
              occupancy[occupant - 1] = true;
            }
          }
          
          // add door to side
          currentDoorCount += 1;
          doorsRemaining -=1;
          doors[occupant - 1] += 1;
        }
      }
    }
    
    // teleport player to the center and let it move again
    player.pos = new PVector(225,225);
    player.stop = false;
    
    // create the room
    currentRoom = new Room(doors[0], doors[3], doors[2], doors[1], player); // up,  left, right, down, dont ask why the indexes are formatted this way
    currentRoom.setup();
    
    // update game state
    gameState = "idling";
  }
  
  void update() {
    if (gameState == "idling") {
      // print("\n updating");
            
      // draw room
      currentRoom.draw();
      
      // check room state, determine if we go next room or have died
      if (currentRoom.state == "TouchedFalseDoor") {
        player.isDead = true;
        player.stop = true;
      } else if (currentRoom.state == "TouchedTrueDoor") {
        roomNum += 1;
        setupRoom(roomNum);
      }
          
      // update input manager
      input.update();
      
      // update and draw player
      player.update();
      player.draw();
      
    }
  }
}
