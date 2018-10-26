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
public color baseColor = color(33,33,33);

//Font variables
PFont titleFont;
PFont defaultFont;
PFont menuFont;

//This is an ordered list of the naming of the menu buttons
String[] instruments = {"Keyboard", "Theremin", "Guitar", "Drum"};

//Variables related to icons in the main menu
PImage instrumentsIcon[] = new PImage[4];
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
boolean videoAvailable = true;

//Variables Associated with KEYBOARD;
Keyboard keyboard = new Keyboard();

//Variables Associated with GUITAR;
Guitar guitar = new Guitar();
Minim minim;
AudioPlayer player;

//Variables Associated with DRUM
Drum drum = new Drum();
AudioPlayer drumPlayer;

//sets surface size
void settings() {
  size(1280, 720);
}

//Setup method. Must only run once
void setup()
{
  background(baseColor);
  //Prevents program from loading the video capture module if no cameras are detected to prevent crashing.
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("There are no cameras currently available.\nTheremin switching to mouse mode.");
    videoAvailable = false;
  } else {
    video = new Capture(this, 1280, 720);
  } 
  
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
  titleFont = createFont("Fonts/GillSansBold.TTF", 35.0);
  defaultFont = createFont("Fonts/LucidaGrande.ttf", 10.0);
  menuFont = createFont("Fonts/GillSansCond.TTF", 30.0);
  
  //Images setup
  instrumentsIcon[0] = loadImage("Icons/Inst - Piano.png");
  instrumentsIcon[1] = loadImage("Icons/Inst - Theremin.png");
  instrumentsIcon[2] = loadImage("Icons/Inst - Acoustic Guitar.png");
  instrumentsIcon[3] = loadImage("Icons/Inst - Drum.png");
  contCamera[0] = loadImage("Icons/Control - Hand Tracking Inactive.png");
  contCamera[1] = loadImage("Icons/Control - Hand Tracking.png");
  contMouse[0] = loadImage("Icons/Control - Mouse Inactive.png");
  contMouse[1] = loadImage("Icons/Control - Mouse.png");
  contKeyboard[0] = loadImage("Icons/Control - Keyboard Inactive.png");
  contKeyboard[1] = loadImage("Icons/Control - Keyboard.png");
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
  backX = 0.80 * width;
  backY = 10.0 * heightScale;
  backSizeX = width/5.0 * widthScale-10;
  backSizeY = height/15.0 * heightScale;
}

//This is the global function for the "camera". DO NOT DELETE THIS, as this is the only function responsible for camera frame handling.
void captureEvent(Capture video) {
  frame.copy(video, 0, 0, video.width, video.height, 0, 0, frame.width, frame.height);
  frame.updatePixels();
  video.read();
}

//Method to reset the background.
void reset() {
  iconState = 0;
  stroke(0);
  textFont(defaultFont);
  imageMode(CORNERS);
  widthScale = 700.0/float(baseWidth);
  heightScale = 700.0/float(baseHeight);
  surface.setSize(baseWidth, baseHeight);
  background(baseColor);
}

//Draws the "BACK" button on the instruments.
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
    textFont(menuFont);
    textSize(20 * windowScale);
    text("Back", backX+backSizeX/2, backY+backSizeY/1.3 - windowScale);
    textFont(defaultFont);
  }
}

//Draws the menu buttons on the main menu.
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
    fill(0);
    textAlign(CENTER);
    textFont(menuFont);
    textSize(30.0 * windowScale);
    text(instruments[i], rectX[i]+rectSizeX/2, rectY[i]+rectSizeY/1.5);
  }
    textFont(defaultFont);
    stroke(0);
}

void drawInstructions() {
  fill(15);
  rect(0,0, baseWidth, 55.0/heightScale);
  fill(233, 233, 233);
  textAlign(CENTER);
  textFont(titleFont);
  text("SELECT AN INSTRUMENT", width/2, 40.0/heightScale);
  stroke(255);
  line(0, 55.0/heightScale, baseWidth, 55.0/heightScale);
  stroke(0);
}


//This draws the instruments and its control methods.
void drawIcon() {
    if (iconState == 0) { 
        dispCamera = contCamera[0];
        dispMouse = contMouse[1];
        dispKeyboard = contKeyboard[1];
    } else if (iconState == 1) {
        if (videoAvailable) {
        dispCamera = contCamera[1];
        dispMouse = contMouse[0];
        dispKeyboard = contKeyboard[0];
        fill(255);
        textAlign(CENTER);
        textFont(menuFont);
        textSize(45);
        text("(Camera Mode)", 900, 150);
        } else {
          dispCamera = contCamera[0];
          dispMouse = contMouse[1];
          dispKeyboard = contKeyboard[0];
          fill(255);
          textAlign(CENTER);
          textFont(menuFont);
          textSize(45);
          text("(Mouse Mode)", 900, 150);
        }
    } else if (iconState == 2) { 
        dispCamera = contCamera[0];
        dispMouse = contMouse[1];
        dispKeyboard = contKeyboard[1];
    } else if (iconState == 3) { 
        dispCamera = contCamera[0];
        dispMouse = contMouse[1];
        dispKeyboard = contKeyboard[1];
    }
    
    dispIcon = instrumentsIcon[iconState];
    dispCamera.resize(0, 85);
    dispMouse.resize(0, 90);
    dispKeyboard.resize(0, 85);
    dispIcon.resize(472,500);
    
    float controlX = 760;
    float controlY = 600;
    image(dispIcon, 640, 100);
    image(dispCamera, controlX, controlY);
    image(dispMouse, controlX+iconDeviation+10, controlY-2);
    image(dispKeyboard, controlX+iconDeviation*2, controlY);
}

void updateIcon()
{
  for (int i = 0; i < 4; i++)
  {
    if (rectOver[i] || activeRect == i)
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
        activeRect = i;
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
