//This is a highly modularised version of the hand tracking system
import beads.*;
import processing.video.*;
import gab.opencv.*;
import java.util.*;

//global Lists
ArrayList<PVector> globalCenters;

Capture video;
OpenCV opencv;
Module_Theremin interactiveTheremin;
PImage frame, thresh;

String currentSTATE;
boolean pressed = false;

void setup() {
  size(1280, 720);
  globalCenters = new ArrayList<PVector>();
  video = new Capture(this, 1280, 720);
  video.start();
  frame = createImage(1280, 720, RGB);
  opencv = new OpenCV(this, frame);
  interactiveTheremin = new Module_Theremin();
  interactiveTheremin.initialise();
  interactiveTheremin.initialiseCapture();
}

void draw() {
  video.loadPixels();
  if (interactiveTheremin.captureDone == true) {
    interactiveTheremin.renderSynthTheremin();
  } else if (interactiveTheremin.captureDone == false) {
    interactiveTheremin.captureSample();
  }
  updatePixels();
}

//Captures the frame events in the video
void captureEvent(Capture video) {
  frame.copy(video, 0, 0, video.width, video.height, 0, 0, frame.width, frame.height);
  frame.updatePixels();
  video.read();
}
