class Question
{
  boolean active = false; 
  boolean validInput = false;
  String message = ""; 
  String [] answers;
  int questionpack; 

  Input myInput;
  Output myOutput;

  Question(int numsInput, String [] inputPrompts, int questionpack )
  {
    this.questionpack = questionpack; 
    this.answers = new String[numsInput]; 
    this.myInput = new Input(numsInput, inputPrompts); 
    this.myOutput = new Output();
  }

  //set input in textfield to temporary string array
  void setInput()
  {
    //check valid input
    for (int i = 0; i<myInput.box.length; i++) {
      checkValid(myInput.box[i].value);
      if (validInput == false) break;
    }
    //set input 
    if (validInput)
      for (int i=0; i<myInput.box.length; i++) {
        answers[i] = myInput.box[i].value;
      } else //return warning if invalid input
    JOptionPane.showMessageDialog(null, "Please enter valid value (letter only)", "INVALID INPUT!", JOptionPane.ERROR_MESSAGE);
  }

  // to check if valid input
  void checkValid(String answer)
  {

    Pattern p = Pattern.compile("[^A-Za-z]", Pattern.CASE_INSENSITIVE);///valid values
    Matcher m = p.matcher(answer);
    if (m.find() || answer == null || answer.trim().isEmpty()) 
      validInput = false;         
    else
      validInput = true;
  }

  void mouseClicked() 
  {
    if (active) {
      if (input) {
        //if Home is clicked, return home page and refresh all temporary memory
        if (bHome.hover()) {
          reset(); 
          superReset(); 
          home = true;
          saveAnswers.clearString();
          println(saveAnswers.sValue);
          println();
          // compare answer key if Check button is clicked
        } else if (bCheck.hover()) {
          check();
          saveAnswers.insertString(answers);
          println(saveAnswers.sValue);
          println();

          //If Play button is activated, check valid input. Open Steps page if true
        } else if (bPlay.hover())
        {
          setInput(); 
          if (validInput) {
            home = false; 
            showSteps = true;
            saveAnswers= new Lists (answers);
            println(saveAnswers.sValue);
            println();
          }

          //pass event to Input
        } else myInput.mouseClicked();

        //pass event to Output
      } else if (output) {
        myOutput.mouseClicked();
      }
    }
  }          

  void keyPressed() 
  {
    if (active) {
      if (key==ENTER||key==RETURN) {
        if (questionpack ==1) {
          setInput(); 
          if (validInput) {
            home = false; 
            showSteps = true;
            saveAnswers = new Lists (answers);
          }
        } else if (questionpack==2) {
          check();
          saveAnswers.insertString(answers);
        }
      } else
        myInput.keyPressed();
    }
  }
  void update()
  {
    if (active) {
      if (input) {
        myInput.update();
        if (questionpack==2)
          bCheck.update();
      } else if (output) {
        myOutput.update();
      }
    }
  }

  //compare with answer key 
  void check()
  {
    setInput();
    if (validInput) {
      message = questions(answers); 
      input = false; 
      output = true;
    }
    myOutput.message = message;
  }

  void reset()
  {
    active = false;
    showQuestion = false;
    myInput.reset(); 
    answers = new String[myInput.box.length];
  }
}
