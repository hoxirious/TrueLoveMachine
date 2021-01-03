class Output
{

  String message = "";


  Output() {}
  
  void update() 
  {
    textSize(20);
    textAlign(CENTER,CENTER);
    text(message, 200, 150);
      if(message.equals("YOU ARE MY TRUTH LOVE")) result = true; 
      else result = false; 
    bBack.update();
  }

  void mouseClicked()
  {
    if (bBack.hover())
    {
      superReset();
      showSteps = true;
      println("reset");
    }
  }
}
