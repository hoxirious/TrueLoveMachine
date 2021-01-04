class Output
{

  String message = "";


  Output() {
  }

  void update() 
  {
    textSize(25);
    textAlign(CENTER, CENTER);

    fill(#ffd2ee); 
    text(message, 200, height/2-40);
    if (message.equals("SCORE! 3/3")) {
      result = true;

      text("Back and move to step 2", width/2, height/2);
    } else {
      result = false;

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
      println("reset");
    }
  }
}
