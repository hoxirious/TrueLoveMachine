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
        for (int i = 1; i<saveDataPoints.xValue.size(); i++) {
          line(saveDataPoints.xValue.get(i), saveDataPoints.yValue.get(i), saveDataPoints.xValue.get(i-1), saveDataPoints.yValue.get(i-1));
        }
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
