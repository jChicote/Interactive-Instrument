import processing.video.*;
import gab.opencv.*;
import java.util.*;
import beads.*;
import org.jaudiolibs.beads.*;
import java.util.HashMap;
import java.util.Map;
import java.io.IOException;
import java.util.Arrays;
import ddf.minim.*;

//Variables associated with MENU
private float[] rectX = new float[4];
private float[] rectY = new float[4];
private float deviation, backX, backY, backSizeX, backSizeY, rectSizeX, rectSizeY;

private boolean[] rectOver = new boolean[4];
private boolean[] input = new boolean[4];
private boolean backOver;

public int stateVar, baseWidth, baseHeight;
public float windowScale, heightScale, widthScale;
public String state = "MENU";

//This is an ordered list of the naming of the menu buttons
String[] instruments = {"Keyboard", "Theremin", "Guitar", "instrument4"};

//Variables associated with INTERACTIVE_THEREMIN
Capture video;
OpenCV opencv;
Module_Theremin interactiveTheremin;
PImage frame, thresh;

//Variables Associated with KEYBOARD;
KeyBoard keyboard = new KeyBoard();

//Variables Associated with KEYBOARD;
Guitar guitar;
Minim minim;
AudioPlayer player;

//sets surface size
void settings() {
  size(1280, 720);
}

//Setup method. Must only run once
void setup()
{
  background(33, 33, 33);
  video = new Capture(this, 1280, 720);
  surface.setResizable(true);

  baseWidth = width;
  baseHeight = height;
  widthScale = 700.0/float(baseWidth);
  heightScale = 700.0/float(baseHeight);
  windowScale = 1.0 / widthScale / heightScale;

  rectSizeX = width/2.0 * widthScale;
  rectSizeY = height/6.6 * heightScale;
  deviation = (rectSizeY/2.5+height/5.8);
  
  guitar = new Guitar();
}

//Main Method
void draw()
{
  mouseUpdate();
  runState();
  checkState();
}

void backUpdate()
{
  //backX = width - (150.0 * widthScale);
  backX = 0.80 * width;
  backY = 10.0 * heightScale;
  backSizeX = width/5.0 * widthScale;
  //backSizeX = width/6;
  backSizeY = height/15.0 * heightScale;
}

//This is the global function for the "camera". DO NOT DELETE THIS, as this is the only function responsible for camera frame handling.
void captureEvent(Capture video) {
  frame.copy(video, 0, 0, video.width, video.height, 0, 0, frame.width, frame.height);
  frame.updatePixels();
  video.read();
}

//This is just called to reset the background
void reset() {
  surface.setSize(baseWidth, baseHeight);
  background(33, 33, 33);
}

void drawPrevious()
{
  if (state == "OTHER")
  {
    if (backOver) {
      fill(255, 22, 22);
    } else {
      fill(255, 58, 58);
    }
    rect(backX, backY, backSizeX, backSizeY);
    fill(255);
    textSize(20 * (windowScale*0.80));
    text("Back", backX+backSizeX/2 - backSizeX/4.5, backY+backSizeY/1.4);
  }
}

void drawRectangle()
{
  for (int i = 0; i<4; i++)
  {
    rectX[i] = width/10.0;
    rectY[i] = (height/10.0) + (deviation*i);
    if (rectOver[i]) {
      fill(77, 77, 77);
    } else {
      fill(99, 99, 99);
    }
    noStroke();
    rect(rectX[i], rectY[i], rectSizeX, rectSizeY);
    fill(255);
    textAlign(LEFT);
    textSize(25.0 * windowScale);
    text(instruments[i], rectX[i]+20, rectY[i]+rectSizeY/1.5);
  }
}

void drawTitle() {
}

void drawInstructions() {
  fill(233, 233, 233);
  textSize(35.0 * windowScale);
  textAlign(LEFT);
  textSize(30);
  text("SELECT AN INSTRUMENT", baseWidth/3.0, 40.0/heightScale);
  line(0, 55.0/heightScale, baseWidth, 55.0/heightScale);
}

void mouseUpdate()
{
  if (state == "MENU") {
    for (int i=0; i < 4; i++)
    {
      if ((mouseX >= rectX[i])&&(mouseX <= rectX[i]+rectSizeX)&&(mouseY >= rectY[i])&&(mouseY <= rectY[i]+rectSizeY))
      {
        rectOver[i]=true;
      } else {
        rectOver[i]=false;
      }
    }
    /*Change Preview Images and Songs*/
    //if (rectOver[0]) { 
    //  background(255, 0, 0);
    //} else if (rectOver[1]) { 
    //  background(0, 255, 0);
    //} else if (rectOver[2]) { 
    //  background(0, 0, 255);
    //} else if (rectOver[3]) { 
    //  background(0);
    //} else {
    //  background(255);
    //}
    
    
    //This checks if the global "back" button is hovered and pressed
  } else if (state == "OTHER") {
    if ((mouseX >= backX)&&(mouseX <= backX+backSizeX)&&(mouseY >= backY)&&(mouseY <= backY+backSizeY))
    {
      backOver=true;
    } else {
      backOver=false;
    }
  }
}
