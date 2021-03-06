//Checks when the mouse is pressed. This function is global
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
    if (stateVar == 3) {
      guitar.mousePressedCheck();
    } else if (stateVar == 4) {
      drum.mousePressedCheck();
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
      keyboard.mouseReleasedCheck();
    }
  }
}

//This is the hander for the keys that are currently pressed in ALL states of the program
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == UP) {
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
      keyboard.keyPressedCheck();
    } else if (stateVar == 2) {
      interactiveTheremin.keyPressedCheck();
    } else if (stateVar == 3) {
      guitar.keyPressedCheck();
    } else if (stateVar == 4) {
      drum.keyPressedCheck();
    }
  }
}

void keyReleased()
{
  if (state == "OTHER") 
  {
    if (stateVar == 1) {
      keyboard.keyReleasedCheck();
    }
  }
}
