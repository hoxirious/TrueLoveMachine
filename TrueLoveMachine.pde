import javax.swing.JOptionPane;
import java.util.regex.Matcher; 
import java.util.regex.Pattern;
import java.util.ArrayList;


//Question question = new Question[2]; 
String [] homePrompts = {"Enter your name: ", "Enter your love's name"}; 
String [] askingPrompts = {"What is his favorite food?", "What is his nickname?", "How many Apple devices does he have?"};
 
//float x, y;
//Snowflake[] snowflakes = new Snowflake[50];

boolean home = true; 
boolean showSteps = false;
boolean check = false; 
boolean input = false; 
boolean output = false; 
boolean result = true;
boolean showResult = false; 
boolean showQuestion = false; 
boolean showDrawing = false; 
boolean pencil = true; 

Question [] question= new Question[2]; 
Lists saveAnswers; 
Lists saveDataPoints;
Drawing newDrawing = new Drawing();
Result finalResult = new Result();

Button bPlay = new Button("Play!", 180, 300, 50, 20, 10);
Button bHome = new Button("Home", 100, 350, 50, 20, 10);
Button bBack = new Button("Back", 300, 350, 50, 20, 10);
Button bCheck = new Button("Let's check", 200, 350, 90, 20, 10);
Button bResult = new Button("See result!", width, 300, 100, 20, 10);
Button bQuestion = new Button ("Personal Challenge", width, 150, 150, 20, 10);
Button bDrawing = new Button ("Art Challenge", width, 200, 150, 20, 10);
Button bPencil = new Button ("Pencil", 300, 150, 40, 20, 10);

void setup() {
  size(400, 400);
  background(#002D26);

  question[0] = new Question (2, homePrompts, 1);
  question[1] = new Question (3, askingPrompts, 2);
}
void draw()
{

  if (home) {
    home();
  } else if (showSteps) {
    steps();
  } else if (showQuestion) {
    questions();
  } else if (showDrawing) {
    drawing();
  } else if (showResult) {
    result();
  }
}

void mousePressed()
{
  if (home) {
    question[0].mouseClicked();
  } else if (showSteps) {
    input = false; 

    if (bQuestion.hover()) {
      input = true; 
      showSteps = false; 
      showQuestion = true;
      saveAnswers.clearString();
      println(saveAnswers.sValue);
      println();
    } else if (bDrawing.hover())
    {
      background(255);
      showSteps = false;
      showDrawing = true;
    } else if (bHome.hover()) {
      showSteps = false; 
      home = true;
      saveAnswers.clearString();
      println(saveAnswers.sValue);
      println();
    } else if (bResult.hover()&&result) {
      showSteps = false;
      showResult = true;
    }
  } else if (showQuestion) {
    question[1].mouseClicked();
  } else if (showDrawing)
  {
    newDrawing.mouseClicked();
  } else if (showResult) {
    finalResult.mouseClicked();
  }
}

void keyPressed() {

  //passing key press event onto all questions
  for ( int i = 0; i < question.length; i++ ) {
    question[i].keyPressed();
  }
}
void mouseDragged() {
  
  newDrawing.mouseDragged();
}

void home()
{
  PImage img;
  img = loadImage("background_sky.jpg");
  image(img, 0, 0,width,height);
  fill(#ffc305);
  textSize(25); 
  textAlign(CENTER, TOP);
  text("Truth love machine", width/2, height/5);

  bPlay.update();

  input = true; 
  question[0].active = true; 
  question[0].update();
}


void superReset()
{
  question[0].reset();
  question[1].reset(); 
  home = false; 
  showSteps = false;
  input = true;
  output = false; 
  showQuestion = false; 
  showDrawing = false;
  println("reset");
}

void steps()
{
  background(255);
  fill(#A01A21);
  textSize(25); 
  textAlign(CENTER, TOP);
  text("Truth love machine", width/2, height/6);

  bQuestion.update();
  bDrawing.update(); 
  bResult.update(); 
  bHome.update();
}

void questions()
{  
  background(255);
  fill(#A01A21); 
  textSize(20); 
  textAlign(CENTER, TOP); 

  question[1].active=true;
  question[1].update(); 
  bHome.update(); 
  bBack.update();
}

void drawing() 
{

  textSize(20); 
  textAlign(CENTER, TOP);
  stroke(#002538);
  strokeWeight(3);
  noFill();
  rect(80, 80, 180, 180);
  newDrawing.active = true;
  bBack.update();
  bPencil.update();
}

void result()
{
  background(255); 
  fill(#A01A21); 
  textSize(20); 
  textAlign(CENTER, TOP);
  text("RESULT!", width/2, height/7);
  finalResult.active = true;
  finalResult.update(); 
  bHome.update();
}


String questions(String[] answers)
{  

  int counter =0;
  if (answers[0].equalsIgnoreCase("Pho")) counter++;
  if (answers[1].equalsIgnoreCase("Bin")) counter++;
  if (answers[2].equalsIgnoreCase("THREE"))counter++;

  String messageTrue = "SCORE! 3/3";
  String messageFalse = "GOY XONG :( "+counter+"/" +answers.length +" CORRECT.";
  if (counter==answers.length)
    return messageTrue;
  else return messageFalse;
}
