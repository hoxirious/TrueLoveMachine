class Drawing
{
  boolean active = false;
  boolean firstAttempt = true; 
  ArrayList <Integer> xValue = new ArrayList ();
  ArrayList <Integer> yValue = new ArrayList ();
  Drawing()
  {
  }

  void pencil() 
  {
    if (mousePressed == true) {
      line(mouseX, mouseY, pmouseX, pmouseY);
      xValue.add(mouseX);
      yValue.add(mouseY);
    }
  }
  void eraser() {
    int index;
    if (mousePressed == true) 
      line(mouseX, mouseY, pmouseX, pmouseY);
    try {
      index =searchIndex(mouseX, mouseY);
      xValue.remove(index);
      yValue.remove(index);
      println("Erased");
    }
    catch(Exception e) {
      println("Erase outside pencil area");
    }
  }

  int searchIndex(int xValue, int yValue)
  {
    for (int i =0; i<this.xValue.size(); i++) {
      if (this.xValue.get(i) == xValue&&this.yValue.get(i) == yValue)       
        return i;
    }
    return -1;
  }

  void saveDataPoint()
  {
    if (active) {
      saveDataPoints = new Lists(xValue, yValue);
    }
  }


  void reset()
  {
    active = false; 
    xValue.clear(); 
    yValue.clear();
  }

  void mouseClicked()
  {
    if (active) {
      if (bBack.hover()) {
        showSteps = true;
        showDrawing = false;
        saveDataPoint(); 
        reset();
      }
      if (bPencil.hover()) {
        pencil = !pencil;
      }
    }
  }
  void mouseDragged()
  {
    if (active) {
      if (pencil) {
        stroke(0);
        pencil();
      } else if (!pencil) {
        stroke(255);
        eraser();
      }
    }
  }
}
