//This file contains the method initialisers t

public void thereminInitialiser() {
  video = new Capture(this, 1280, 720);
  video.start();
  frame = createImage(1280, 720, RGB);
  thresh = createImage(1280, 720, RGB);
  opencv = new OpenCV(this, frame);
  interactiveTheremin = new Module_Theremin();
  interactiveTheremin.initialise();
  interactiveTheremin.initialiseCapture();
}
