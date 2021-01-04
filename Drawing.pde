class Drawing
{
  boolean active = false;
  boolean firstAttempt = true; 

  ArrayList <Integer> xValue = new ArrayList ();
  ArrayList <Integer> yValue = new ArrayList ();
  Drawing()
  {
  }

  boolean inFrame()
  {
    if (mouseX >= 80 && mouseX <= 260 && mouseY >= 80 && mouseY <= 260)
      return true; 
    else return false;
  }

  void pencil() 
  {
    if (mousePressed && inFrame() ) {
      line(mouseX, mouseY, pmouseX, pmouseY);
      xValue.add(pmouseX);
      yValue.add(pmouseY);
      println("mouse is pressed");
    }
  }
  void eraser() {
    int index;

    if (mousePressed&&inFrame()) {
      line(mouseX, mouseY, pmouseX, pmouseY);
      try {
        index =searchIndex(pmouseX, pmouseY);
        xValue.remove(index);
        yValue.remove(index);
        println("Erased");
      }
      catch(Exception e) {
        println("Erase outside pencil area");
      }
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

  void update()
  {

    firstAttempt = false;
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
