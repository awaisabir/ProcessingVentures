//Tree class
class Tree
{
  //Integers for the Tree
  int TreeX;
  int TreeY;
  int TreeHeight;
  int TreeWidth;
  int LeafWidth;
  int LeafHeight;
  //Array of LeafColors
  color[] LeafColors = {
    color(61,85,45),
    color(255,0,0),
    color(255,255,0)
  };
  color LeafColor;  //Variable for the LeafColor
  
  //Constructor
  Tree(int x ,int y)
  {
    TreeX = x;
    TreeY = y;
    //randomization of the specs of the trees
    TreeHeight = (int)random(100,150);
    TreeWidth = (int)random(15, 60);
    LeafWidth= (int)random(60,120);
    LeafHeight = (int)random(15,30);
    LeafColor = LeafColors[(int)random(0,3)]; //Sets the variable equal to a random index of the array
  }
} 


void setup()
{
  size(800,800);
  background(255);
  rectMode(CENTER);
  
  //Array of Trees
  Tree[] Trees = new Tree[10];
  int Spacing = (width/ Trees.length); //Spacing of the Trees
  
  int Index = 0; 
  while( Index < Trees.length )
  {
    int XPlacementTree = Spacing/2 + Index * Spacing;  //X-position of the Tree
    Trees[Index] = new Tree(XPlacementTree, height/2);  //Places a tree at the following X and Y position
    drawTree(Trees[Index]);
    Index++;
  }
}

//Function to draw the Tree
void drawTree(Tree DrawTrees)
{
  fill(103,79,47);
  rect(DrawTrees.TreeX, DrawTrees.TreeY, DrawTrees.TreeWidth, DrawTrees.TreeHeight); //draws the trunk of the tree
  
  fill(DrawTrees.LeafColor);
  ellipse(DrawTrees.TreeX , DrawTrees.TreeY - DrawTrees.TreeHeight/2, DrawTrees.LeafWidth, DrawTrees.LeafHeight);  //draws the leaves
}
