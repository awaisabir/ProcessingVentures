////////PRESS 'S' TO SWITCH THE SORTING ORDER///////////////



Circle[] ArrayOfCircles = new Circle[10];

class Circle
{
  int CircleX;
  int CircleY = height/2;
  int CircleRadius;  //Changing Property


  Circle(int r)
  {    
    CircleRadius = r ;
  }
}

void setup()
{
  size(800, 800);
  background(0);
  int Spacing = width/ ArrayOfCircles.length ;  //spacing of the circles
  int Index = 0;
  while (Index < ArrayOfCircles.length)
  {
    ArrayOfCircles[Index] = NoParameterFunction();
    ArrayOfCircles[Index].CircleX = Spacing/2 + (Index*Spacing);
    drawCircle(ArrayOfCircles[Index], Index);
    Index++;
  }
}

//function with no parameters
Circle NoParameterFunction()
{ 
  Circle C1 = new Circle ((int)random(40, 200));

  return C1;
}

//function to draw the circles
void drawCircle(Circle C2, int b)
{
  fill(0, 255, 0);
  ellipse(C2.CircleX, C2.CircleY, C2.CircleRadius/2, C2.CircleRadius/2);
  fill(0);
  textAlign(CENTER);
  text(b, C2.CircleX, C2.CircleY);
}

//Function to sort the circles out
void selectionSort(Circle[] ArrayOfCircles2)
{
  background(0);
  int currentStartIndex = 1;
  //Nested while loop to draw the circles after the sort
  while (currentStartIndex < ArrayOfCircles.length)
  {
    int innerIndex = currentStartIndex;
    while (innerIndex > 0 &&
      ArrayOfCircles[innerIndex].CircleRadius < ArrayOfCircles[innerIndex - 1].CircleRadius)
    {
      int temporaryX = ArrayOfCircles[innerIndex - 1].CircleX;
      Circle temp = ArrayOfCircles[innerIndex-1];

      ArrayOfCircles[innerIndex-1].CircleX = ArrayOfCircles[innerIndex].CircleX;
      ArrayOfCircles[innerIndex-1] = ArrayOfCircles[innerIndex];
      ArrayOfCircles[innerIndex].CircleX = temporaryX;

      ArrayOfCircles[innerIndex] = temp;

      

      innerIndex--;
    }

    currentStartIndex++;
  }
 int Index = 0;
 while( Index < ArrayOfCircles.length )
 {
   drawCircle(ArrayOfCircles[Index], Index);
   Index++;
 }
}

void draw()
{
}
//void pressed to switch the sorting order after the 's' key is pressed
void keyPressed()
{

  switch(key)
  {
  case 's':

    selectionSort(ArrayOfCircles);
    break;
  }
}

