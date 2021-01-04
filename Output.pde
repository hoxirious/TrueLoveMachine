class Output
{

  String message = "";


  Output() {}
  
  void update() 
  {
    textSize(20);
    textAlign(CENTER,CENTER);
    text(message, 200, 150);
      if(message.equals("SCORE! 3/3")){
        result = true;
        text("Back and move to step 2", 200, 180);
      }
      else {
      result = false;
      text("Back and try again", 200, 180);
      }
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
