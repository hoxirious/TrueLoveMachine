class Result
{
  boolean active = false;
  Result() {
  }

  void update()
  {
    if (active) {
      if (result) {
        stroke(0);
        for (int i = 0; i<saveDataPoints.xValue.size(); i++) {
          point(saveDataPoints.xValue.get(i)+35, saveDataPoints.yValue.get(i)+80);
        }
        fill(#C13E66);
        shadowText(saveAnswers.sValue.get(1) +" is "+ saveAnswers.sValue.get(0)+"'s true love", width/2, height/3);
        fill(#F290AC);
        text(saveAnswers.sValue.get(1) +" is "+ saveAnswers.sValue.get(0)+"'s true love", width/2, height/3);
      }
    }
  }

  void mouseClicked()
  {
    if (active) {
      if (bHome.hover()) {
        showResult = false;
        superReset();
        println("reset");
        saveDataPoints.clearInteger();
        result = false;
        home =true;
      }
    }
  }
}
