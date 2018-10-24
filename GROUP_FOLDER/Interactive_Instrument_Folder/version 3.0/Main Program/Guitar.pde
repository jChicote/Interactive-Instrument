/*== Necessary changes?
Minim > Beads
Text on the individual keys
Stops abruptly when playing multiple sounds?*/

class Guitar
{

  int  space = 80;
  int  now = 0;
  float  q= 150;
  float  p = 225;
  
  void methodRunner() {
    renderGuitar();
  }
  
  void renderGuitar()
  {
      background(0);
      noStroke();
      for (int i = 0 ; i< 4 ; i++)
        for (int j = 0 ; j<7; j++)
        {
          fill(q);
          rect(j*space+(space-10), i*space+(space-10), space-10, space-10);
          fill(p);
          rect(j*space+(space-10)+10, i*space+(space-10)+10, 50, 50);
        }
      for (int i = 70 ; i< 380 ; i = i + 80)
        for (int j = 70 ; j<620; j = j + 80)
        {
          if(mouseY > i && mouseY < i+70)
          {
            if(mouseX > j && mouseX < j+70)
            {
              fill(p);
              rect(j,i, space-10, space-10);
              fill(q);
              rect(j+10,i+10, 50, 50);
            }
          }        
        }  
  }
  
  void keyPressedCheck()
  {

    if (keyPressed == true){
        if(now == 0)
    {
      now ++;
    }
    if (key == 'z'){player = minim.loadFile("Sounds/Guitar/c1.wav");player.play();} /*-= CHANGE THIS ON FINAL*/
    if (key == 'x'){player = minim.loadFile("Sounds/Guitar/d1.wav");player.play();}
    if (key == 'c'){player = minim.loadFile("Sounds/Guitar/e1.wav");player.play();}
    if (key == 'v'){player = minim.loadFile("Sounds/Guitar/f1.wav");player.play();}
    if (key == 'b'){player = minim.loadFile("Sounds/Guitar/g1.wav");player.play();}
    if (key == 'n'){player = minim.loadFile("Sounds/Guitar/a1.wav");player.play();}
    if (key == 'm'){player = minim.loadFile("Sounds/Guitar/b1.wav");player.play();}
    if (key == 'a'){player = minim.loadFile("Sounds/Guitar/c2.wav");player.play();}
    if (key == 's'){player = minim.loadFile("Sounds/Guitar/d2.wav");player.play();}
    if (key == 'd'){player = minim.loadFile("Sounds/Guitar/e2.wav");player.play();}
    if (key == 'f'){player = minim.loadFile("Sounds/Guitar/f2.wav");player.play();}
    if (key == 'g'){player = minim.loadFile("Sounds/Guitar/g2.wav");player.play();}
    if (key == 'h'){player = minim.loadFile("Sounds/Guitar/a2.wav");player.play();}
    if (key == 'j'){player = minim.loadFile("Sounds/Guitar/b2.wav");player.play();}
    if (key == 'q'){player = minim.loadFile("Sounds/Guitar/c3.wav");player.play();}
    if (key == 'w'){player = minim.loadFile("Sounds/Guitar/d3.wav");player.play();}
    if (key == 'e'){player = minim.loadFile("Sounds/Guitar/e3.wav");player.play();}
    if (key == 'r'){player = minim.loadFile("Sounds/Guitar/f3.wav");player.play();}
    if (key == 't'){player = minim.loadFile("Sounds/Guitar/g3.wav");player.play();}
    if (key == 'y'){player = minim.loadFile("Sounds/Guitar/a3.wav");player.play();}
    if (key == 'u'){player = minim.loadFile("Sounds/Guitar/b3.wav");player.play();}
    if (key == '1'){player = minim.loadFile("Sounds/Guitar/c4.wav");player.play();}
    if (key == '2'){player = minim.loadFile("Sounds/Guitar/d4.wav");player.play();}
    if (key == '3'){player = minim.loadFile("Sounds/Guitar/e4.wav");player.play();}
    if (key == '4'){player = minim.loadFile("Sounds/Guitar/f4.wav");player.play();}
    if (key == '5'){player = minim.loadFile("Sounds/Guitar/g4.wav");player.play();}
    if (key == '6'){player = minim.loadFile("Sounds/Guitar/a4.wav");player.play();}
    if (key == '7'){player = minim.loadFile("Sounds/Guitar/b4.wav");player.play();}
    p = random(200,255);
    q = random(100,150);
    }
  }
  
  void mousePressedCheck()
  {
    
    if (mousePressed == true){
      if(now == 0)
    {
      now ++;
    }
    
    if(mouseY > 70 && mouseY < 140)
    {
      if (mouseX > 70 && mouseX < 140){player = minim.loadFile("Sounds/Guitar/c4.wav");player.play();}
      if (mouseX > 150 && mouseX < 220){player = minim.loadFile("Sounds/Guitar/d4.wav");player.play();}
      if (mouseX > 230 && mouseX < 300){player = minim.loadFile("Sounds/Guitar/e4.wav");player.play();}
      if (mouseX > 310 && mouseX < 380){player = minim.loadFile("Sounds/Guitar/f4.wav");player.play();}
      if (mouseX > 390 && mouseX < 460){player = minim.loadFile("Sounds/Guitar/g4.wav");player.play();}
      if (mouseX > 470 && mouseX < 540){player = minim.loadFile("Sounds/Guitar/a4.wav");player.play();}
      if (mouseX > 550 && mouseX < 620){player = minim.loadFile("Sounds/Guitar/b4.wav");player.play();}  
    }
    if(mouseY > 150 && mouseY < 220)
    {
      if (mouseX > 70 && mouseX < 140){player = minim.loadFile("Sounds/Guitar/c3.wav");player.play();}
      if (mouseX > 150 && mouseX < 220){player = minim.loadFile("Sounds/Guitar/d3.wav");player.play();}
      if (mouseX > 230 && mouseX < 300){player = minim.loadFile("Sounds/Guitar/e3.wav");player.play();}
      if (mouseX > 310 && mouseX < 380){player = minim.loadFile("Sounds/Guitar/f3.wav");player.play();}
      if (mouseX > 390 && mouseX < 460){player = minim.loadFile("Sounds/Guitar/g3.wav");player.play();}
      if (mouseX > 470 && mouseX < 540){player = minim.loadFile("Sounds/Guitar/a3.wav");player.play();}
      if (mouseX > 550 && mouseX < 620){player = minim.loadFile("Sounds/Guitar/b3.wav");player.play();}  
    }
    if(mouseY > 230 && mouseY < 300)
    {
      if (mouseX > 70 && mouseX < 140){player = minim.loadFile("Sounds/Guitar/c2.wav");player.play();}
      if (mouseX > 150 && mouseX < 220){player = minim.loadFile("Sounds/Guitar/d2.wav");player.play();}
      if (mouseX > 230 && mouseX < 300){player = minim.loadFile("Sounds/Guitar/e2.wav");player.play();}
      if (mouseX > 310 && mouseX < 380){player = minim.loadFile("Sounds/Guitar/f2.wav");player.play();}
      if (mouseX > 390 && mouseX < 460){player = minim.loadFile("Sounds/Guitar/g2.wav");player.play();}
      if (mouseX > 470 && mouseX < 540){player = minim.loadFile("Sounds/Guitar/a2.wav");player.play();}
      if (mouseX > 550 && mouseX < 620){player = minim.loadFile("Sounds/Guitar/b2.wav");player.play();}  
    }
    if(mouseY > 310 && mouseY < 380)
    {
      if (mouseX > 70 && mouseX < 140){player = minim.loadFile("Sounds/Guitar/c1.wav");player.play();}
      if (mouseX > 150 && mouseX < 220){player = minim.loadFile("Sounds/Guitar/d1.wav");player.play();}
      if (mouseX > 230 && mouseX < 300){player = minim.loadFile("Sounds/Guitar/e1.wav");player.play();}
      if (mouseX > 310 && mouseX < 380){player = minim.loadFile("Sounds/Guitar/f1.wav");player.play();}
      if (mouseX > 390 && mouseX < 460){player = minim.loadFile("Sounds/Guitar/g1.wav");player.play();}
      if (mouseX > 470 && mouseX < 540){player = minim.loadFile("Sounds/Guitar/a1.wav");player.play();}
      if (mouseX > 550 && mouseX < 620){player = minim.loadFile("Sounds/Guitar/b1.wav");player.play();}  
    }
    p = random(200,255);
    q = random(100,150);
    }
  }
  
  void resetAll() {
    minim.stop();
  }
 
}
