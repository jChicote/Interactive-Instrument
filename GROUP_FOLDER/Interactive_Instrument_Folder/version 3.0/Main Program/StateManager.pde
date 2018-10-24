//This changes the stored "String" state of the display (cosisting of two states only). Mainly created for "menu" and "other""
public void changeState(String tempState)
{
  reset();
  state = tempState;
  backOver = false;
  for (int i = 0; i<4; i++) {
    rectOver[i] = false;
  }
  System.gc();
}

//This is used for switching between displays and running the initial methods for beginning a new display and instrument
public void runState()
{
  if (state == "MENU") {
    drawInstructions();
    drawRectangle();
    updateIcon();
    stateVar = 0;
  }
  if (state == "OTHER") {
    if (input[0]) {
      stateVar = 1;
      keyboardInitialiser();
    }
    if (input[1]) {
      stateVar = 2;
      thereminInitialiser();
    }
    if (input[2]) {
      stateVar = 3;
      minim = new Minim(this);
      surface.setSize(690,450);  ////Change size?
      guitar.methodRunner(); ////Might want to change to initaliser instead.
    }
    if (input[3]) {
      stateVar = 4;
      drumInitialiser(); ////Might want to change how this Initialiser works. Draws + set up?
    }
    backUpdate();
  }
}

//This checks state and runs the appropriate method according to the state variable number assigned to instrument
public void checkState()
{
  if (stateVar == 1) {
    //runs method runner of KeyBoard class
    keyboard.methodRunner();
  } else if (stateVar == 2) {
    //This runs the theremin
    interactiveTheremin.methodRunner();
  } else if (stateVar == 3) {
    guitar.methodRunner();
  } else if (stateVar == 4) {
    drum.methodRunner();
  }
  drawPrevious();
}

public void menuOne() {
}
