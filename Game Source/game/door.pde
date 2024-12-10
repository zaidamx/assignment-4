class Door {
  PVector pos;
  PVector size;
  boolean trueDoor;
  
  Door(PVector newPos, PVector newSize, boolean isTrueDoor) {
    pos = newPos;
    size = newSize;
    
    trueDoor = isTrueDoor;
  }
  
  boolean checkCollision(Player player) {
    
    // assume both player and door will never rotate
    if (
      player.pos.x + player.size.x / 2 > pos.x - size.x / 2 && // within the right side of the door
      player.pos.x - player.size.x / 2 < pos.x + size.x / 2 && // within the left side of the door
      player.pos.y + player.size.y / 2 > pos.y - size.y / 2 && // within the bottom side of the door
      player.pos.y - player.size.y / 2 < pos.y + size.y / 2    // within the top side of the door
    ) {
      return true;
    } else {
      return false;
    }
  }
  
  void draw(){
    rectMode(CENTER); // always draw door at the center
    
    if (!trueDoor){
      fill(153, 51, 0);
    } else {
      fill(255, 0, 0);
    }
    rect(pos.x, pos.y, size.x, size.y);
  }
}
