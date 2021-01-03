class Drawing
{
  float fx=0;
  float fy=0; 
  
  Drawing(float fx, float fy)
  {
    this.fx = fx;
    this.fy = fy; 
  }
  



void DrawBF()
{
  if (mousePressed)
  {
    fx = mouseX;
    fy = mouseY;   
    fill(0);
    circle(fx, fy, 2);
  }
}


void mouseDragged()
{
  fx = mouseX;
  fy = mouseY;
}
}
