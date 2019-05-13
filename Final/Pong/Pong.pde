/*
Author: Kathy Ching 
Summary: I made Pong as part of my game library. 
*/
Paddle leftPaddle;
Paddle rightPaddle;
Ball ball;

int[] gameKeyCodes = { 87, 83, 38, 40 }; // W, S, UP, DOWN (Keyboard Values)
boolean[] keyStates = { false,  false, false, false }; // All keyboards are set at false until they are pressed. 

// Scores always start at 0 and appear on the screen
int leftScore = 0, rightScore = 0, currentTouches = 0;
boolean leftScoredLast = false, rightScoredLast = false;

void setup()
{
  size(800 , 600);
  //generates the ball in the center 
  ellipseMode(CENTER);
  smooth();
  
  leftPaddle = new Paddle(10, height / 2 - Paddle.HEIGHT / 2);
  rightPaddle = new Paddle(width - 10 - Paddle.WIDTH, height / 2 - Paddle.HEIGHT / 2);
  ball = new Ball(width / 2 - Ball.RADIUS, height / 2 - Ball.RADIUS, 10, random(-PI / 4, PI / 4));
}

void keyPressed()
{
  copeKeys(true); //if any keys are pressed, paddles will move up and down 
}

void keyReleased()
{
  copeKeys(false); // if players let go of the keys, they are static. 
}

void draw()
{
  background(0);
  
  drawStuff();

  checkBoundaries();
  ball.move();
  ballPaddle();
  
  // If Keys (W,S,UP,DOWN) are pressed they move up and down. 
  if (keyStates[0]) leftPaddle.moveY(-Paddle.SPEED); 
  if (keyStates[1]) leftPaddle.moveY(Paddle.SPEED);  
  
  if (keyStates[2]) rightPaddle.moveY(-Paddle.SPEED);
  if (keyStates[3]) rightPaddle.moveY(Paddle.SPEED);
  
  ball.draw();
  leftPaddle.draw();
  rightPaddle.draw();  
}

void checkBoundaries()
{
  //UP DOWN
  if (ball.y - RADIUS <= 0) ball.angle = TWO_PI - ball.angle;
  else if (ball.y + RADIUS >= height) ball.angle = TWO_PI - ball.angle;  
  
  //LEFT RIGHT
  if (ball.x + Ball.RADIUS <= 0)
  {
    ball.resetBall();
    
    // If the ball leaves the screen, it adds a point to the score. 
    // All score are set to 0 at the beginning of each game. 
    // Left side only. 
    if (currentTouches != 0)
    {
      rightScore++;
      leftScoredLast = false;
      rightScoredLast = true;
      currentTouches = 0;
    }
  }
  else if (ball.x - Ball.RADIUS >= width)
  {
    ball.resetBall();
    
    // If the ball leaves the screen, it adds a point to the score. 
    // All score are set to 0 at the beginning of each game. 
    // Left side only. 
    if (currentTouches != 0)
    {
      leftScore++;
      rightScoredLast = false;
      leftScoredLast = true;
      currentTouches = 0;
    }
  }
}

void drawLines()
{
  //generates the middle dotted line 
  strokeWeight(3);
  
  for (int y = 5; y < height; y += 30)
  {
    stroke(255);
    line(width / 2, y, width / 2, y + 15);
  }
}


void drawScore()
{
  
  //draws the score on the screen
  textSize(64);
  stroke(255);
  textAlign(CENTER, CENTER);
  
  if (leftScoredLast) fill(0, 255, 0);
  else if (!leftScoredLast) fill(255);
  text(leftScore, width / 2 - 50, 125);
  
  if (rightScoredLast) fill(0, 255, 0);
  else if (!rightScoredLast) fill(255);
  text(rightScore, width / 2 + 50, 125);
}

void drawStuff()
{
  drawLines();
  drawScore();
}

void copeKeys(boolean state)
{
  for (int i = 0; i < keyStates.length; i++)
  {
    if (keyCode == gameKeyCodes[i]) keyStates[i] = state;
  }
}

void ballPaddle()
{
  ballLeftPaddle();
  ballRightPaddle();
}

void ballLeftPaddle()
{
  // This is a set up for the left paddle so that if the ball collides into the paddle, it doesn't just go through. 
  // It basically checks if the ball collides into the paddle and if it does, the ball returns to the right side. 
  float prevBallX = ball.x - (ball.speed * cos(ball.angle));
  float prevBallY = ball.y - (ball.speed * sin(ball.angle));
  
  float distX = abs(ball.x - (leftPaddle.x + Paddle.WIDTH / 2));
  float distY = abs(ball.y - (leftPaddle.y + Paddle.HEIGHT / 2));
  
  if (distX <= Paddle.WIDTH / 2 + Ball.RADIUS && distY <= Paddle.HEIGHT / 2 + Ball.RADIUS)
  {
    currentTouches++;
    
    if ((topHalf(leftPaddle) && prevBallY < ball.y) || !topHalf(leftPaddle) && prevBallY > ball.y)
    {
      ball.angle = getNewAngle(leftPaddle, true);
    }
    else
    {
      ball.angle = getNewAngle(leftPaddle, false);
    }
    
    ball.speed *= map(distY, 0, Paddle.HEIGHT / 2, 0.95, 1.1);
  }
}

void ballRightPaddle()
{
    // This is a set up for the left paddle so that if the ball collides into the paddle, it doesn't just go through. 
  // It basically checks if the ball collides into the paddle and if it does, the ball returns to the left side.
  float prevBallX = ball.x - (ball.speed * cos(ball.angle));
  float prevBallY = ball.y - (ball.speed * sin(ball.angle));
  
  float distX = abs(ball.x - (rightPaddle.x + Paddle.WIDTH / 2));
  float distY = abs(ball.y - (rightPaddle.y + Paddle.HEIGHT / 2));
  
  if (distX <= Paddle.WIDTH / 2 + Ball.RADIUS && distY <= Paddle.HEIGHT / 2 + Ball.RADIUS)
  {
    currentTouches++;
    
    if ((topHalf(rightPaddle) && prevBallY < ball.y) || !topHalf(rightPaddle) && prevBallY > ball.y)
    {
      ball.angle = getNewAngle(rightPaddle, true);
    }
    else
    {
      ball.angle = getNewAngle(rightPaddle, false);
    }
    
    ball.speed *= map(distY, 0, Paddle.HEIGHT / 2, 0.95, 1.1);
  }
}

float getNewAngle(Paddle p, boolean invertY)
{
  PVector ballV = new PVector(ball.x, ball.y);
  PVector paddleV = new PVector(p.x + Paddle.WIDTH / 2, p.y + Paddle.HEIGHT / 2);
  
  PVector dir = PVector.sub(ballV, paddleV);
  
  if (invertY)
  {
    dir.y *= -1;
  }
    
  return atan2(dir.y, dir.x);
}

boolean topHalf(Paddle p)
{
  return (ball.y < p.y + Paddle.HEIGHT / 2);
}
