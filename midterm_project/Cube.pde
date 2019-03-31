//each button has it's own size and color 

//each button has it's own size and color 
class Cube{
  //fields 
  // int buttonColor = color (255, 255, 255); //default color for every button is white
  int cubeSize = 1; //default size for every button is one 
  int colorLeft = color (255, 204, 51);
  int colorRight = color (255, 153, 0);
  int colorTop = color (255, 255, 102);
  int left1 = -width/24;
  int right1 = width/12;
  int left2 = -width/24;
  int right2 = width/12;
  
  //constructors 
  
  //blank constructor
  public Cube(){
  }
  
  //constructor where you pass in all the cube attributes
  public Cube(int left1, int left2, int right1,int right2, int colorRight, int colorLeft, int colorTop){
    this.colorLeft = colorLeft;
    this.colorRight = colorRight;
    this.colorTop = colorTop;
    this.left1 = left1;
    this.left2 = left2;
    this.right1 = right1;
    this.right2 = right2;
  }
  //methods
  //draws the cubes
  public void display(){
    fill(colorLeft); 
    quad(mouseX,mouseY+right2, mouseX+left2,mouseY+right1, mouseX+left2,mouseY+left1, mouseX,mouseY); 
    fill(colorRight);
    quad(mouseX+right2,mouseY+right1, mouseX,mouseY+right2, mouseX,mouseY, mouseX+right2,mouseY+left1); 
    fill(colorTop);
    quad(mouseX,mouseY, mouseX+left2,mouseY+left1, mouseX, mouseY+left2, mouseX+right2,mouseY+left1); 
  }
 }
