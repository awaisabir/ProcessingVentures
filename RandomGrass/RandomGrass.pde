//Integers regarding the while fnction for the grass.
int grassNumber = 0;                   //sets the initial grass number to 0
int NumberofGrass = 500;               //sets the total nuber of grass to 500
float grassX;
float grassY;


void setup()
{
  size(500, 500);       //sets the size of the screen
  background(255);      //sets background as white
}


//function for what the dog should look like
void dog()
{
  stroke(0);
  //integers for the dogHead, which will act as a reference point for all the body parts
  int dogHeadX = width/2;
  int dogHeadY = height/2;
  int dogHeadRadius = 60;
  int dogBodyWidth = height - 190 - height/2;

  //dogBody
  fill(147, 115, 46);
  ellipse(dogHeadX, dogHeadY + dogBodyWidth, 50, 70);

  //dogHead
  fill(147, 115, 46);
  strokeWeight(0.5);
  ellipse(dogHeadX, dogHeadY, dogHeadRadius, dogHeadRadius);

  //dogEyes
  fill(0);
  ellipse(dogHeadX - 15, dogHeadY - 10, 5, 13);
  ellipse(dogHeadX + 15, dogHeadY - 10, 5, 13);

  //dogNose
  triangle(dogHeadX, dogHeadY, 
  dogHeadX - 3, dogHeadY + 5, 
  dogHeadX + 3, dogHeadY + 5);

  //dogMouth
  fill(0);
  strokeWeight(2);
  line(dogHeadX - 10, dogHeadY + 15, dogHeadX + 10, dogHeadY + 15);

  //dogEars
  strokeWeight(0.5);
  fill(111, 90, 46);
  ellipse(dogHeadX -15, dogHeadY - 30, 20, 15);
  ellipse(dogHeadX +15, dogHeadY - 30, 20, 15);
  fill(227, 179, 191);
  ellipse(dogHeadX - 15, dogHeadY - 30, 10, 10);
  ellipse(dogHeadX + 15, dogHeadY - 30, 10, 10);

  //dog Paws
  fill(111, 90, 46);
  ellipse(dogHeadX - 10, dogHeadY + 50, 10, 10);
  ellipse(dogHeadX + 10, dogHeadY + 50, 10, 10);

  //dogFeet
  ellipse(dogHeadX - 10, dogHeadY + 95, 10, 10);
  ellipse(dogHeadX + 10, dogHeadY + 95, 10, 10);
}

//function for what to draw in the grass
void grass()
{
  stroke(0, 255, 0); //sets the stroke of the line to green
  line (grassX, grassY, grassX + 10, grassY + 10);  //line co-ordinates
}





void draw()
{
  grassX = random(0, width);                  //sets the X-cordinate for the line(grass) at a random point
  grassY = random(height/2, height);          //sets the Y-cordnate for the line(grass) at a random point

    while (grassNumber < NumberofGrass)    //sets a condition that the grass has to be less than 500
  {
    grass();                              //draws the grass function
    grassX = random(0, width);             //draws the X-cordinate for the line(grass) at a random point
    grassY = random(height/2, height);     //draws the Y-cordinate for the line(grass) at a random point
    grassNumber++;                        //keeps adding 1 to the number of grass, until it stops at 500
  }
  dog();                                  //draws the dog function
}

