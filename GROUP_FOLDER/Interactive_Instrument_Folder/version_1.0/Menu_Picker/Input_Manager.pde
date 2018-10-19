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
      p.mousePressCheck();
    } else if (stateVar == 2) {
      //Placeholder Code
    } else if (stateVar == 3) {
      //Placeholder Code
    } else if (stateVar == 4) {
      //Placeholder Code
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
      p.mouseReleaseCheck();
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
  if (state == "OTHER") {
    //if (key == BACKSPACE); /*Doesn't detect any special keys properly at the moment.*/
    //{
    //  changeState("MENU");
    //}

    if (stateVar == 1) {
      p.keyPressCheck();
    } else if (stateVar == 2) {
      interactiveTheremin.keyPressedCheck();
    } else if (stateVar == 3) {
      //Placeholder Code
    } else if (stateVar == 4) {
      //Placeholder Code
    }
  }
}

void keyReleased()
{
  if (state == "OTHER") 
  {
    if (stateVar == 1) {
      p.keyReleaseCheck();
    } else if (stateVar == 2) {
      //Placeholder Code
    } else if (stateVar == 3) {
      //Placeholder Code
    } else if (stateVar == 4) {
      //Placeholder Code
    }
  }
}
