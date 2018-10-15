import beads.*;
import org.jaudiolibs.beads.*;
import java.util.HashMap;
import java.util.Map;
import java.io.IOException;
import java.util.Arrays;

AudioContext ac;
Gain g1;
Sample sample;
Map<Integer, Keys> keys = new HashMap<Integer, Keys>();
color fore1 = color(0, 0, 255);
color fore2 = color(128, 0, 255);
color back = color(0, 0, 0);
Glide carrierFreq, modFreqRatio;
WavePlayer freqModulator;
PImage img;

void settings() 
{
   size(1000,800);
}

void setup()
{
   loop();
   delay(5);
   img = loadImage("Heaven_Background_by_Computerinkt.jpg");
   ac = new AudioContext();
   g1 = new Gain (ac, 1, 1f);
   ac.start();
   ac.out.addInput(g1);
   noStroke();
   textSize(32);
   try
   {
     sample = new Sample(dataPath("key sound.wav"));
   }
   catch (IOException e)
   {
     e.printStackTrace();
   }
   keys.put(49, new Keys(1, 0.2f));
   keys.put(50, new Keys(2, 0.4f));
   keys.put(51, new Keys(3, 0.6f));
   keys.put(52, new Keys(4, 0.8f));
   keys.put(53, new Keys(5, 1f));
   keys.put(54, new Keys(6, 1.2f));
   keys.put(55, new Keys(7, 1.4f));
   keys.put(56, new Keys(8, 1.6f));
   keys.put(57, new Keys(9, 1.8f));
   ac.start();
}

void draw()
{
  clear();
  background(img);
  for (Map.Entry<Integer, Keys> k : keys.entrySet())
  {
    k.getValue().drawObject();
    if(!keyPressed) k.getValue().checkPressed(mouseX, mousePressed);
  }
  //Wave Pixels Displayed
  loadPixels();
  for(int i= 0; i < width; i++) 
  {
    int buffIndex = i * ac.getBufferSize() / width;
    
    int vOffset = (int) ((1 + ac.out.getValue(0, buffIndex)) * height / 1.5);
    vOffset = min(vOffset, height);
    pixels[vOffset * height + i] = fore1;
    //pixels[vOffset * height - i] = fore2;
    pixels[vOffset * width - i] = fore2;
    pixels[vOffset * width + i] = back;
  }
  updatePixels();
  text("Use the keyboard to press a number", 150, 750);
}
void keyPressed()
{
  Keys object = keys.get(keyCode);
  if (object != null) object.play();
}
void keyReleased()
{
  Keys object = keys.get(keyCode);
  if (object != null) object.pause();
}
void mouseReleased()
{
  if(keyPressed) return;
  for (Map.Entry<Integer, Keys> k : keys.entrySet())
  {
    k.getValue().drawObject();
  }
}
