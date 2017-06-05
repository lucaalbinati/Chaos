class Button {
  
  private int xPos;
  private int yPos;
  private int buttonWidth;
  private int buttonHeight;
  
  public Button(int xPos, int yPos, int buttonWidth, int buttonHeight) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.buttonWidth = buttonWidth;
    this.buttonHeight = buttonHeight;
  }
  
  public void display() {
    fill(buttonColor);
    stroke(buttonColor);
    rect(xPos, yPos, buttonWidth, buttonHeight);
    noFill();
    noStroke();
  }
  
  public boolean containsCoord(int coordX, int coordY) {
    return (xPos <= coordX && coordX <= (xPos + buttonWidth))
        && (yPos <= coordY && coordY <= (yPos + buttonHeight));
  }
  
}