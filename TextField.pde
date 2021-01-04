class TextField
{
  int currentTextField = 0; 
  color background = color(214, 210, 210);
  boolean state = false; 
  String value =""; 
  float fx = 0; 
  float fy = 0; 
  float fwidth = 100;
  float fheight = 20;

  TextField(float fx, float fy, float fwidth)
  { 
    this.fx = fx; 
    this.fy = fy;
    this.fwidth = fwidth;
  }

  boolean hover()
  {
    if ( mouseX >= fx && mouseX <= fx + fwidth && mouseY >= fy && mouseY <= fy+fheight)
      return true; 
    else 
    return false;
  }

  void mouseClicked() {
    //if the textfield is clicked on it will become active
    if (hover()) {
      state = true;
    }
    //if anywhere else if clicked it will become inactive
    else {
      state = false;
    }
  }

  void keyPressed()
  {
    if (state)
    {
      if (key == BACKSPACE || key == DELETE)
      {
        if (value.length() > 0)
        {
          value = value.substring(0, value.length() -1);
        }
        // ignore shift key when doing uppercase
      } else if (key != CODED && key!=SHIFT ) 
      { 
        value += key;
      }
    }
  }

  void clear()
  {
    value = "";
  }

  void update()
  {
    textAlign(LEFT, TOP);
    fill(background);
    textSize(13);
    if (state) 
    {
      stroke(#002538);
      strokeWeight(3);
      rect(fx, fy, fwidth, fheight, 5);
      fill(#002538);
      text(value, fx + 5, fy + 1.5);
      ////covering overflow
      //fill(255);
      //noStroke();
      //rect(fx + fwidth + 1, fy, 400, fheight);
    } else 
    {
      fill(background);
      noStroke();
      rect(fx, fy, fwidth, fheight, 5);
      fill(#002538);
      text(value, fx + 5, fy + 1.5);
      ////covering overflow
      //fill(255);
      //noStroke();
      //rect(fx + fwidth + 1, fy, 400, fheight);
    }
  }
}
