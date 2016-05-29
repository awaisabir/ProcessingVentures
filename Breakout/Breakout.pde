/////////////////////////////////////WELCOME TO BREAKOUT///////////////////////////
////////////////////////START THE GAME BY PRESSING THE 'a' KEY/////////////////////
/////////////MOVE THE PADDLE USING THE MOUSE BY MOVING IT LEFT OR RIGHT///////////
///////////YOUR SCORE IS ON THE TOP LEFT, AND LIVES ARE ON THE TOP RIGHT//////////
/////////yellow bricks = 1 point, green bricks = 3 points, orange bricks = 5 points, red bricks = 7 points/////////////////
//////BE CARFUL...... THE BALL DOES GET FASTER AND FASTER AS THE GAME GOES ON////////////////////
////////////////////////////HOPE YOU ENJOY///////////////////////////////////////



//Global Variables
int BallX;
int BallY;
int BallWidth;
int BallHeight;
int BallXSpeed = -1;
int BallYSpeed = -1;

int PaddleX;
int PaddleY;
int PaddleHeight;
int PaddleWidth;
int PaddleSpeed = 5;

int Score = 0;
int Lives = 3;
int GameState = 1;

int IndexX = 0;
int IndexY = 0;

//Array for the colors of the bricks
color[] colors = 
{
  color(200, 0, 0), 
  color(140, 0, 0), 
  color(255, 150, 0), 
  color(200, 120, 0), 
  color(0, 200, 0), 
  color(0, 140, 0), 
  color(255, 255, 0), 
  color(140, 140)
};

//arrays for the X and Y co-ordinates of the brick
int[] BrickX = new int[8];
int[] BrickY = new int[8];

int BrickWidth;
int BrickHeight;

//2D array for the detection of the bricks
boolean[][] BrickDetection = new boolean[8][8];
int BricksHit = 0;
boolean LastLevel = false;
boolean HitTop = false;

//Function to move the ball
void MoveBall() 
{
  //Reset index variables
  IndexX = 0;
  IndexY = 0;

  //Move ball if game is on
  if (GameState == 2) {
    //Move ball
    BallX += BallXSpeed;
    BallY += BallYSpeed;

    //Check if a brick has been hit
    while (IndexX < 8) {
      while (IndexY < 8) {
        //Check if current brick is still visible
        if (BrickDetection[IndexX][IndexY] == true) {
          BrickHitDetection(IndexX, IndexY);
        }
        //Add to column index
        IndexY++;
      }

      //Reset column index and add 1 to row index
      IndexY = 0;
      IndexX++;
    }
  }

  //Check if ball has hit a boundary
  if ((BallX - BallWidth/2 < 1) || (BallX + BallWidth/2 >= width) || ((BallX + BallWidth/2 > PaddleX - PaddleWidth/2) && (BallX + BallWidth/2 < PaddleX - PaddleWidth*6/14) && (BallY + BallHeight/2 > PaddleY - PaddleHeight/5))
  || ((BallX - BallWidth/2 < PaddleX + PaddleWidth/2) && (BallX - BallWidth/2 > PaddleX + PaddleWidth*6/14) && (BallY + BallHeight/2 > PaddleY - PaddleHeight/5)))
  {
    BallXSpeed*= -1;
  } else if ( ((BallY + BallHeight/2 > PaddleY - PaddleHeight/2) && (BallY + BallHeight/2 < PaddleY - PaddleHeight*1/5) && (BallX + BallWidth > PaddleX - PaddleWidth/2) && (BallX - BallWidth < PaddleX + PaddleWidth/2) && (BallYSpeed/abs(BallYSpeed) != -1)))
  {
    BallYSpeed*= -1;
  } else if (BallY - BallHeight/2 <= height/20) {
    if (HitTop == false) {
      PaddleWidth/= 2;
      HitTop = true;
    }
    BallXSpeed = (BallXSpeed/abs(BallXSpeed)) * 5;
    BallYSpeed = (BallYSpeed/BallYSpeed) * 5;
  }

  //Checks if ball has gone off screen
  if (BallY > height + BallHeight) {
    Lives--;
    if (Lives == 0) {
      GameState = 3;
      HitTop = false;
      BallXSpeed = BallXSpeed/abs(BallXSpeed);
      BallYSpeed = -1;
      return;
    } else {
      GameState = 1;
      BallY = PaddleY - PaddleHeight/2 - BallHeight/2;
      BallX = PaddleX;
      BallXSpeed = BallXSpeed/abs(BallXSpeed);
      BallYSpeed = -1;
    }
  }

  //Draw ball
  ellipse(BallX, BallY, BallWidth, BallHeight);
}

void DrawPaddle() 
{
  //Set fill
  fill(255);

  //Draw paddle
  rect(PaddleX, PaddleY, PaddleWidth, PaddleHeight);
}

void Stats()
{
  background(0);

  //Draw score
  textAlign(CENTER, CENTER);
  textSize(20);
  fill(255);
  text(Score, 50, height/40);

  //Draw lives
  text(Lives, width - 50, height/40);
}

void DrawBricks()
{
  //Reset index variables
  IndexX = 0;
  IndexY = 0;

  //Cycle through rows
  while (IndexY < 8)
  {
    //Set Brick fill
    if (IndexY < 2)
    {
      fill(colors[0]);
      stroke(colors[1]);
    } else if (IndexY < 4)
    {
      fill(colors[2]);
      stroke(colors[3]);
    } else if (IndexY < 6)
    {
      fill(colors[4]);
      stroke(colors[5]);
    } else {
      fill(colors[6]);
      stroke(colors[7]);
    }

    //Cycle through columns
    while (IndexX < 8) {
      //Determine wether brick should be drawn
      if (BrickDetection[IndexX][IndexY] == true)
      {
        noStroke();
        rect(BrickX[IndexX], BrickY[IndexY], BrickWidth, BrickHeight);
      }

      //Add 1 to column index
      IndexX++;
    }

    //Add 1 to row index and reset column index
    IndexY++;
    IndexX = 0;
  }
}

void BrickHitDetection(int Column, int Row)
{
  int SpacingX = BrickWidth*2/5;//40
  int SpacingY = BrickHeight/4;//5

  if ((((BallX + BallWidth/2 > BrickX[Column] - BrickWidth/2) && (BallX + BallWidth/2 < BrickX[Column] - SpacingX)) 
    || ((BallX - BallWidth/2 < BrickX[Column] + BrickWidth/2) && (BallX - BallWidth/2 > BrickX[Column] + SpacingX))) 
    && (BallY + BallHeight/2 > BrickY[Row] - BrickHeight/2) && (BallY - BallHeight/2 < BrickY[Row] + BrickHeight/2))
  {
    BallXSpeed*= -1;
    BrickDetection[Column][Row] = false;
    AddToScore(Row);
    BricksHit++;
    if (BricksHit == 64) {
      GameState = 1;
      BallY = PaddleY - PaddleHeight/2 - BallHeight/2;
      BallX = PaddleX;
      BricksHit = 0;
      BallXSpeed = BallXSpeed/abs(BallXSpeed);
      BallYSpeed = -1;
      PaddleWidth = width/8;
      if (LastLevel == false) {
        LastLevel = true;
        HitTop = false;
        RedrawBricks();
      } else {
        GameState = 4;
        HitTop = false;
      }
    } else if (BricksHit == 4)
    {
      BallXSpeed= (BallXSpeed/abs(BallXSpeed)) * 2;
      BallYSpeed= (BallYSpeed/abs(BallYSpeed)) * 2;
    } else if (BricksHit == 12)
    {
      BallXSpeed= (BallXSpeed/abs(BallXSpeed)) * 3;
      BallYSpeed= (BallXSpeed/abs(BallXSpeed)) * 3;
    } else if (Row < 2)
    {
      BallXSpeed= (BallXSpeed/abs(BallXSpeed)) * 4;
      BallYSpeed= (BallXSpeed/abs(BallXSpeed)) * 4;
    }
  } else if ((((BallY - BallHeight/2 < BrickY[Row] + BrickHeight/2) && (BallY - BallHeight/2 >= BrickY[Row] + SpacingY))
    || ((BallY + BallHeight/2 > BrickY[Row] - BrickHeight/2) && (BallY + BallHeight/2 <= BrickY[Row] - SpacingY)))
    && (BallX + BallWidth/2 > BrickX[Column] - BrickWidth/2) && (BallX - BallWidth/2 < BrickX[Column] + BrickWidth/2))
  {
    BallYSpeed*= -1;
    BrickDetection[Column][Row] = false;
    AddToScore(Row);
    BricksHit++;
    if (BricksHit == 64)
    {
      GameState = 1;
      BallY = PaddleY - PaddleHeight/2 - BallHeight/2;
      BallX = PaddleX;
      BricksHit = 0;
      BallXSpeed = BallXSpeed/abs(BallXSpeed);
      BallYSpeed = -1;
      PaddleWidth = width/8;
      if (LastLevel == false)
      {
        LastLevel = true;
        HitTop = false;
        RedrawBricks();
      } else {
        GameState = 4;
        HitTop = false;
      }
    } else if (BricksHit == 4) {
      BallXSpeed*= 2;
      BallYSpeed*= 2;
    } else if (BricksHit == 12) {
      BallXSpeed*= 2;
      BallYSpeed*= 2;
    } else if (Row < 2) {
      BallXSpeed*= 3/2;
      BallYSpeed*= 3/2;
    }
  }
}

void AddToScore(int Section)
{
  if (Section < 2)
  {
    Score += 7;
  } else if (Section < 4)
  {
    Score += 5;
  } else if (Section < 6)
  {
    Score += 3;
  } else {
    Score += 1;
  }
}

void RedrawBricks() {
  //Reset index variables
  IndexX = 0;
  IndexY = 0;

  //Fill arrays
  while (IndexX < BrickX.length)
  {
    BrickX[IndexX] = IndexX * BrickWidth + BrickWidth/2;
    BrickY[IndexX] = IndexX * BrickHeight + BrickHeight/2 + height/15;

    while (IndexY < BrickX.length)
    {
      BrickDetection[IndexY][IndexX] = true;
      IndexY++;
    }
    //Add to column index and reset row index
    IndexX++;
    IndexY = 0;
  }

  //Reset index variables
  IndexX = 0;
  IndexY = 0;
}

void setup() 
{
  size(800, 600);
  background(0);
  rectMode(CENTER);
  noStroke();

  //Give variables initial values
  BallWidth = width/80;
  BallHeight = height/50;
  BallX = width/2;
  BallY = height*7/8 - BallHeight/2;

  PaddleHeight = height/100;
  PaddleWidth = width/5;
  PaddleX = width/2;
  PaddleY = height*7/8 + PaddleHeight/10;

  BrickWidth = width/8;
  BrickHeight = height/50;

  //Fill Arrays
  RedrawBricks();
}

void draw() 
{
  //Draw game information banner
  Stats();

  //Play game or show game over screen
  if ((GameState == 1) || (GameState == 2)) {

    //Move ball
    MoveBall();

    //Draw bricks
    DrawBricks();

    //Draw paddle
    DrawPaddle();
  } else if (GameState == 3) {
    text("GAME OVER :(", width/2, height/2);
  } else {
    text("YOU WON!", width/2, height/2);
  }
}

void mouseMoved() {
  //Move paddle and move ball if necessary
  if ((mouseX > PaddleWidth/2) && (mouseX < width - PaddleWidth/2)) {
    PaddleX = mouseX;
    if (GameState == 1) {
      BallX = mouseX;
    }
  } else if (mouseX < PaddleWidth/2) {
    PaddleX = PaddleWidth/2;
  } else if (mouseX > width - PaddleWidth/2) {
    PaddleX = width - PaddleWidth/2;
  }
}

void keyPressed() {
  //See if action key was pressed
  switch(key) {
  case 'a':
    //Start game
    if ((GameState == 3) || (GameState == 4)) {
      Lives = 3;
      Score = 0;
      BallX = width/2;
      BallY = height*7/8 - BallHeight/2;
      PaddleX = width/2;
      PaddleY = height*7/8 + PaddleHeight/2;
      GameState = 1;
      BallXSpeed = BallXSpeed/abs(BallXSpeed);
      BallYSpeed = -1;
      PaddleWidth = width/8;
      RedrawBricks();
    } else if (GameState == 1) {
      GameState = 2;
    }
  }
}

