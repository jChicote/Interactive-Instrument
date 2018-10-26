class Keyboard {
  
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
     ac = new AudioContext();
     g1 = new Gain (ac, 1, 1f);
     ac.start();
     ac.out.addInput(g1);
     noStroke();
     textSize(30);
     try
     {
       sample = new Sample(dataPath("Sounds/Keyboard/key sound.mp3"));
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
     
     //This creates a blank, black image
     img = createImage(width, height, RGB);
     for (int i = 0; i < img.pixels.length; i++) {
        img.pixels[i] = color(0); 
      }
  }
  
  void methodRunner() {
      renderKeyBoard();
  }
  
  void renderKeyBoard() {
    clear();
    background(255, 163, 70);
    
    fill(255);
    rect(100, 0, 100, 400);
    rect(300, 0, 100, 400);
    rect(500, 0, 100, 400);
    rect(700, 0, 100, 400);
    
    for (Map.Entry<Integer, Keys> k : keys.entrySet())
    {
      k.getValue().drawObject();
      if(!keyPressed) k.getValue().checkPressed(mouseX, mousePressed);
    }
    
    image(img, 0, 300);

    //Wave Pixels Displayed
    loadPixels();
    for(int i= 0; i < width; i++) 
    {
      int buffIndex = i * ac.getBufferSize() / width;
      int vOffset = (int) ((1 + ac.out.getValue(0, buffIndex)) * 765 / 1.5);
      vOffset = min(vOffset, height);
      pixels[vOffset * width + i] = fore1;
      pixels[vOffset * width - i] = fore2;
    }
    updatePixels();
    fill(233);
    textSize(20);
    textAlign(LEFT);
    text("Press a number using the keyboard or use the mouse to play a sound.", 10,700);
  }
 
  void keyPressedCheck() {
    Keys object = keys.get(keyCode);
  if (object != null) object.play();
  }
  
  void keyReleasedCheck() {
    Keys object = keys.get(keyCode);
    if (object != null) object.pause();
  }
  
  void mouseReleasedCheck () {
    if(keyPressed);
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
