//The physical representation is only of the GDP for the year 2008
//Clicking on a circle will display the exact GDP for all the years.





//csv file
final String filename = "scitech-spending.csv";
//array of object
GDPinfo[] ArrayofGDPinfo;

//global variable
int graphShowingIndex = -1;

//Class
class GDPinfo
{
  String countryNames;
  int   firstyear_2008;
  int   secondyear_2009;
  int   thirdyear_2010;
  int   fourthyear_2011;
  int   fifthyear_2012;
}

//final global variables
final int numRows = 1;
final int numCols = 7;
final int maxCircleWidth = 120;
final int maxCircleHeight = 120;

//setup to make the Data reading function work
void setup()
{
  size(850,350);
  readData();

}

//drawfunction which sets a background, draws the circles, and displays the GDP for each sector when clicked
void draw()
{
  background(255);
  
  drawCircles();
   if (graphShowingIndex >= 0)
  {
  displayGDP(graphShowingIndex);
  }
}

//Datareading function
void readData()
{
  String[] lines = loadStrings(filename);

  int numCountries = lines.length - 6;

//array of object
  ArrayofGDPinfo = new GDPinfo[numCountries];


  int lineIndex = 0;
  while (lineIndex < lines.length)
  {
    if (lineIndex < 5 || lineIndex >= lines.length - 1)
    {
      lineIndex++;
      continue;
    }
    int countryNum = lineIndex - 5;

    String[] splitLine = lines[lineIndex].split(",");

    ArrayofGDPinfo[countryNum] = new GDPinfo();

    ArrayofGDPinfo[countryNum].countryNames = splitLine[0];
    
    ArrayofGDPinfo[countryNum].firstyear_2008 = Integer.parseInt(splitLine[1]);
    ArrayofGDPinfo[countryNum].secondyear_2009 = Integer.parseInt(splitLine[2]);
    ArrayofGDPinfo[countryNum].thirdyear_2010 = Integer.parseInt(splitLine[3]);
    ArrayofGDPinfo[countryNum].fourthyear_2011 = Integer.parseInt(splitLine[4]);
    ArrayofGDPinfo[countryNum].fifthyear_2012 = Integer.parseInt(splitLine[5]);
    
    

    lineIndex++;
  }
}

//Xcordinate function
float getXCoordinateForRowAndCol(int rowNum, int colNum)
{
   return(colNum+1)*getHorizontalSpacing()
          + colNum*maxCircleWidth
          + maxCircleWidth/2;
}

//Ycordinate funciton
float getHorizontalSpacing()
{
  return (width - numCols*maxCircleWidth)/(float)(numCols+1);
}

//Vertical Spacin function
float getVerticalSpacing()
{
  return (height - numRows*maxCircleHeight)/(float)(numRows+1);
}

//Function to draw the circles
void drawCircles()
{
 final int numCircles = numRows * numCols;
 
 final float spaceHor = getHorizontalSpacing();
 final float spaceVer = getVerticalSpacing();
 
 int rowNum = 0;
  while (rowNum < numRows)
  {
    int colNum = 0;
    while (colNum < numCols)
    {
      // Convert row, col to a 1D index
      int index = rowNum*numCols + colNum;
      
      // Get the relative circle size according to a percentage of
      // the maximum
      
      float circleWidth = ArrayofGDPinfo[index].firstyear_2008 /
                          maxCircleWidth/2.7;
                         
      float circleHeight = ArrayofGDPinfo[index].firstyear_2008 / 
                           maxCircleHeight/2.7;
      
      // Calculate the x/y coordinates of the circles
      
      final float x = getXCoordinateForRowAndCol(rowNum, colNum);
      final float y = height/2;
      
      
      // Draw a box around the data
      
      rectMode(CENTER); // needed when using a text box
      
      noFill();
      stroke(210);
      rect(x, y, maxCircleWidth + spaceHor/5, maxCircleHeight + spaceVer/5);
      
      
      // Draw the proportionally sized circle
      
      noStroke();
      
      float alphaTransparency = 
         (circleWidth / (float)maxCircleWidth * 150) + 100;
      
      fill(83,200,0,alphaTransparency);
      ellipse(x, y, circleWidth, circleHeight);
      
      
      // Draw the country label
      
      fill(0);
      textAlign(CENTER,BOTTOM);
      textSize(12);
      text(ArrayofGDPinfo[index].countryNames, 
           x, y + maxCircleHeight/2 - spaceVer/2, 
           maxCircleWidth - 20, spaceVer);
      
      
      colNum++;
    }
    rowNum++;
  }
  //draw text on the screen at the start
   fill(0);
   textAlign(CENTER);
   textSize(30);
   text("GDP Distribution for 2008", width/2, height*2.8/3);
}

//Function to get the index of each country
int getIndexOfCountryAt(int x, int y)
{
  int index = -1; // default: not found
  
  int rowNum = 0;
  while (rowNum < numRows)
  {
    int colNum = 0;
    while (colNum < numCols)
    {
      // Convert row, col to a 1D index
      int currIndex = rowNum*numCols + colNum;
      
      float currX = getXCoordinateForRowAndCol(rowNum, colNum);
      float currY = height/2;
      
      if (x >= currX - maxCircleWidth/2 && x <= currX + maxCircleWidth/2 &&
          y >= currY - maxCircleHeight/2 && y <= currY + maxCircleHeight/2)
      {
        index = currIndex;
        break;
      }
      
      colNum++;
    }
    rowNum++;
  }
  
  return index;
}

//function to display the GDP for each country after a click
void displayGDP(int index)
{  
  final int rectWidth = (int)(width * 0.8f);
  final int rectHeight = (int)(height * 0.6f);
  
  // Draw a rectangle to contain the graph
  stroke(2);
  fill(255);
  rect(width/2, height/2, rectWidth, rectHeight);
  fill(0);    
  text(ArrayofGDPinfo[index].firstyear_2008 + " is the exact GDP for 2008", width/2, height/2 - 70);
  text(ArrayofGDPinfo[index].secondyear_2009 + " is the exact GDP for 2009", width/2, height/2 - 33 );
  text(ArrayofGDPinfo[index].thirdyear_2010 + " is the exact GDP for 2010", width/2, height/2 + 5);
  text(ArrayofGDPinfo[index].fourthyear_2011 + " is the exact GDP for 2011", width/2 + 5, height/2 + 43);
  text(ArrayofGDPinfo[index].fifthyear_2012 + " is the exact GDP for 2012", width/2, height/2 + 80);
  
}

//Mouseclicked function
void mouseClicked()
{
    if (graphShowingIndex >= 0)
  {
    graphShowingIndex = -1;
  }
  // Otherwise, figure out what index we clicked
  else
  {
    graphShowingIndex = getIndexOfCountryAt(mouseX, mouseY);
  }
}