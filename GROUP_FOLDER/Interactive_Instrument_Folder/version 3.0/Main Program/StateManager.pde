//This changes the stored "String" state of the display (cosisting of two states only). Mainly created for "menu" and "other""
public void changeState(String tempState)
{
  reset();
  state = tempState;
  backOver = false;
  
  for (int i = 0; i<4; i++) {
    rectOver[i] = false;
  }
  if (stateVar == 1)
  {
     keyboard.resetAll();
  } else if (stateVar == 2) {  
    if (videoAvailable) {
      interactiveTheremin.resetAll();
    } else {
      interactiveTheremin.altReset();
    }
  } else if (stateVar == 3)
  {  
     guitar.resetAll();
  } else if (stateVar == 4)
  {
     drum.resetAll();
  }
  System.gc();
}

//Used for switching between displays and running the initial methods for beginning a new display and instrument
public void runState()
{
  if (state == "MENU") {
    background(baseColor);
    drawInstructions();
    drawRectangle();
    updateIcon();
    stateVar = 0;
  }
  if (state == "OTHER") {
    if (input[0]) {
      stateVar = 1;
      keyboard.initialise();
    }
    if (input[1]) {
      stateVar = 2;
      thereminInitialiser();
    }
    if (input[2]) {
      stateVar = 3;
      minim = new Minim(this);
      guitar.methodRunner();
    }
    if (input[3]) {
      stateVar = 4;
      drum.initialise();
    }
      widthScale = 700.0/float(width);
      heightScale = 700.0/float(height);
      backUpdate();
  }
}

//This checks state and runs the appropriate method according to the state variable number assigned to instrument
public void checkState()
{
  if (stateVar == 1) {
    keyboard.methodRunner();
  } else if (stateVar == 2) {
    interactiveTheremin.methodRunner();
  } else if (stateVar == 3) {
    guitar.methodRunner();
  } else if (stateVar == 4) {
    drum.methodRunner();
  }
  drawPrevious();
}
