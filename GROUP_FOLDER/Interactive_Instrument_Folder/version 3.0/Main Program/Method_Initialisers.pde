//This file contains the method initialisers that is responsible for re-initialising object variables when needed

public void thereminInitialiser() {
  if (videoAvailable == true) {
    video.start();
    frame = createImage(1280, 720, RGB);
    thresh = createImage(1280, 720, RGB);
    opencv = new OpenCV(this, frame);
    interactiveTheremin = new Module_Theremin();
    interactiveTheremin.initialise();
    interactiveTheremin.initialiseCapture();
  } else if (videoAvailable == false) {
    interactiveTheremin = new Module_Theremin();
    interactiveTheremin.altInitialise();
  }
}

void keyboardInitialiser() {
  surface.setSize(1100, 800);
  updatePixels();
  keyboard.initialise();
}

void drumInitialiser() {
  drum = new Drum();
  drum.Drumsetup();
  drumMinim = new Minim(this);
}
