/******** PERCENTAGE OF HEALTHY SURVIVORS IS PRINTLINED ***********/
/******** BULLETS ON HAND OF THE HEALTHY SURVIVORS IS ALSO PRINTLINED ********/



//String of the names of the Survivors
String[] SurvivorNames = 
{
  "Achmed", 
  "Mohamed", 
  "Logan", 
  "Juan", 
  "Bob", 
  "Tom", 
  "Pedro", 
  "Shaniqua", 
  "Karim", 
  "Tyrone"
};

//Survivor Class
class Survivor
{
  String SurvivorName = SurvivorNames[(int)random(0, SurvivorNames.length)]; //sets the String to a random name
  boolean injured = random(1) < 0.7;                   //boolean for the injured
  boolean infected = random(1) < 0.3;                  //boolean for the infected
  int NumberofBullets = (int)random(0, 75);            //intiger for the Number of Bullets

  int SurvivorX  = (int)random(width);          //X postion of the cicle of the survivor
  int SurvivorY  = (int)random(height);         //Y position of the circle of the survivor


  //function to draw Survivors
  void DrawSurvivors()
  {
    if (infected == true)                       //IF the person is infected then:
    {                                     
      fill(255, 128, 49);                       //Then Fill it orange
    } else if (injured == true)              //Else IF the person is injureed then:
    {
      fill(255, 0, 0);                       //Fill it red
    } else {
      fill(0, 255, 0);                          //IF neither, then fill it with green
    }
    ellipse(SurvivorX, SurvivorY, 150, 100);      //Draws and ellipse with the appropriate fill at a random X and Y position

    fill(0);
    textSize(20);
    textAlign(CENTER, CENTER);
    text(SurvivorName, SurvivorX, SurvivorY);      //writes the name of the survivor in the circle
  }
}

Survivor[] Survivors = new Survivor[10];              //Survivor array of 10 objects


void setup()
{
  size(600, 600);
  background(255);

  //while loop to draw the ellipses
  int Index = 0;
  while ( Index < Survivors.length )
  {
    Survivors[Index] = new Survivor();
    Survivors[Index].DrawSurvivors();
    Index++;
  }

  //Presentation of the Percentage of Healthy and the number of bullets on them
  println(round(PercentageSurvivors(Survivors)) + "% Healthy Survivors");
  println(NumberofBullets(Survivors) + " Bullets On Hand");
}


//function for the calculation of Percentage of Healthy Survivors 
float PercentageSurvivors(Survivor[] Survivors)
{
  int Index = 0;
  int StartingHealthyPeople_default = 0;

  while ( Index < Survivors.length )
  {
    if ( (Survivors[Index].infected == false) && (Survivors[Index].injured == false) )
    {
      StartingHealthyPeople_default++;
    }
    Index++;
  }
  return ( ((float)StartingHealthyPeople_default /Survivors.length) * 100 );
}

//function for the calculation of Number of Bullets on the Healthy Survivors
int NumberofBullets(Survivor[] Bullets)
{
  int Index = 0;
  int TotalBullets = 0;

  while ( Index < Survivors.length )
  {
    if ( (Survivors[Index].infected == false) && (Survivors[Index].injured == false) )
    {
      TotalBullets += Bullets[Index].NumberofBullets;
    }
    Index++;
  }

  return TotalBullets;
}

