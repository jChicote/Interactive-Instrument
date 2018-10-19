//This changes the stored "String" state of the display. Mainly created for "menu"
public void changeState(String tempState)
{
  reset();
  state = tempState;
  backOver = false;
  for (int i = 0; i<4; i++) {
    rectOver[i] = false;
  }
  //if (state == "MENU") {
  System.gc();
  //}
}

//This is used for switching between displays and running the initial methods for beginning a new display
public void runState()
{
  if (state == "MENU") {
    drawInstructions();
    drawRectangle();
    stateVar = 0;
  }
  if (state == "OTHER") {
    if (input[0]) {
      stateVar = 1;
      //t = new Temp();
      p.initiate();
    }
    if (input[1]) {
      stateVar = 2;
      thereminInitialiser();
    }
    if (input[2]) {
      stateVar = 3;
      //t3 = new TempThree();
      //t3.initiate();
      //t3.display();
    }
    if (input[3]) {
      stateVar = 4;
      //t4 = new TempFour();
      //t4.initiate();
      //t4.display();
    }
    backUpdate();
  }
}

//This checks state and runs the appropriate method according to the state var
public void checkState()
{
  if (stateVar == 1) {
    //Placeholder comment
    p.display();
  } else if (stateVar == 2) {
    video.loadPixels();
    interactiveTheremin.methodRunner();
    updatePixels();
  } else if (stateVar == 3) {
    //Placeholder comment
  } else if (stateVar == 4) {
    //Placeholder comment
  }
  drawPrevious();
}

public void menuOne() {
}
