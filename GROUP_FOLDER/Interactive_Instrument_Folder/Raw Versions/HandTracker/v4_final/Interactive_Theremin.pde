import beads.*;
import processing.video.*;
import gab.opencv.*;
import java.util.*;

public class Module_Theremin {
  
  //AV
  LinkedList<Theremin> synths;
  VideoProcess filterVid;
  MainTracking tracking;
  rippleWave waterWave;
  
  boolean captureDone = false;
  int windowWidth = 1280;
  int windowHeight = 720;
  
  Timer theTimer = new Timer(10);
  
  void initialise() {
    filterVid = new VideoProcess(80, 255);
    tracking = new MainTracking();
    waterWave = new rippleWave();
  }
  
  void initialiseCapture()  {
    theTimer.setTime(10);
    currentSTATE = "capture";
    pressed = false;
  }
  
  void initialiseTheremin() {
    waterWave.initialise();
    theTimer.finished = false;
    key = 0;
    currentSTATE = "theremin";
    pressed = false;
    
    //Declare Theremin Player
    synths = new LinkedList<Theremin>();
    synths.add(new Theremin(4, height));
    synths.add(new Theremin(4, height));
    synths.add(new Theremin(4, height));
    for (Theremin synth : synths) {
      synth.begin();
    }
  }
  
  void captureSample() {
      background(0);
      pushMatrix();
      translate(video.width,0);
      scale(-1, 1);
      image(video, 0, 0);
      popMatrix();
      
      noFill();
      stroke(255, 0, 0);
      strokeWeight(2);
      ellipse(640, 280, 15, 15);
      ellipse(620, 320, 15, 15);
      ellipse(650, 360, 15, 15);
      ellipse(660, 400, 15, 15);
      ellipse(640, 430, 15, 15);
      
      theTimer.countDown();
      fill(255);
      textSize(50);
      text(theTimer.getTime(), 20, 60);
      textSize(30);
      text("From about 1 meter distance. Cover the dots with your hand", 23, 100);
      if (theTimer.finished == true) {
        filterVid.testSample();
        captureDone = true;
        initialiseTheremin();
      }
  }
  
  void renderSynthTheremin() {
    background(33, 33, 33);
    keyPressed();
    
    filterVid.processFrame();
    globalCenters = tracking.currentCenters;
    waterWave.renderPoints();
    waterWave.renderRipple();
    tint(255, 90);
    image(thresh, 0, 0);
    noTint();
    tracking.trackingUpdate();
    if (globalCenters.size() > 0) {
      if (globalCenters.size() >= synths.size()) {
        for (int i = 0; i < synths.size(); i++) {
          synths.get(i).update((int)globalCenters.get(i).y);
        }
      } else if (globalCenters.size() < synths.size()) {
        println(globalCenters.size());
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
  
  void keyPressed() {
    /*if (key == 'q') {
      for (Theremin synth : synths) {
        synth.ac.stop();
      }
      //Change the function to whatever state handler is being used.
      changeState("menu");
    }*/
    // This is a fine tuning control for filter
    if (currentSTATE == "theremin" && keyPressed == true) {
      filterVid.sensorControl(key);
    }
  }
  
  
}
