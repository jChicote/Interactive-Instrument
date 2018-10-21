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
      minim = new Minim(this);
      surface.setSize(690,450); 
      g.draw();
  
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

    }
    backUpdate();
  }
}

public void checkState()
{
  if (stateVar == 1) {
    //Placeholder comment
    p.display();
  } else if (stateVar == 2) {
    g.draw();
    g.mousePressed();
    g.keyPressed();
  } else if (stateVar == 3) {
    //Placeholder comment
  } else if (stateVar == 4) {
    //Placeholder comment
  }
  drawPrevious();
}

public void menuOne() {
}
