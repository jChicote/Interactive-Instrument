import ddf.minim.*;
Minim minim;
AudioPlayer player;

class Guitar
{

int  space = 80;
int  now = 0;
float  q= 150;
float  p = 225;


void keyPressed()
{
  

  if (keyPressed == true){
      if(now == 0)
  {
    now ++;
  }
  if (key == 'z'){player = minim.loadFile("c1.wav");player.play();}
  if (key == 'x'){player = minim.loadFile("d1.wav");player.play();}
  if (key == 'c'){player = minim.loadFile("e1.wav");player.play();}
  if (key == 'v'){player = minim.loadFile("f1.wav");player.play();}
  if (key == 'b'){player = minim.loadFile("g1.wav");player.play();}
  if (key == 'n'){player = minim.loadFile("a1.wav");player.play();}
  if (key == 'm'){player = minim.loadFile("b1.wav");player.play();}
  if (key == 'a'){player = minim.loadFile("c2.wav");player.play();}
  if (key == 's'){player = minim.loadFile("d2.wav");player.play();}
  if (key == 'd'){player = minim.loadFile("e2.wav");player.play();}
  if (key == 'f'){player = minim.loadFile("f2.wav");player.play();}
  if (key == 'g'){player = minim.loadFile("g2.wav");player.play();}
  if (key == 'h'){player = minim.loadFile("a2.wav");player.play();}
  if (key == 'j'){player = minim.loadFile("b2.wav");player.play();}
  if (key == 'q'){player = minim.loadFile("c3.wav");player.play();}
  if (key == 'w'){player = minim.loadFile("d3.wav");player.play();}
  if (key == 'e'){player = minim.loadFile("e3.wav");player.play();}
  if (key == 'r'){player = minim.loadFile("f3.wav");player.play();}
  if (key == 't'){player = minim.loadFile("g3.wav");player.play();}
  if (key == 'y'){player = minim.loadFile("a3.wav");player.play();}
  if (key == 'u'){player = minim.loadFile("b3.wav");player.play();}
  if (key == '1'){player = minim.loadFile("c4.wav");player.play();}
  if (key == '2'){player = minim.loadFile("d4.wav");player.play();}
  if (key == '3'){player = minim.loadFile("e4.wav");player.play();}
  if (key == '4'){player = minim.loadFile("f4.wav");player.play();}
  if (key == '5'){player = minim.loadFile("g4.wav");player.play();}
  if (key == '6'){player = minim.loadFile("a4.wav");player.play();}
  if (key == '7'){player = minim.loadFile("b4.wav");player.play();}
  p = random(200,255);
  q = random(100,150);
  }
}


void mousePressed()
{
  
  if (mousePressed == true){
    if(now == 0)
  {
    now ++;
  }
  
  if(mouseY > 70 && mouseY < 140)
  {
    if (mouseX > 70 && mouseX < 140){player = minim.loadFile("c4.wav");player.play();}
    if (mouseX > 150 && mouseX < 220){player = minim.loadFile("d4.wav");player.play();}
    if (mouseX > 230 && mouseX < 300){player = minim.loadFile("e4.wav");player.play();}
    if (mouseX > 310 && mouseX < 380){player = minim.loadFile("f4.wav");player.play();}
    if (mouseX > 390 && mouseX < 460){player = minim.loadFile("g4.wav");player.play();}
    if (mouseX > 470 && mouseX < 540){player = minim.loadFile("a4.wav");player.play();}
    if (mouseX > 550 && mouseX < 620){player = minim.loadFile("b4.wav");player.play();}  
  }
  if(mouseY > 150 && mouseY < 220)
  {
    if (mouseX > 70 && mouseX < 140){player = minim.loadFile("c3.wav");player.play();}
    if (mouseX > 150 && mouseX < 220){player = minim.loadFile("d3.wav");player.play();}
    if (mouseX > 230 && mouseX < 300){player = minim.loadFile("e3.wav");player.play();}
    if (mouseX > 310 && mouseX < 380){player = minim.loadFile("f3.wav");player.play();}
    if (mouseX > 390 && mouseX < 460){player = minim.loadFile("g3.wav");player.play();}
    if (mouseX > 470 && mouseX < 540){player = minim.loadFile("a3.wav");player.play();}
    if (mouseX > 550 && mouseX < 620){player = minim.loadFile("b3.wav");player.play();}  
  }
  if(mouseY > 230 && mouseY < 300)
  {
    if (mouseX > 70 && mouseX < 140){player = minim.loadFile("c2.wav");player.play();}
    if (mouseX > 150 && mouseX < 220){player = minim.loadFile("d2.wav");player.play();}
    if (mouseX > 230 && mouseX < 300){player = minim.loadFile("e2.wav");player.play();}
    if (mouseX > 310 && mouseX < 380){player = minim.loadFile("f2.wav");player.play();}
    if (mouseX > 390 && mouseX < 460){player = minim.loadFile("g2.wav");player.play();}
    if (mouseX > 470 && mouseX < 540){player = minim.loadFile("a2.wav");player.play();}
    if (mouseX > 550 && mouseX < 620){player = minim.loadFile("b2.wav");player.play();}  
  }
  if(mouseY > 310 && mouseY < 380)
  {
    if (mouseX > 70 && mouseX < 140){player = minim.loadFile("c1.wav");player.play();}
    if (mouseX > 150 && mouseX < 220){player = minim.loadFile("d1.wav");player.play();}
    if (mouseX > 230 && mouseX < 300){player = minim.loadFile("e1.wav");player.play();}
    if (mouseX > 310 && mouseX < 380){player = minim.loadFile("f1.wav");player.play();}
    if (mouseX > 390 && mouseX < 460){player = minim.loadFile("g1.wav");player.play();}
    if (mouseX > 470 && mouseX < 540){player = minim.loadFile("a1.wav");player.play();}
    if (mouseX > 550 && mouseX < 620){player = minim.loadFile("b1.wav");player.play();}  
  }
  p = random(200,255);
  q = random(100,150);
  }
}


void draw()
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
}
