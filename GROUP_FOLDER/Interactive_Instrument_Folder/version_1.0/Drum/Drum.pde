SoundFile file;
SoundFile player;
import processing.sound.*;

class Drum{
PImage img1;//the drum image
PImage img;//the cymbals image

private void intilize()
{
  Drumsetup();
  Drumdraw();
}

void Drumsetup()//set the interface of the drum
{
    surface.setSize (1280,720); 
    fill(255);
    img1 = loadImage("drum.jpg");
    img = loadImage("Suspendedcymbal.jpg"); 
}   

void keyPressed()
{

     if(key == 'k' || key == 'K')// press k or K to play cymbals
  {
    player.play();
  }
  if(key == 's' || key == 'S')// press s or S to play durm
  {    
   file.play();
  }
 
}

void Drumdraw()
{
    background(0);
    textSize(20);
    
    text("Ues mouse or keyboard to play the drum!!!",200,50);
    text("Drum: left of mouse or ‘s’",200,85);
    text("cymbals: right of mouse or 'k'",200,120);
    imageMode(CORNER);
    image(img1, 120, 300, 250, 250);
    imageMode(CENTER);
    image(img, 550, 450, 200, 200); 
   
}

void mousePressed()
{
       if(mousePressed && (mouseButton == LEFT))// click left of mouse to play drum
       {  
           file.play();
       }
       if(mousePressed && (mouseButton == RIGHT))// click right of mouse to play cymbals
       {
           player.play();
       }
}
}
  
