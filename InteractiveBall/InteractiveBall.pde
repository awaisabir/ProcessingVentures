final int ballWidth = 20;
final int ballHeight = 20;
int ballX;
int ballY;
int ballSpeed;


float vy = 0;
float gravity = 0.1;
float bounce = -0.85;



void setup()
{
  size(500, 500);
  background(255);

  ellipseMode(CORNER);
  ballX = width/2;
  ballSpeed = 1;
}

void draw()
{
  background(255);
frameRate(20);
  ballY += ballSpeed;
  ellipseMode(CENTER);
  float r = random(0, 255);
fill(r, 0,0);
  ellipse(ballX, ballY, ballWidth, ballHeight);


  vy += gravity;
  ballY += vy;
  if (ballY > height - 15)
  {
    vy *= bounce;
  }
}

