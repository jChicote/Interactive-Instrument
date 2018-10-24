import beads.*;
import processing.video.*;
import gab.opencv.*;
import java.util.*;

public class Module_Theremin {
  
  //global Lists
  ArrayList<PVector> globalCenters;
  
  //Audio & Video
  LinkedList<Theremin> synths;
  Theremin singleSynth;
  VideoProcess filterVid;
  MainTracking tracking;
  rippleWave waterWave;
  
  boolean captureDone = false;
  int windowWidth = 1280;
  int windowHeight = 720;
  String currentSTATE;
  boolean pressed = false;
  
  Timer theTimer = new Timer(5);
  
//------------------------------------------------- Internal Method Initialisers ------------------------------------------------------ 
 
  void initialise() {
    println("Theremin initialise()");
    globalCenters = new ArrayList<PVector>();
    synths = new LinkedList<Theremin>();
    filterVid = new VideoProcess(200, 255);
    tracking = new MainTracking();
    waterWave = new rippleWave();
  }
  
  //This is only used when camera is unavailable
  void altInitialise() {
    println("Alternative Theremin Player");
    singleSynth = new Theremin(4, height);
    waterWave = new rippleWave();
    waterWave.initialise();
    singleSynth.begin();
  }
  
  void initialiseCapture()  {
    println("Theremin initialiseCapture()");
    theTimer.setTime(5);
    currentSTATE = "capture";
    pressed = false;
  }
  
  void initialiseTheremin() {
    println("Theremin initialiseTheremin()");
    waterWave.initialise();
    theTimer.finished = false;
    key = 0;
    currentSTATE = "theremin";
    pressed = false;
    
    //Declare Theremin Player
    synths.add(new Theremin(4, height));
    synths.add(new Theremin(4, height));
    synths.add(new Theremin(4, height));
    for (Theremin synth : synths) {
      synth.begin();
    }
  }
  
//------------------------------------------------- Class Methods ------------------------------------------------------ 

  void methodRunner() {
    println("Theremin methodRunner()");
    if (videoAvailable) {
        video.loadPixels();
        if (captureDone == true) {
          renderSynthTheremin();
        } else if (captureDone == false) {
          captureSample();
        }
        updatePixels();
    } else {
        altRenderTheremin();
    }
  }
  
  //Captures HSV profile from webcam video input
  void captureSample() {
    println("Theremin captureSample()");
    pushMatrix();
    translate(video.width,0);
    scale(-1, 1);
    image(video, 0, 0);
    popMatrix();
    
    stroke(255, 0, 0);
    strokeWeight(2);
    noFill();
    ellipse(640, 280, 15, 15);
    ellipse(620, 320, 15, 15);
    ellipse(650, 360, 15, 15);
    ellipse(660, 400, 15, 15);
    ellipse(640, 430, 15, 15);
    noStroke();
    
    theTimer.countDown();
    textAlign(LEFT);
    fill(255);
    textSize(50);
    text(theTimer.getTime(), 20, 60);
    textSize(30);
    text("From about 1 meter distance. Cover the dots with your hand", 23, 100);
    noFill();
    
    if (theTimer.finished == true) {
      filterVid.testSample();
      captureDone = true;
      initialiseTheremin();
    }
  }
  
  //Renders instrument synthesiser and display information
  void renderSynthTheremin() {   
    background(33,33,33);
    println("Theremin renderSynthTheremin()");
    filterVid.processFrame();
    globalCenters = tracking.currentCenters;
    waterWave.renderPoints(globalCenters);
    waterWave.renderRipple();
    
    tint(255, 90);
    image(thresh, 0, 0);
    noTint();
    
    fill(255);
    textAlign(LEFT);
    textSize(20);
    text("Upper Threshold: press 's' or 'x' key", 20, 0.95 * height);
    text("Lower Threshold: press 'a' or 'z' key", 20, 0.95 * height + 20);
    noFill();
    
    tracking.trackingUpdate();
    
    if (globalCenters.size() > 0) {
      if (globalCenters.size() >= synths.size()) {
        for (int i = 0; i < synths.size(); i++) {
          synths.get(i).update((int)globalCenters.get(i).y);
        }
      } else if (globalCenters.size() < synths.size()) {
        for (int i = 0; i < globalCenters.size(); i++) {
          if (synths.get(i).wq.isPaused()) {
            synths.get(i).wq.pause(false);
          }
          synths.get(i).update((int)globalCenters.get(i).y);
        }
        for (int i = globalCenters.size(); i < synths.size(); i++) {
          synths.get(i).wq.pause(true);
        }
      }
    } else {
      for (Theremin synth : synths) {
        synth.wq.pause(true);
      }
    }
  }
  
  void altRenderTheremin() {   
    background(33,33,33);
    println("Theremin altRenderTheremin()");
    waterWave.mouseTrack();
    waterWave.renderRipple();
    singleSynth.update(mouseY);
  }
  
//------------------------------------------------- Instrumet Additional Handlers ------------------------------------------------------ 
  
  void keyPressedCheck() {
    println("Theremin keyPressedCheck()");
    // This is a fine tuning control for filter
    if (currentSTATE == "theremin" && keyPressed == true) {
      filterVid.sensorControl(key);
    }
  }
  
  void resetAll() {
    println("Theremin resetAll()");
    for (Theremin synth : synths) {
      synth.ac.stop();
    }
    synths.clear();
    video.stop();
    globalCenters.clear();
    captureDone = false;
    pressed = false;
    colorMode(RGB, 255);
  }
  
  //This is the alternative reset incase video is not available
  void altReset() {
    singleSynth.wq.pause(true);
    singleSynth.ac.stop();
    pressed = false;
    colorMode(RGB, 255);
  }
}
