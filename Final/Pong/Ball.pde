class Ball
{
  static final float RADIUS = 12;
  
  private float x;
  private float y;
  private float speed;
  private float angle;
  private float startX;
  private float startY;
  
  public Ball(float px, float py, float ps, float pa )
  {
    startX = px;
    startY = py;
    angle = pa;
    speed = ps;
    x = px;
    y = py;
  }
  
  void resetBall()
  {
    if (x - RADIUS < 1)
    {
      angle = random(3 * PI / 4, 5 * PI / 4);
    }
    else
    {
      angle = random(-PI / 4, PI / 4);
    }
        
    speed = 10;
        
    x = startX;
    y = random(height / 2 - RADIUS * 2, height / 2 + RADIUS * 2);
  }
  
  void move()
  {
    x += speed * cos(angle);
    y += speed * sin(angle);
  }
  
  void draw()
  {
    noStroke();
    fill(155);
    ellipse(x, y, RADIUS * 2, RADIUS * 2);
  }
}
