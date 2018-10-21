class KeyBoard {
  
  //Global Variables
  AudioContext ac;
  Gain g1;
  Sample sample;
  
  Map<Integer, Keys> keys = new HashMap<Integer, Keys>();
  color fore1 = color(111, 111, 255);
  color fore2 = color(128, 0, 255);
  color back = color(0, 0, 0);
  Glide carrierFreq, modFreqRatio;
  WavePlayer freqModulator;
  PImage img;
  
  void initialise() {
     loop();
     //delay(5);
     ac = new AudioContext();
     g1 = new Gain (ac, 1, 1f);
     ac.start();
     ac.out.addInput(g1);
     noStroke();
     textSize(30);
     try
     {
       sample = new Sample(dataPath("key sound.mp3"));
     }
     catch (IOException e)
     {
       e.printStackTrace();
     }
     keys.put(49, new Keys(1, 0.2f, ac, sample, g1));
     keys.put(50, new Keys(2, 0.4f, ac, sample, g1));
     keys.put(51, new Keys(3, 0.6f, ac, sample, g1));
     keys.put(52, new Keys(4, 0.8f, ac, sample, g1));
     keys.put(53, new Keys(5, 1f, ac, sample, g1));
     keys.put(54, new Keys(6, 1.2f, ac, sample, g1));
     keys.put(55, new Keys(7, 1.4f, ac, sample, g1));
     keys.put(56, new Keys(8, 1.6f, ac, sample, g1));
     keys.put(57, new Keys(9, 1.8f, ac, sample, g1));
     ac.start();
     img = createImage(width, height, RGB);
  }
  
  void methodRunner() {
    if (backOver) {
      resetAll();
    } else {
      renderKeyBoard();
    }
  }
  
  void renderKeyBoard() {
    clear();
    background(255, 163, 70);
    rect(100, 0, 100, 400);
    rect(300, 0, 100, 400);
    rect(500, 0, 100, 400);
    rect(700, 0, 100, 400);
    for (Map.Entry<Integer, Keys> k : keys.entrySet())
    {
      k.getValue().drawObject();
      if(!keyPressed) k.getValue().checkPressed(mouseX, mousePressed);
    }
    //Wave Pixels Displayed
    img.updatePixels();
    for(int i= 0; i < width; i++) 
    {
      int buffIndex = i * ac.getBufferSize() / width;
      int vOffset = (int) ((1 + ac.out.getValue(0, buffIndex)) * 400 / 1.5);
      vOffset = min(vOffset, height);
      //pixels[vOffset * height + i] = fore1;
      //pixels[vOffset * height - i] = fore2;
      img.pixels[vOffset * width - i] = fore2;
      img.pixels[vOffset * width + i] = back;
    }
    image(img, 0, 300);
    text("Use the keyboard or mousepad to press a number", 150, 750);
  }
 
  void keyPressedDetection() {
    Keys object = keys.get(keyCode);
  if (object != null) object.play();
  }
  
  void keyReleasedDetection() {
    Keys object = keys.get(keyCode);
    if (object != null) object.pause();
  }
  
  void mouseReleasedDetection() {
    if(keyPressed) return;
    for (Map.Entry<Integer, Keys> k : keys.entrySet())
    {
      k.getValue().drawObject();
    }
  }
  
  void resetAll() {
    //Reset all variables and stop running processes
    ac.stop();
    keys.clear();
  }
}
