//NightTime represents Exam Time
//The shade(s) of red represent the stress during Exam Time



//Integers set
int faceRadius;
int faceX;
int faceY;
int faceColor;
int dayColor;
int nightColor;
int windowWidth;
int windowHeight;
int windowX;
int windowY;


//Function to draw the person at the start of the program
void person()
{
  //face
  strokeWeight(0.5);
  fill(faceColor);
  ellipse(faceX, faceY, faceRadius, faceRadius);

  //eyes
  fill(0);
  ellipse(faceX - 10, faceY - 10, 5, 5);
  ellipse(faceX + 10, faceY - 10, 5, 5);

  //torso
  line(faceX, faceY + faceRadius/2, width/2, faceY + 2*faceRadius);

  //hands
  line(faceX, faceY + faceRadius, faceX - 25, faceY + faceRadius + 20);
  line(faceX, faceY + faceRadius, faceX + 25, faceY + faceRadius + 20);

  //legs
  line(faceX, faceY + faceRadius/2 + faceRadius + 25, faceX - 25, faceY + faceRadius*2 + 40);
  line(faceX, faceY + faceRadius/2 + faceRadius + 25, faceX + 25, faceY + faceRadius*2 + 40);
}

void setup()
{
  //Integers given a value
  size(500, 500);
  faceRadius = 50;
  faceX = width/2;
  faceY = height/2;
  faceColor = color(252, 229, 207);
  dayColor = color(0, 240, 250);
  nightColor = color(0, 0, 255);
  windowWidth = 100;
  windowHeight = 100;
  windowX = width - 150;
  windowY = 100;

  background(255);
  
  //person function drawn at the start of the screen.
  person();

  //mouth
  noFill();
  strokeWeight(1);
  line(faceX, faceY + 10, faceX - 5, faceY + 7);
  line(faceX, faceY + 10, faceX + 5, faceY + 7);

  //floor
  rectMode(CORNER);
  fill(170, 145, 100);
  rect(0, height*3/4 + 10, width, height);

  //window
  strokeWeight(5);
  fill(dayColor);
  rectMode(CENTER);
  rect(windowX, windowY, windowWidth, windowHeight);
}

void draw()
{
}


void mouseClicked()
{
  //To check the color of a pixel in the full program.
  get(mouseX, mouseY);
  if (get(mouseX, mouseY) == dayColor)  //If the color of the pixel(s) is dayColor
  {
    fill(nightColor);                    //Then change it to nightColor (representing Exam Time)
  }
  get(mouseX, mouseY);
  if (get(mouseX, mouseY) == nightColor)    //ViceVersa of the top if function
  {
    fill(dayColor);
  }
  rect(windowX, windowY, windowWidth, windowHeight);




  get(mouseX, mouseY);
  if ( get(mouseX, mouseY) == faceColor)
  {
    //fills the face with a shade of red and changes the smile to a frown (representing stress during Exam Time)
    fill(255, 82, 94);
    ellipse(faceX, faceY, faceRadius, faceRadius);
    noFill();
    strokeWeight(1);
    line(faceX, faceY + 10, faceX - 5, faceY + 15);
    line(faceX, faceY + 10, faceX + 5, faceY + 15);
    ellipse(faceX - 10, faceY - 10, 5, 5);
    ellipse(faceX + 10, faceY - 10, 5, 5);
  } else if (get(mouseX, mouseY) == color(255, 82, 94))   //same concept as the first if function
  {
    fill(255, 30, 40);
    ellipse(faceX, faceY, faceRadius, faceRadius);
    noFill();
    strokeWeight(1);
    line(faceX, faceY + 10, faceX - 5, faceY + 15);
    line(faceX, faceY + 10, faceX + 5, faceY + 15);
    ellipse(faceX - 10, faceY - 10, 5, 5);
    ellipse(faceX + 10, faceY - 10, 5, 5);
  } else if (get(mouseX, mouseY) == color(255, 30, 40))   //same concept as the first if function
  {
    fill(faceColor);
    ellipse(faceX, faceY, faceRadius, faceRadius);
    noFill();
    strokeWeight(1);
    line(faceX, faceY + 10, faceX - 5, faceY + 15);
    line(faceX, faceY + 10, faceX + 5, faceY + 15);
    ellipse(faceX - 10, faceY - 10, 5, 5);
    ellipse(faceX + 10, faceY - 10, 5, 5);
  }
}

