class Lists
{
  ArrayList<String> sValue = new ArrayList(); 
  ArrayList<Integer> xValue = new ArrayList(); 
  ArrayList<Integer> yValue = new ArrayList(); 


  Lists(String [] sValue) {
    insertString(sValue);
  }

  Lists(int [] xValue, int [] yValue) {
    insertInteger(xValue, yValue);
  }


  void insertString(String [] sValue)
  {
    for (int i =0; i<sValue.length; i++) {
      this.sValue.add(sValue[i]);
    }
  }

  void insertInteger( int [] xValue, int [] yValue) {
    for (int i =0; i<xValue.length; i++) {
      this.xValue.add(xValue[i]);
      this.yValue.add(yValue[i]);
    }
  }
  void clearString()
  {
    if (home)
      sValue.clear();
    else {
      int i=2;
      while (i<sValue.size())
        sValue.remove(i);
      i++;
    }
  }
}
