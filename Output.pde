class Output
{

  String message = "";


  Output() {
  }

  void update() 
  {
    textSize(25);
    textAlign(CENTER, CENTER);
    fill(#C13E66);
    shadowText(message, width/2, height/2-40);
    fill(#F290AC);
    text(message, width/2, height/2-40);

    if (message.equals("SCORE! 3/3")) {
      result = true;
      fill(#C13E66);
      shadowText("Back and move to step 2", width/2, height/2);
      fill(#F290AC);
      text("Back and move to step 2", width/2, height/2);
    } else {
      result = false;
      fill(#C13E66);
      shadowText("Back and try again", width/2, height/2);
      fill(#F290AC);
      text("Back and try again", width/2, height/2);
    }
    bBack.update();
  }

  void mouseClicked()
  {
    if (bBack.hover())
    {
      superReset();
      showSteps = true;
    } else if (bHome.hover())
    {
      superReset();
      home = true;
    }
  }
}
