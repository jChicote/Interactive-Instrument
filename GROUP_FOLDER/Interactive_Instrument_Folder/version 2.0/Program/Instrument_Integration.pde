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

public int stateVar, baseWidth, baseHeight, activeRect, iconState;
public int iconDeviation = 70;
public float windowScale, heightScale, widthScale;
public String state = "MENU";

//This is an ordered list of the naming of the menu buttons
String[] instruments = {"Keyboard", "Theremin", "Guitar", "instrument4"};

//Variables related to icons in the main menu
PImage instruments[] = new PImage[4];
PImage contCamera[] = new PImage[2];
PImage contMouse[] = new PImage[2];
PImage contKeyboard[] = new PImage[2];
PImage dispIcon = createImage(820, 868, RGB);
PImage dispCamera = createImage(497, 552, RGB);
PImage dispMouse = createImage(462, 685, RGB);
PImage dispKeyboard = createImage(669, 481, RGB);

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
  background(255, 204, 153);
  video = new Capture(this, 1280, 720);
  
  //Variables setup
  baseWidth = width;
  baseHeight = height;
  widthScale = 700.0/float(baseWidth);
  heightScale = 700.0/float(baseHeight);
  windowScale = 1.0 / widthScale / heightScale;

  rectSizeX = width/2.0 * widthScale;
  rectSizeY = height/6.6 * heightScale;
  deviation = (rectSizeY/2.5+height/5.8);
  
  //Fonts setup
  titleFont = createFont("GillSansBold.TTF", 35.0);
  defaultFont = createFont("LucidaGrande.ttf", 10.0);
  menuFont = createFont("GillSansCond.TTF", 30.0);
  
  //Images setup
  instruments[0] = loadImage("Inst - Theremin.png");
  instruments[1] = loadImage("Inst - Acoustic Guitar.png");
  instruments[2] = loadImage("Inst - Drum.png");
  instruments[3] = loadImage("Inst - Piano.png");
  contCamera[0] = loadImage("Control - Hand Tracking Inactive.png");
  contCamera[1] = loadImage("Control - Hand Tracking.png");
  contMouse[0] = loadImage("Control - Mouse Inactive.png");
  contMouse[1] = loadImage("Control - Mouse.png");
  contKeyboard[0] = loadImage("Control - Keyboard Inactive.png");
  contKeyboard[1] = loadImage("Control - Keyboard.png");
  
  //Classes setup
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
  iconState = 0;
  surface.setSize(baseWidth, baseHeight);
  background(33, 33, 33);
}

void drawPrevious()
{
  if (state == "OTHER")
  {
    if (backOver) {
      fill(179, 0, 0);
    } else {
      fill(255, 102, 102);
    }
    rect(backX, backY, backSizeX, backSizeY);
    fill(255);
    textAlign(CENTER);
    textSize(20 * windowScale);
    text("Back", backX+backSizeX/2, backY+backSizeY/1.45 - windowScale);
  }
}

void drawRectangle()
{
  for (int i = 0; i<4; i++)
  {
    rectX[i] = width/10.0;
    rectY[i] = (height/10.0) + (deviation*i);
    if (rectOver[i] || activeRect == i) {
      fill(180);
    } else {
      fill(245);
    }
    noStroke();
    rect(rectX[i], rectY[i], rectSizeX, rectSizeY);
    fill(255);
    textAlign(CENTER);
    textFont(menuFont);
    textSize(45.0 * windowScale);
    if (i == 0) {
      text("Theremin", rectX[i]+rectSizeX/2, rectY[i]+rectSizeY/1.6);
    } else if (i == 1) {
      text("Guitar", rectX[i]+rectSizeX/2, rectY[i]+rectSizeY/1.6);
    } else if (i == 2) {
      text("Drum", rectX[i]+rectSizeX/2, rectY[i]+rectSizeY/1.6);
    } else if (i == 3) {
      text("Piano", rectX[i]+rectSizeX/2, rectY[i]+rectSizeY/1.6);
    }
  }
    textFont(defaultFont);
    stroke(0);
}

void drawTitle() {
}

void drawInstructions() {
  fill(233, 233, 233);
  textSize(35.0 * windowScale);
  textAlign(LEFT);
  textSize(30);
  textFont(titleFont);
  text("SELECT AN INSTRUMENT", baseWidth/3.0, 40.0/heightScale);
  line(0, 55.0/heightScale, baseWidth, 55.0/heightScale);
}

//This draws the usable control devices
void drawIcon() {
    if (iconState == 0) {
        dispCamera = contCamera[1];
        dispMouse = contMouse[0];
        dispKeyboard = contKeyboard[0];
    } else if (iconState == 1) { 
        dispCamera = contCamera[0];
        dispMouse = contMouse[1];
        dispKeyboard = contKeyboard[1];
    } else if (iconState == 2) { 
        dispCamera = contCamera[0];
        dispMouse = contMouse[1];
        dispKeyboard = contKeyboard[1];
    } else if (iconState == 3) { 
        dispCamera = contCamera[0];
        dispMouse = contMouse[1];
        dispKeyboard = contKeyboard[1];
    }
    
    dispIcon = instruments[iconState];
    dispCamera.resize(0, 75);
    dispMouse.resize(0, 80);
    dispKeyboard.resize(0, 75);
    dispIcon.resize(260,275);
    
    fill(255, 204, 153); //CHANGE THIS TO THE BACKGROUND COLOUR
    noStroke();
    rect(430,230,dispIcon.width, dispIcon.height);
    rect(460,510,dispCamera.width, dispCamera.height);
    rect(460+iconDeviation+10,508,dispMouse.width, dispMouse.height);
    rect(460+iconDeviation*2,510,dispKeyboard.width, dispKeyboard.height);
    image(dispIcon, 430, 230);
    image(dispCamera, 460, 510);
    image(dispMouse, 460+iconDeviation+10, 508);
    image(dispKeyboard, 460+iconDeviation*2, 510);
    stroke(0);
}

void updateIcon()
{
  for (int i = 0; i < 4; i++)
  {
    if (activeRect == i)
    {
      iconState = i;
    }
  }
  drawIcon();
}
void mouseUpdate()
{
  //Checks if the menu buttons in the title screen are hovered over
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
    
    //This checks if the global "back" button is hovered over
  } else if (state == "OTHER") {
    if ((mouseX >= backX)&&(mouseX <= backX+backSizeX)&&(mouseY >= backY)&&(mouseY <= backY+backSizeY))
    {
      backOver=true;
    } else {
      backOver=false;
    }
  }
}
