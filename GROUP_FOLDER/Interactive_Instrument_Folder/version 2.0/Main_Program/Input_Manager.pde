//Checkes when the mouse is pressed. This function is global
void mousePressed()
{
  if (state == "MENU") {
    for (int i=0; i < 4; i++)
    {
      if (rectOver[i])
      {
        input[i] = true;
        changeState("OTHER");
      }
    }
  } else if (state == "OTHER") {
    if (backOver) {
      changeState("MENU");
    }
    if (stateVar == 1) {
      //Placeholder Code
    } else if (stateVar == 2) {
      //Placeholder Code
    } else if (stateVar == 3) {
      guitar.mousePressedDetection();
    } else if (stateVar == 4) {
      drum.mousePressedDetection();
    }
  }
}

//This listens if the mouse is released. This function is globally accessible
void mouseReleased()
{
  for (int i=0; i < 4; i++)
  {
    if (input[i])
    {
      input[i] = false;
    }
    if (stateVar == 1) {
      keyboard.mouseReleasedDetection();
    } else if (stateVar == 2) {
      //Placeholder Code
    } else if (stateVar == 3) {
      //Placeholder Code
    } else if (stateVar == 4) {
      //Placeholder Code
    }
  }
}

//This is the hander for the keys that are currently pressed in ALL states of the program
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == UP) {
      println("HI");
      if (activeRect != -1) { activeRect -= 1; }
      if (activeRect == -1) { activeRect = 3; }
    }
    if (keyCode == DOWN) {
      if (activeRect != 4) { activeRect += 1; }
      if (activeRect == 4) { activeRect = 0; }
    }
  }
  if (keyCode == 10) {
    input[activeRect] = true;
    changeState("OTHER");
  }
  
  if (state == "OTHER") {
    if (keyCode == 8) {
      changeState("MENU");
    }

    if (stateVar == 1) {
      keyboard.keyPressedDetection();
    } else if (stateVar == 2) {
      interactiveTheremin.keyPressedCheck();
    } else if (stateVar == 3) {
      guitar.keyPressedDetection();
    } else if (stateVar == 4) {
      drum.keyPressedDetection();
    }
  }
}

void keyReleased()
{
  if (state == "OTHER") 
  {
    if (stateVar == 1) {
      keyboard.keyReleasedDetection();
    } else if (stateVar == 2) {
      //Placeholder Code
    } else if (stateVar == 3) {
      //Placeholder Code
    } else if (stateVar == 4) {
      //Placeholder Code
    }
  }
}
