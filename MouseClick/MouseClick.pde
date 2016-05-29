final color redColor = color(240,0,0);
final color blueColor = color(0,0,240);
final color greenColor = color(0,240,0);

color currentColor;

final int rectHeight = 50;
final int rectWidth = 80;
int rectX;
int rectY;



void setup()
{
  size(500,500);
  background(255);
  currentColor = redColor;
  noStroke();
 color currentColor;
  rectX = width / 2;
  rectY = height / 2;
  rectMode(CENTER);
}

void draw()
{
  
}

void keyPressed()
{
  switch(key)
  {
    case 'r':
    currentColor = redColor;
    break;
    case 'b':
    currentColor = blueColor;
    break;
    case 'g':
    currentColor = greenColor;
    break;
    default:
    break;
  }
}

void mouseClicked()
{
  float x = random(500);
  float y = random(500);
  fill(currentColor);
  rect(x,y, rectWidth, rectHeight);
}



