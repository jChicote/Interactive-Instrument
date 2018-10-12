
public class rippleWave {  
  int cols;
  int rows;
  float[][] currentWave;
  float[][] previousWave;
  PImage rippleImage;
  float dampening = 0.999;
  
  public void initialise() {
    cols = width;
    rows = height;
    currentWave = new float[cols][rows];
    previousWave = new float[cols][rows];
    rippleImage = createImage(width, height, HSB); 
  }
  
  void mouseDragged() {
    previousWave[mouseX][mouseY] = 500;
  }
  
  public void renderPoints() {
    if(globalCenters.size() != 0) {
      for (PVector point : globalCenters) {
        previousWave[(int)point.x][(int)point.y] = 500;
      }
    }
  }
  
  public void renderRipple() {
    //background(0);
    colorMode(HSB, height, height, height);
    rippleImage.updatePixels();
    //loadPixels();
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
    text("working, working", 10, 10);
    //updatePixels();
    float[][] tempBuffer = previousWave;
    previousWave = currentWave;
    currentWave = tempBuffer;
  }
  
}
