Die ichi;

int total = 0;
int totalDice;
int x, y;
int dieSize = 20;
int extra;

void setup()
{
  size(1024,768);
  noLoop();
}

void draw()
{
  background(100,245,150);
  
  total = 0;
  totalDice = 0;
  
  y = -1;
  
  //An extra row of dice on the bottom is added only if the dieSize is 10, which makes the last row fit perfectly into the working space. This does not work otherwise.
  if(dieSize == 10)
  {
    extra = 1;
  }
  else
  {
    extra = 0;
  }
  
  for(int i = 0; i < int(768/dieSize)+extra; i++)
  {
    x = -1;
    
    for(int c = 0; c < int(1024/dieSize); c++)
    {
      ichi = new Die(x,y,dieSize);
      
      ichi.roll();
      ichi.show();
      
      x = x + dieSize;
      
      totalDice = totalDice + 1;
    }
    
    y = y + dieSize;
  }
  
  text("Total: " + total,350,768);
  text("Total dice: " + totalDice,500,768);
}

void mousePressed()
{
  redraw();
}

void keyPressed()
{
  //increases size of die by 10 as long as the die isn't already at the maximum size of 760
  if(key == 'a')
  {
    if(dieSize != 760)
    {
      dieSize = dieSize + 10;
      redraw();
    }
  }
  
  //decreases size of die by 10 as long as die isn't already at the mininum size of 10
  if(key == 's')
  {
    if(dieSize != 10)
    {
      dieSize = dieSize - 10;
      redraw();
    }
  }
  
  //resets die's size to 20 as long as the die isn't already that size
  if(key == 'd')
  {
    if(dieSize != 20)
    {
      dieSize = 20;
      redraw();
    }
  }
  
  //only redraw the screen here if the size of the die changes, not if a key is pressed. to redraw the screen without changing the size, just click.
}

class Die //models one single die cube
{
  int xPos, yPos;
  int roll;
  int squareSize;
  int dot;
    
  Die(int x, int y, int square)
  {
    xPos = x;
    yPos = y;
    
    squareSize = square;
    
    dot = squareSize/10;
  }
  
  void roll()
  {
    roll = (int)(Math.random()*6)+1;
    total = total + roll;
  }
  
  void show()
  {
    strokeWeight(1);
    stroke(0,0,0);
    fill(240,180,230);
    
    rect(xPos,yPos,squareSize,squareSize);
    
    noStroke();
    fill(0,0,0);
    
    if(roll == 1 || roll == 3 || roll == 5)
    //show center dot
    {
      ellipse(xPos + squareSize/2, yPos + squareSize/2, dot, dot);
    }
    
    if(roll == 2 || roll == 3 || roll == 4 || roll == 5 || roll == 6)
    //show top right dot and lower left dot
    {
      ellipse(xPos + (squareSize * 0.75), yPos + (squareSize * 0.25), dot, dot);      
      ellipse(xPos + (squareSize * 0.25), yPos + (squareSize * 0.75), dot, dot);
    }
    
    if(roll == 4 || roll == 5 || roll == 6)
    //show top left dot and lower right dot
    {
      ellipse(xPos + (squareSize * 0.25), yPos + (squareSize * 0.25), dot, dot);      
      ellipse(xPos + (squareSize * 0.75), yPos + (squareSize * 0.75), dot, dot);
    }
    
    if(roll == 6)
    //show center side dots
    {
      ellipse(xPos + (squareSize * 0.25), yPos + (squareSize * 0.5), dot, dot);      
      ellipse(xPos + (squareSize * 0.75), yPos + (squareSize * 0.5), dot, dot);
    }
  }
}