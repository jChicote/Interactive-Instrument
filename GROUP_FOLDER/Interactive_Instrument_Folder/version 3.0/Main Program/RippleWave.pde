//Buffers associated in this class utilise a cellular automata model to propagate the wave.
//Interaction amongst the pixel grid allow local cell values to propagate their values to their local cell neighbors only.

public class rippleWave {  
  int cols;
  int rows;
  float[][] currentWave;
  float[][] previousWave;
  PImage rippleImage;
  float dampening = 0.999;
  
  //Initialise the ripplewave's variables
  public void initialise() {
    cols = width;
    rows = height;
    currentWave = new float[cols][rows];
    previousWave = new float[cols][rows];
    rippleImage = createImage(width, height, HSB); 
  }
  
  public void mouseTrack() {
    println(mouseX, mouseY);
    try {
      previousWave[mouseX][mouseY] = 500;
    } catch (NullPointerException e) {
      previousWave[640][310] = 500;
    }
  }
  
  //Renders the buffers associated with global center's input
  public void renderPoints(ArrayList<PVector> globalCenters) {
    if(globalCenters.size() != 0) {
      for (PVector point : globalCenters) {
        previousWave[(int)point.x][(int)point.y] = 500;
      }
    }
  }
  
  //Renders propagation of ripple utilising the cellular automata model
  public void renderRipple() {
    println("Ripple renderRipple()");
    colorMode(HSB, height, height, height);
    rippleImage.updatePixels();
    for (int i = 1; i < rippleImage.width-2; i++) {
      for (int j = 1; j < rippleImage.height-2; j++) {
        currentWave[i][j] = (
          previousWave[i-1][j] + previousWave[i+1][j] + previousWave[i][j-1] + previousWave[i][j+1]) / 2 - currentWave[i][j];
        currentWave[i][j] = currentWave[i][j] * dampening;
        
        int index = i + j * cols;
        if (currentWave[i][j] > 50) {
          rippleImage.pixels[index] = color(currentWave[i][j], height, height);
        } else {
          rippleImage.pixels[index] = color(0);
        }
      }
    }
    image(rippleImage, 0, 0);
    float[][] tempBuffer = previousWave;
    previousWave = currentWave;
    currentWave = tempBuffer;
  }
}
