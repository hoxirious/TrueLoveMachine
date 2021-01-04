class Result
{
  boolean active = false;
  Result() {
  }

  void update()
  {
    if (active) {
      if (result) {
        saveDataPoints.printOut(); 
        stroke(0);
        for (int i = 0; i<saveDataPoints.xValue.size(); i++) {
          point(saveDataPoints.xValue.get(i), saveDataPoints.yValue.get(i)+50);
        }
        text(saveAnswers.sValue.get(1) +" is "+ saveAnswers.sValue.get(0)+"'s true love",width/2, height/3);
      }
    }
  }

  void mouseClicked()
  {
    if (active) {
      if (bHome.hover()) {
        showResult = false;
        superReset();
        home =true;
      }
    }
  }
}
