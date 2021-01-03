class Drawing
{
  boolean active = false;
  boolean firstAttempt = true; 
  ArrayList <Integer> xValue = new ArrayList ();
  ArrayList <Integer> yValue = new ArrayList ();
  Drawing()
  {}

  void pencil() 
  {
    if (mousePressed == true) {
      line(mouseX, mouseY, pmouseX, pmouseY);
      xValue.add(mouseX);
      yValue.add(mouseY); 
      println("xmouse is: " + mouseX);
      println("ymouse is: " + mouseY);
    }
  }
  void eraser(){}
  
  void saveDataPoint()
  {
    if(active){
        saveDataPoints = new Lists(xValue,yValue);
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
    if(active){
      if(bBack.hover()){
        showSteps = true;
        showDrawing = false;
        saveDataPoint(); 
        reset();
      }
    }
  }
  void mouseDragged()
  {
    if(active){
        stroke(0);
      pencil();
    }
  }
}
