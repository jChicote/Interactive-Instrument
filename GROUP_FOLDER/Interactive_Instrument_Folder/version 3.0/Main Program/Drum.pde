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
    drum = loadImage("Icons/drum.png");
    cymbals = loadImage("Icons/cymbal.png"); 
}   

void keyPressedCheck()
{
  if(keyPressed == true)
  {
    try {
      if(key == 'k' || key == 'K')// press k or K to play cymbals
         {
           drumPlayer = drumMinim.loadFile("Sounds/Drum/cymbal.wav");
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
    image(drum, 300, 300, 310, 250);
    imageMode(CENTER);
    image(cymbals, 750, 450, 250, 250); 
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
