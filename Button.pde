class Button
{
  String name ="";
  boolean state = false; 

  float fx = 0; 
  float fy = 0; 
  float fwidth = 100;
  float fheight = 100; 
  float fradii = 0; 

  color inActive = color(166, 129, 38);
  color active = color(198, 152, 42);
  color hover = color(227, 173, 48);
  color labelColor = 255;

  Button(String name, float fx, float fy, float fwidth, float fheight, float fradii)
  {
    this.name = name; 
    this.fx = fx; 
    this.fy = fy;
    this.fwidth = fwidth; 
    this.fheight = fheight; 
    this.fradii = fradii;
  }

  boolean hover()
  {
    if ( mouseX >= fx && mouseX <= fx + fwidth && mouseY >= fy && mouseY <= fy+fheight)
      return true; 
    else 
    return false;
  }
  
  
  void update() 
   {
    textSize(13);
    textAlign(CENTER, CENTER);
    noStroke();

    if (state)
    {
      fill(active);
      rect(fx, fy, fwidth, fheight, fradii);
    } else if (!state && hover())
    {
      fill(hover);
      rect(fx, fy, fwidth, fheight, fradii);
    } else
    {
      fill(inActive);
      rect(fx, fy, fwidth, fheight, fradii);
    }
    fill(labelColor);
    textAlign(CENTER, CENTER);
    text(name, fx + fwidth/2, fy + fheight / 2 - 3);
  }
}
