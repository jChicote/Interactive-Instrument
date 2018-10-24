Minim drumMinim = new Minim(this);

import processing.sound.*;
class Drum{
  PImage drum;//the drum image
  PImage cymbals;//the cymbals image
  
void initialise()
{
  Drumsetup();
  Drumdraw();
}

void methodRunner() {
  Drumdraw();
}

void Drumsetup()//set the interface of the drum
{
    fill(255);
    drum = loadImage("Icons/drum.jpg"); /*-= Change this on final*/
    cymbals = loadImage("Icons/Suspendedcymbal.jpg"); 
}   

void keyPressedCheck()
{
  if(keyPressed == true)
  {
    try {
      if(key == 'k' || key == 'K')// press k or K to play cymbals
         {
           drumPlayer = drumMinim.loadFile("Sounds/Drum/cymbal.wav"); ////NullPointer
           drumPlayer.play();
         }
         if(key == 's' || key == 'S')// press s or S to play durm
         {    
           drumPlayer = drumMinim.loadFile("Sounds/Drum/conga.wav");
           drumPlayer.play();
         }
      } catch (NullPointerException e) {
         println(e);
      }
  }
}

void Drumdraw()
{
    background(0);
    textSize(20);
    textAlign(LEFT);
    text("Use mouse or keyboard to play the drums.",10,50);
    text("Drum: Left Mouse Click or ‘s’",10,85);
    text("cymbals: Right Mouse Click or 'k'",10,120);
    imageMode(CORNER);
    image(drum, 120, 300, 250, 250);
    imageMode(CENTER);
    image(cymbals, 550, 450, 200, 200); 
}

void mousePressedCheck()
{
       if(mouseButton == LEFT)// click left of mouse to play drum
       {   try {
            drumPlayer = drumMinim.loadFile("Sounds/Drum/conga.wav");
            drumPlayer.play();
       }  catch (NullPointerException e) {
           println("Audio File is missing");
       }
       }
       if(mousePressed && (mouseButton == RIGHT))// click right of mouse to play cymbals
       {   try {
            drumPlayer = drumMinim.loadFile("Sounds/Drum/cymbal.wav");
            drumPlayer.play();
       }   catch (NullPointerException e) {
             println("Audio File is missing");
       }
       }
}

void resetAll() {
  drumMinim.stop();
}
}
