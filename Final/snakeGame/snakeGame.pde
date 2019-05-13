/*
Author: Kathy Ching 
Summary: I made a continual snake game with no boundaries 

*/
snake test;
food food1;
int highScore;

void setup(){
  size(1000, 600);
  frameRate(14);
  test = new snake();
  food1 = new food();
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  
  highScore = 0;
}



void draw(){
  background(250, 250, 250);
  drawScoreboard();
  
  test.move();
  test.display();
  food1.display();
  
  
  if( dist(food1.xpos, food1.ypos, test.xpos.get(0), test.ypos.get(0)) < test.sidelen ){
    food1.reset();
    test.addLink();
  }
  
  if(test.len > highScore){
    highScore= test.len;
  }
}


void keyPressed(){
  if(key == CODED){
    if(keyCode == LEFT){
      test.dir = "left";
    }
    if(keyCode == RIGHT){
      test.dir = "right";
    }
    if(keyCode == UP){
      test.dir = "up";
    }
    if(keyCode == DOWN){
      test.dir = "down";
    }
  }
}


void drawScoreboard(){  
  
  // draw scoreboard
  fill (107,255,176);
  textSize(17);
  text( "Score: " + test.len, 70, 50);
  
  fill(85, 222, 225);
  textSize(17);
  text( "High Score: " + highScore, 70, 70);
}
