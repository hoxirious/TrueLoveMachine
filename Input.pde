class Input
{
  TextField [] box;
  int currentTextField = 0; 
  String [] inputPrompts;  
  
  Input(int numsInput, String [] inputPrompts)
  {
    
    this.inputPrompts = inputPrompts; 
    box = new TextField[numsInput]; 
    
    for(int i =0; i<numsInput; i++)
    {
     box[i] = new TextField(100,170+50*i,200);  
    }
    
    if(numsInput>0)  box[0].state = true; 
  }
  
    void update() {

      if(box.length ==3)
      text("Let's do some writing, eh?", width/2, height/7);
    // showing input page
    for (int i = 0; i < box.length; i++) {
      box[i].update();
      fill(0);
      textSize(13);
      text(inputPrompts[i], 100, 150 + 50 * i);
    }
    
    //updating all text fields
    for (int i = 0; i < box.length; i++) {
      box[i].update();
    }
  }
  
  void keyPressed()
  {
    if(key ==TAB || keyCode == DOWN)
    {
      //deactivate the current field 
      box[currentTextField].state = false; 
      
       //try going to the next element and activating it
      try 
      {
        box[currentTextField + 1].state = true;
        currentTextField++;
      }
      //if this raised indexoutofbounds error activate the first textfield 
      catch(Exception e) {
        box[0].state = true;
        currentTextField = 0;
      }
    }
    //if the up arrow is pressed select the previous textfield
    else if (keyCode == UP) {

      //deactivate current textfield
      box[currentTextField].state = false;

      //if first textfield is active, activate last textfield
      if (currentTextField == 0) {
        box[box.length - 1].state = true;
        currentTextField = box.length - 1;
      } 

      //otherwise activate previous textfield
      else {
        box[currentTextField - 1].state = true;
        currentTextField--;
      }
    }

    //if another key is pressed, pass the event down to the textfields
    else {
      for (int i = 0; i < box.length; i++) {
        box[i].keyPressed();
      }
    }
  }
   void mouseClicked() {

    //going back to home page ; 
    if (bBack.hover()) {
      superReset(); 
      showSteps = true;
      println("back");
    }
    //otherwise pass event down to textfields
    else {
      for (int i = 0; i < box.length; i++) {
        box[i].mouseClicked();
        println("pass");
      }
    }
  }

  void reset() {
    try {
      box[0].state = true;
      box[0].clear();
    }
    catch(Exception e) {
    }
    for (int i = 1; i < box.length; i++) {
      box[i].state = false;
      box[i].clear();
      currentTextField = 0;
    }
  }
}
