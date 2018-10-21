//This file contains the method initialisers that is responsible for re-initialising object variables when needed

public void thereminInitialiser() {
  video.start();
  frame = createImage(1280, 720, RGB);
  thresh = createImage(1280, 720, RGB);
  opencv = new OpenCV(this, frame);
  interactiveTheremin = new Module_Theremin();
  interactiveTheremin.initialise();
  interactiveTheremin.initialiseCapture();
}
void keyboardInitialiser() {
  surface.setSize(1100, 800);
  updatePixels();
  keyboard.initialise();
}
