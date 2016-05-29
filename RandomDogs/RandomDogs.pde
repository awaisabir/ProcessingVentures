int dogNumber = 1;          //sets the initial dog number to 1
int Totaldognumber = 15;    //sets the total number of dogs to 15


void setup()
{
  size(500, 500);
}

void dog(float dogHeadX, float dogHeadY)  // passes the parameters dogHeadX and dogHeadY in the dog function
{
  stroke(0);
  //integers related to the dimensions of the dog
  //int dogHeadX = width/2;    //these 2 lines had to be cut out because you are passing them as parameters in the function
  //int dogHeadY = height/2;
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


void draw()
{  
  while (dogNumber <= Totaldognumber)  //sets a condition that the total number of dogs has to be less than or equal 15
  {
    float dogX = random(0, width);     //makes a variable dogX which is set at random X cordinates
    float dogY = random(0, height);    //makes a variable dogY which is set at random Y cordinates
    dog(dogX, dogY);                  //passes a parameter dogX and dogY which replaces dogHeadX and dogHeadY

    dogNumber++;                     //adds 1 to the number of dogs up till the max, which is 15
  }
}

