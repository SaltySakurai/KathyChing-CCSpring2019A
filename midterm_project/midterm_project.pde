/*
midterm_project
Kathy Ching 
Description: Drawing program fun fun. Basically you can draw cubes in different colors. Kinda still trying to learn what classes are and how to implement them outside of 
of particle systems. 
*/
int cubeSize = 1;
int cubeColor = 1;
int colorLeft = color (255, 204, 51);
int colorRight = color (255, 153, 0);
int colorTop = color (255, 255, 102);
int colorBar = color (77, 77, 77);
int colorWhite = color (255, 255, 255);
int colorOrange = color (250, 204, 41);
int colorBlue = color (51, 153, 255);
int colorRed = color (255,51,153);
int colorNone = color (255,255,255,0);
int left1 = -width/24;
int right1 = width/12;
int left2 = -width/24;
int right2 = width/12;
void setup(){
    size(600,600);
    background(77,77,77);
    noStroke();
    frameRate(30);
    color(RGB);
}
void draw(){
    if (mousePressed == true){
        //create cube object when you click
        Cube thing = new Cube(left1, left2, right1, right2, colorRight, colorLeft, colorTop);
        //draw the cube that you created
        thing.display();
    //renders the size of the cubes as the smallest size 
     if (cubeSize == 1){
            left1 = -width/24;
            left2 = -width/12;
            right1 = width/24;
            right2 = width/12;
        } //cubeSize = 1 
   // Renders the size of the cubes as the medium size 
        if (cubeSize == 2){
            left1 = -50;
            left2 = -100;
            right1 = 50;
            right2 = 100;
        } //cubeSize = 2
     
    //renders the size of the cubes as the largest size 
     if (cubeSize == 3){
        left1 = -75;
        left2 = -150;
        right1 = 75;
        right2 = 150;
     } //cubeSize = 3 
     
    // if the yellow cube is clicked, then it will render in any size 
     if(cubeColor == 1){
        colorLeft = color(255, 204, 51);
        colorRight = color(255, 153, 0);
        colorTop = color(255, 255, 102);
     } 
    // if the cyan cube is clicked, then it will render in any size 
     if(cubeColor == 2){
        colorLeft = color(51, 255, 255);
        colorRight = color(51, 51, 204);
        colorTop = color(153, 255, 255);
     }
    // if the magenta cube is clicked, then it will render in any size 
     if(cubeColor == 3){
        colorLeft = color(255, 51, 153);
        colorRight = color(255, 0, 0);
        colorTop = color(255, 153, 255);
     } 
     
 }
   if (mouseY>525){ //button bar
    colorLeft = colorNone;
    colorRight = colorNone;
    colorTop = colorNone; 
    // if user clicks on this position of the screen, it will render magenta cubes 
    if (mouseX<450 && mouseX>375 && mousePressed == true){ 
        cubeColor=3;
    }
    // if the user clicks on this position on the screen, it will blue cubes 
    if (mouseX<375 && mouseX>300 && mousePressed == true){ //cyan cubes 
        cubeColor=2;
    }
    // if the user clicks on this position on the screen, it will render the yellow cubes   
     if(mouseX<300 && mouseX>225 && mousePressed == true){ //yellow cubes 
        cubeColor=1;
     }
     // if the user clicks on this position, it will generate any colored cubes to be the largest size  
     if (mouseX<225 && mouseX>150 && mousePressed == true){
        cubeSize=3;
     }
    // if the user clicks on this position, it will generate any colored cubes to be medium size
    if (mouseX<150 && mouseX>75 && mousePressed == true){//medium
        cubeSize=2;
    }
   // if the user clicks on this postion, it will generate any colored cubes to be the smallest size 
     if(mouseX<75 && mouseX>0 && mousePressed == true){//small
        cubeSize=1;
     }
    }//button bar
  // These are all the buttons along the buttm of the screen  
  fill(colorWhite); // small
  rect(25, 550, 10, 10); //small
  fill(colorWhite);// medium
  rect(100, 550, 15, 15);// medium
  
  fill(colorWhite); // large
  rect(175, 550, 20, 20);//large
  
  fill(colorOrange); // orange
  rect(250, 550, 25, 25); //orange
  
  fill(colorBlue);// blue
  rect(325, 550, 25, 25);// blue
  
  fill(colorRed); // red
  rect(400, 550, 25, 25);//red
  
  textSize(25); //save
  fill(colorWhite);
  text("save", 525, 570); 
} //draw
