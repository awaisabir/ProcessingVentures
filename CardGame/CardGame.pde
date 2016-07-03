//IT TAKES TIME FOR THE LAST CLICK TO REGISTER AND "YOU WON" TO APPEAR.. PLEASE BE PATIENT//


//Declare Global integers and Arrays

int TileShowing = 0;
Tile[][] ArrayofTiles = new Tile[4][3];
int[][] PairNums = { {0,1,2,3,4,5},{0,0,0,0,0,0} };

int[] CurrentPair = {-1,-1,-1,0};

void setup()
{
  background(250,242,2);
  size(800, 800);
  rectMode(CENTER);
 //Calling the appropraite functions to display the Tiles at a particular X and Y cordinate, and to display them face down 
  GiveTileCordinates(ArrayofTiles, ArrayofTiles.length, ArrayofTiles[0].length - 1);
  TileFaceDown(ArrayofTiles, ArrayofTiles.length, ArrayofTiles[0].length - 1);
}


//Object Class
class Tile
{
  //Local Variables & Boolean values
  int TileX, TileY;
  int TileWidth = 85;
  int TileHeight = 135;
  boolean Visible = false;
  int PairNum;
  boolean IsMatchFound = false;
//Constructor
  Tile(int TileX, int TileY)
  {
    this.TileX = TileX;
    this.TileY = TileY;
  }
}

//Function to give the Tile its cordinates
void GiveTileCordinates(Tile[][] TileArray, int Row, int Column)
{
  //Spacng between each Tile
  int SpacingX = width/4;
  int SpacingY = height/3;
//IF Function to give the tiles its cordinates
  if (Row>0)
  {
    Row--;
    TileArray[Row][Column] = new Tile(Row * SpacingX + SpacingX/2, Column * SpacingY + SpacingY/2);
    GiveObjectPairNum(PairNums, TileArray[Row][Column]);
    
    GiveTileCordinates(TileArray, Row, Column);
  } else if (Column>0)
  {
    Column--;
    Row = TileArray.length;
    GiveTileCordinates(TileArray, Row, Column);
  }
}

//Function to display the Tile face down
void TileFaceDown(Tile[][] TileArray, int Row, int Column)
{
  if (Row>0)
  {
    Row--;
    if(TileArray[Row][Column].IsMatchFound == false)
    {
      TileArray[Row][Column].Visible = false;
    }
    else if(CurrentPair[3] == 6)
    {
      TileArray[Row][Column].Visible = false;
      TileArray[Row][Column].IsMatchFound = false;
      
    }
    DrawTile(TileArray[Row][Column]);
    TileFaceDown(TileArray, Row, Column);
  } else if (Column>0)
  {
    Column--;
    Row = TileArray.length;
    TileFaceDown(TileArray, Row, Column);
  }
}

//Function to draw the Tile with a color corresponding to the PairNumber
void DrawTile(Tile TileObject)
{

  if (TileObject.Visible == false)
  {
    fill(255);
  } else if(TileObject.PairNum == 0)
  {
    fill(0);
  } else if(TileObject.PairNum == 1)
  {
    fill(242,0,255);
  } else if(TileObject.PairNum == 2)
  {
    fill(0,255,0);
  } else if(TileObject.PairNum == 3)
  {
    fill(255,0,0);
  } else if(TileObject.PairNum == 4)
  {
    fill(0,0,255);
  } else if(TileObject.PairNum == 5)
  {
    fill(100,100,100);
  } else if(TileObject.PairNum == 6)
  {
    fill(200,50,0);
  }
//Draw a rectangle representing an instance of the class at the appropriate X and Y cordinates.
  rect(TileObject.TileX, TileObject.TileY, TileObject.TileWidth, TileObject.TileHeight);
}

//Function to check if tile is being pressed by the Mouse
void checkifTilepressed(Tile[][] TileArray, int Row, int Column)
{
 //IF statement to check if the tile is pressed
  if (    mouseX >  TileArray[Row][Column].TileX -  TileArray[Row][Column].TileWidth/2
    && mouseX <  TileArray[Row][Column].TileX +  TileArray[Row][Column].TileWidth/2
    && mouseY <  TileArray[Row][Column].TileY +  TileArray[Row][Column].TileHeight/2
    && mouseY >  TileArray[Row][Column].TileY -  TileArray[Row][Column].TileHeight/2)
  {
    /*IF statements that check how many times a tile is being pressed, and if it is, then also check 
    how many times the tiles are being pressed. Also to check whether or not after three clicks the tile
    should be face down, or whether a match has been found*/
    
    //IF there is 1 click on the tile, then make that tile visible and change the pair num
    if (TileArray[Row][Column].Visible == false && TileShowing == 0)
    {
      TileShowing++;
      TileArray[Row][Column].Visible = true;
      CurrentPair[0] = TileArray[Row][Column].PairNum;
      CurrentPair[1] = Row;
      CurrentPair[2] = Column;
      
    } else if(TileArray[Row][Column].Visible == false && TileShowing == 1)
    {
      TileShowing++;
      TileArray[Row][Column].Visible = true;
      
      //IF the second tile clicked is then make it face up as well
      if( TileArray[Row][Column].PairNum == CurrentPair[0])
      {
        CurrentPair[3]++;
        TileArray[Row][Column].IsMatchFound = true;
        TileArray[CurrentPair[1]][CurrentPair[2]].IsMatchFound = true;
        //IF there are 6 pairs then a message saying "YOU WON" will be displayed
        if(CurrentPair[3] == 6)
        {
          fill(0);
          textSize(20);
          textAlign(CENTER);
          text("YOU WON!", width/2, height/3);
        }
      }
      
      //IF the 2 previous tile clicked are a pair then leave them face up, and if not then make them face down after the third click
    } else if (TileArray[Row][Column].Visible == false && TileShowing == 2)
    {
      TileShowing = 1;
      TileFaceDown(TileArray, TileArray.length, TileArray[0].length - 1);
      TileArray[Row][Column].Visible = true;
      CurrentPair[0] = TileArray[Row][Column].PairNum;
      CurrentPair[1] = Row;
      CurrentPair[2] = Column;
      
    }
    //call the drawtile function
    DrawTile(TileArray[Row][Column]);
  } else if (Row>0)
  {
    Row--;
    checkifTilepressed(TileArray, Row, Column);
  } else if (Column>0)
  {
    Column--;
    Row = TileArray.length - 1;
    checkifTilepressed(TileArray, Row, Column);
  }
}

//A pair number to each tile is given on random to help with the idenification of pairs
void GiveObjectPairNum(int[][] Pairs, Tile TileSent)
{
  int i = int(random(6));
  if ( Pairs[1][i] != 2)
  {
    Pairs[1][i]++;
    TileSent.PairNum = Pairs[0][i];
  } else{
    GiveObjectPairNum(Pairs, TileSent);
  }
}

//Resetting of the game and randomizing the colors of the tiles.
void GameReset(Tile[][] ArrayofTiles, int Row, int Column)
{
  if(Row>0)
  {
    Row--;
    GiveObjectPairNum(PairNums, ArrayofTiles[Row][Column]);
    GameReset(ArrayofTiles, Row, Column);
  } else if (Column>0)
  {
    Column--;
    Row = ArrayofTiles.length;
    GameReset(ArrayofTiles, Row, Column);
  }
}

void draw()
{
}

/*Mouseclicked Function which :
  Checks if the tile is being pressed
  Assigns a different pair number as the game restarts
  and starts a new game with the GameReset function with all the tiles face down*/
void mouseClicked()
{
  if(CurrentPair[3] < 6)
  {
  checkifTilepressed(ArrayofTiles, ArrayofTiles.length - 1, ArrayofTiles[0].length - 1);
  } else {
    background(250,242,2);
    for(int i=0; i<6; i++)
    {
      PairNums[1][i] = 0;
    }
      GameReset(ArrayofTiles, ArrayofTiles.length, ArrayofTiles[0].length - 1);
    
    TileFaceDown(ArrayofTiles, ArrayofTiles.length, ArrayofTiles[0].length - 1);
    CurrentPair[3] = 0;
  }
}  

