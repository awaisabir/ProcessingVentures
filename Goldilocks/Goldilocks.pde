//intigers set
final int GoldilocksFace = color(255,237,237);
final int BearBodyRadius = 100;
final int BearBodyHeight = 90;
final int BearBodyY = 450;
final int BearHeadX = 475;
final int BearHeadY = 370;
final int BearHeadRadius = 60;
final int BearHeadHeight = 70;

int GoldilocksX;
int GoldilocksY;


void setup()
{
  size(600,600);
  background(198,242,236);
}

//Goldilocks Function
void Goldilocks()
{
 GoldilocksX = width/2;
 GoldilocksY = 155;
 
   //GoldilocksHead
  ellipseMode(CENTER);
  fill(GoldilocksFace);
  ellipse(GoldilocksX,GoldilocksY, 50,50);
 
 //GoldilocksBody
 fill(211,126,126);
 triangle(GoldilocksX,
          GoldilocksY + 25,
          GoldilocksX - 30,
          220,
         GoldilocksX + 30,
          220 );

 
}

//Bear Function
void Bear()
{
  fill(157,103,2);
 //BearBody
 ellipseMode(CENTER);
 ellipse(BearHeadX - 350,BearBodyY,BearBodyRadius,BearBodyHeight);
 ellipse(BearHeadX - 175,BearBodyY,BearBodyRadius,BearBodyHeight);
 ellipse(BearHeadX,BearBodyY,BearBodyRadius,BearBodyHeight);
 //BearHead
 ellipse(BearHeadX - 350,BearHeadY, BearHeadRadius,BearHeadHeight);
 ellipse(BearHeadX - 175,BearHeadY,BearHeadRadius,BearHeadHeight);
 ellipse(BearHeadX,BearHeadY,BearHeadRadius,BearHeadHeight);


}
  
  
 //Draw Function 
void draw()
{
Goldilocks();
 Bear();
}
