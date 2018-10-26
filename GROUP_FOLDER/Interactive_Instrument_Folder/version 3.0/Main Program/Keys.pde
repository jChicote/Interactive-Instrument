//import beads.*;

public class Keys
{
  SamplePlayer sp;
  int key;
  boolean isActive = false;
  Gain objectGain;
  
  public Keys (int key, float pitch, AudioContext ac, Sample sample, Gain g1)
  {
    this.key = key;
    this.sp = new SamplePlayer(ac, sample);
    objectGain = new Gain (ac, 1, 0.1f);
    sp.setPitch(new Glide(ac, pitch));
    sp.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);
    objectGain.setGain(0);
    objectGain.addInput(sp);
    g1.addInput(objectGain);
  }
  
  void drawObject()
  {
    if (isActive)
    {
      fill(255);
      rect(key == 0 ? 900: (key - 1) * 100, 0, 100, 400);
      fill(0);
    }
    else
    {
      fill(0);
    }
    textSize(30);
    text(key + "", (key == 0 ? 900: (key - 1) * 100) + 50, 50);
  }
  
  void play()
  {
    isActive = true;
    objectGain.setGain(0.5f);
  }
  void pause()
  {
    isActive = false;
    objectGain.setGain(0);
  }
  void checkPressed(float position, boolean isPressed)
  {
        int start = (key == 0 ? 900 : (key - 1) * 100);
        int end = (key == 0 ? 900 : (key - 1) * 100) + 100;
        if (position >= start && position <= end && isPressed) play();
        else if (isPressed && (position <= start || position >= end)) pause();
  }
}
