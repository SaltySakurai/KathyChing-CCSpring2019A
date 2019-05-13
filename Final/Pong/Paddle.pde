class Paddle
{
  static final int SPEED = 10;
  static final int WIDTH = 25;
  static final int HEIGHT = 75;
  
  private float x;
  private float y;
  
  public Paddle(float px, float py)
  {
    x = px;
    y = py;
  }
  
  void moveY(int amt)
  {
    y += amt;
    
    if (y <= 0) y = 0;
    else if (y + HEIGHT >= height) y = height - HEIGHT;
  }
  
  void draw()
  {
    noStroke();
    fill(255);
    rect(x, y, WIDTH, HEIGHT);
  }
}
