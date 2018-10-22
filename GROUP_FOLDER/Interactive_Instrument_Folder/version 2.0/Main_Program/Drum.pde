//import ddf.minim.*;

class Drum{
  PImage img1;//the drum image
  PImage img;//the cymbals image
  
  //Currently Invalid
  /*void intilize()
  {
    Drumsetup();
    Drumdraw();
  }*/
  
  void methodRunner() {
    if (backOver) {
      resetAll();
    } else {
      Drumdraw();
    }
  }
  
  //Currently Invalid
  /*private void display()
  {
    keyPressed();
    mousePressed();
  }*/
  
  void Drumsetup()//set the interface of the drum
  {
      surface.setSize(800, 600); 
      fill(0);
      img1 = loadImage("drum.jpg"); /*-= Change this on final*/
      img = loadImage("Suspendedcymbal.jpg"); 
  }   
  
  void keyPressedCheck()
  {
    if(keyPressed == true)
    {
       if(key == 'k' || key == 'K')// press k or K to play cymbals
    {
      drumPlayer = drumMinim.loadFile("cymbal.mp3");
      drumPlayer.play();
    }
    if(key == 's' || key == 'S')// press s or S to play durm
    {    
     drumPlayer = drumMinim.loadFile("conga.mp3");
     drumPlayer.play();
    }
    }
   
  }
  
  void Drumdraw()
  {
      background(33, 33, 33);
      textSize(20);
      text("Ues mouse or keyboard to play the drum!!!",10,50);
      text("Drum: left of mouse or ‘s’",10,85);
      text("cymbals: right of mouse or 'k'",10,120);
      imageMode(CORNER);
      image(img1, 120, 300, 250, 250);
      imageMode(CENTER);
      image(img, 550, 450, 200, 200); 
     
  }
  
  void mousePressedCheck()
  {
         if(mousePressed && (mouseButton == LEFT))// click left of mouse to play drum
         {  try {
             drumPlayer = drumMinim.loadFile("conga.mp3"); ////NullPointer
             drumPlayer.play();
         } catch (NullPointerException e) {
           println("Audio File is missing");
         }
         }
         if(mousePressed && (mouseButton == RIGHT))// click right of mouse to play cymbals
         {
           try {
             drumPlayer = drumMinim.loadFile("cymbal.mp3");
             drumPlayer.play();
           } catch (NullPointerException e) {
             println("Audio File is missing");
           }
         }
  }
  
  void resetAll() {
    //drumMinim.stop();
  }
}
