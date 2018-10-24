
public class Timer {
  
  float time;
  boolean finished = false;
  
  Timer(float set) {
    time = set;
  }
  
  int getTime() {
    return ((int)time);
  }
  
  void setTime(float set) {
    time = set;
  }
  
  void countDown() {
    time -= 1/frameRate; //10s = 240; 240 -= 240
    if ((int)time == 0.0) {
      finished = true;
    }
  }
}
