class Point {

  private int coordX;
  private int coordY;

  public Point(int x, int y) {
    coordX = x;
    coordY = y;
  }

  public int getCoordX() {
    return coordX;
  }

  public int getCoordY() {
    return coordY;
  }

  public void setCoordX(int x) {
    coordX = x;
  }

  public void setCoordY(int y) {
    coordY = y;
  }

  public void display() {
    fill(pointColor);
    stroke(pointColor);
    ellipse(coordX, coordY, radiusPoint, radiusPoint);
    noFill();
    noStroke();
  }
  
}