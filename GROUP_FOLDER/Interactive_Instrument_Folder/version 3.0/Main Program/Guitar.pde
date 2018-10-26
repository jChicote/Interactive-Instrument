class Guitar
{

  int  space = 110;
  float  q= 150;
  float  p = 225;
  char[] pitch = {'C','D','E','F','G','A','B'};
  char[] octave = {'4','3','2','1'};
  
  void methodRunner() {
    renderGuitar();
  }
  
  void renderGuitar()
  {
      background(0);
      
      textSize(100);
      text("Virtual Guitar", 475, 120);
      
      textSize(35);
      text("Guide :", 930, 140);
      
      textSize(25);
      text("1.Four rows mean four octaves.", 1060, 190);
      text("2.Each button from left to right", 1060, 240);
      text("in the same row indicates one", 1080, 270);
      text("different pitch from low to high.", 1085, 300);
      text("3.'z'to'm' on the keyboard", 1030, 350);
      text("represents : C1 to B1", 1030, 380);
      text("   'a'to'j' on the keyboard", 1030, 420);
      text("represents : C2 to B2", 1030, 450);
      text("   'q'to'u' on the keyboard", 1030, 490);
      text("represents : C3 to B3", 1030, 520);
      text("   '1'to'7' on the keyboard", 1030, 560);
      text("represents : C4 to B4", 1030, 590);
      text("4.Use spacebar to stop", 1030, 640);
      text("sound immediately.", 1030, 670);
      
      noStroke();
      for (int i = 0 ; i< 4 ; i++)
        for (int j = 0 ; j<7; j++)
        {
          fill(q);
          rect(j*space+(space-15), i*space+(space-15+80), space-10, space-10);
          fill(p);
          rect(j*space+(space-15)+15, i*space+(space-15+80)+15, 70, 70);
        }
        
      for (int i = 175 ; i< 615 ; i = i + 110)
        for (int j = 95 ; j< 865; j = j + 110)
        {
          textSize(40);
          fill(q);
          text(pitch[(j-95)/95],j+39,i+70);
          text(octave[(i-175)/95],j+64,i+70);
        }
       
      for (int i = 175 ; i< 615 ; i = i + 110)
        for (int j = 95 ; j< 865; j = j + 110)
        {
          if(mouseY > i && mouseY < i+100)
          {
            if(mouseX > j && mouseX < j+100)
            {
              fill(p);
              rect(j,i, space-10, space-10);
              fill(q);
              rect(j+15,i+15, 70, 70);
              textSize(40);
              fill(p);
              text(pitch[(j-95)/95],j+39,i+70);
              text(octave[(i-175)/95],j+64,i+70);
            }
          }        
        }  
  }
  
  void keyPressedCheck()
  {

    if (keyPressed == true){
      if (key == 'z' || key == 'Z'){player = minim.loadFile("Sounds/Guitar/c1.wav");player.play();} //
      if (key == 'x' || key == 'X'){player = minim.loadFile("Sounds/Guitar/d1.wav");player.play();}
      if (key == 'c' || key == 'C'){player = minim.loadFile("Sounds/Guitar/e1.wav");player.play();}
      if (key == 'v' || key == 'V'){player = minim.loadFile("Sounds/Guitar/f1.wav");player.play();}
      if (key == 'b' || key == 'B'){player = minim.loadFile("Sounds/Guitar/g1.wav");player.play();}
      if (key == 'n' || key == 'N'){player = minim.loadFile("Sounds/Guitar/a1.wav");player.play();}
      if (key == 'm' || key == 'M'){player = minim.loadFile("Sounds/Guitar/b1.wav");player.play();}
      if (key == 'a' || key == 'A'){player = minim.loadFile("Sounds/Guitar/c2.wav");player.play();}
      if (key == 's' || key == 'S'){player = minim.loadFile("Sounds/Guitar/d2.wav");player.play();}
      if (key == 'd' || key == 'D'){player = minim.loadFile("Sounds/Guitar/e2.wav");player.play();}
      if (key == 'f' || key == 'F'){player = minim.loadFile("Sounds/Guitar/f2.wav");player.play();}
      if (key == 'g' || key == 'G'){player = minim.loadFile("Sounds/Guitar/g2.wav");player.play();}
      if (key == 'h' || key == 'H'){player = minim.loadFile("Sounds/Guitar/a2.wav");player.play();}
      if (key == 'j' || key == 'J'){player = minim.loadFile("Sounds/Guitar/b2.wav");player.play();}
      if (key == 'q' || key == 'Q'){player = minim.loadFile("Sounds/Guitar/c3.wav");player.play();}
      if (key == 'w' || key == 'W'){player = minim.loadFile("Sounds/Guitar/d3.wav");player.play();}
      if (key == 'e' || key == 'E'){player = minim.loadFile("Sounds/Guitar/e3.wav");player.play();}
      if (key == 'r' || key == 'R'){player = minim.loadFile("Sounds/Guitar/f3.wav");player.play();}
      if (key == 't' || key == 'T'){player = minim.loadFile("Sounds/Guitar/g3.wav");player.play();}
      if (key == 'y' || key == 'Y'){player = minim.loadFile("Sounds/Guitar/a3.wav");player.play();}
      if (key == 'u' || key == 'U'){player = minim.loadFile("Sounds/Guitar/b3.wav");player.play();}
      if (key == '1' || key == '1'){player = minim.loadFile("Sounds/Guitar/c4.wav");player.play();}
      if (key == '2' || key == '2'){player = minim.loadFile("Sounds/Guitar/d4.wav");player.play();}
      if (key == '3' || key == '3'){player = minim.loadFile("Sounds/Guitar/e4.wav");player.play();}
      if (key == '4' || key == '4'){player = minim.loadFile("Sounds/Guitar/f4.wav");player.play();}
      if (key == '5' || key == '5'){player = minim.loadFile("Sounds/Guitar/g4.wav");player.play();}
      if (key == '6' || key == '6'){player = minim.loadFile("Sounds/Guitar/a4.wav");player.play();}
      if (key == '7' || key == '7'){player = minim.loadFile("Sounds/Guitar/b4.wav");player.play();}
      if (key == ' '){resetAll();}
      p = random(200,255);
      q = random(100,150);
    }
  }
  
  void mousePressedCheck()
  {
    
    if (mousePressed == true){
    
    if(mouseY > 175 && mouseY < 275)
    {
      if (mouseX > 95 && mouseX < 195){player = minim.loadFile("Sounds/Guitar/c4.wav");player.play();}
      if (mouseX > 205 && mouseX < 305){player = minim.loadFile("Sounds/Guitar/d4.wav");player.play();}
      if (mouseX > 315 && mouseX < 415){player = minim.loadFile("Sounds/Guitar/e4.wav");player.play();}
      if (mouseX > 425 && mouseX < 525){player = minim.loadFile("Sounds/Guitar/f4.wav");player.play();}
      if (mouseX > 535 && mouseX < 635){player = minim.loadFile("Sounds/Guitar/g4.wav");player.play();}
      if (mouseX > 645 && mouseX < 745){player = minim.loadFile("Sounds/Guitar/a4.wav");player.play();}
      if (mouseX > 755 && mouseX < 855){player = minim.loadFile("Sounds/Guitar/b4.wav");player.play();}  
    }
    if(mouseY > 285 && mouseY < 385)
    {
      if (mouseX > 95 && mouseX < 195){player = minim.loadFile("Sounds/Guitar/c3.wav");player.play();}
      if (mouseX > 205 && mouseX < 305){player = minim.loadFile("Sounds/Guitar/d3.wav");player.play();}
      if (mouseX > 315 && mouseX < 415){player = minim.loadFile("Sounds/Guitar/e3.wav");player.play();}
      if (mouseX > 425 && mouseX < 525){player = minim.loadFile("Sounds/Guitar/f3.wav");player.play();}
      if (mouseX > 535 && mouseX < 635){player = minim.loadFile("Sounds/Guitar/g3.wav");player.play();}
      if (mouseX > 645 && mouseX < 745){player = minim.loadFile("Sounds/Guitar/a3.wav");player.play();}
      if (mouseX > 755 && mouseX < 855){player = minim.loadFile("Sounds/Guitar/b3.wav");player.play();}  
    }
    if(mouseY > 395 && mouseY < 495)
    {
      if (mouseX > 95 && mouseX < 195){player = minim.loadFile("Sounds/Guitar/c2.wav");player.play();}
      if (mouseX > 205 && mouseX < 305){player = minim.loadFile("Sounds/Guitar/d2.wav");player.play();}
      if (mouseX > 315 && mouseX < 415){player = minim.loadFile("Sounds/Guitar/e2.wav");player.play();}
      if (mouseX > 425 && mouseX < 525){player = minim.loadFile("Sounds/Guitar/f2.wav");player.play();}
      if (mouseX > 535 && mouseX < 635){player = minim.loadFile("Sounds/Guitar/g2.wav");player.play();}
      if (mouseX > 645 && mouseX < 745){player = minim.loadFile("Sounds/Guitar/a2.wav");player.play();}
      if (mouseX > 755 && mouseX < 855){player = minim.loadFile("Sounds/Guitar/b2.wav");player.play();}  
    }
    if(mouseY > 505 && mouseY < 605)
    {
      if (mouseX > 95 && mouseX < 195){player = minim.loadFile("Sounds/Guitar/c1.wav");player.play();}
      if (mouseX > 205 && mouseX < 305){player = minim.loadFile("Sounds/Guitar/d1.wav");player.play();}
      if (mouseX > 315 && mouseX < 415){player = minim.loadFile("Sounds/Guitar/e1.wav");player.play();}
      if (mouseX > 425 && mouseX < 525){player = minim.loadFile("Sounds/Guitar/f1.wav");player.play();}
      if (mouseX > 535 && mouseX < 635){player = minim.loadFile("Sounds/Guitar/g1.wav");player.play();}
      if (mouseX > 645 && mouseX < 745){player = minim.loadFile("Sounds/Guitar/a1.wav");player.play();}
      if (mouseX > 755 && mouseX < 855){player = minim.loadFile("Sounds/Guitar/b1.wav");player.play();}  
    }
    p = random(200,255);
    q = random(100,150);
    }
  }
  
  void resetAll() {
    minim.stop();
  }
 
}
