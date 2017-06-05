// =================================================================

int backgroundColor = #fdfdfd;
int pointColor = #606060;
int radiusPoint = 1;

int windowWidth = 1000;
int windowHeight = 800;
int framesPerSec = 10;

int pointCoordX1 = windowWidth / 2;
int pointCoordY1 = windowHeight / 8;
int pointCoordX2 = windowWidth / 8;
int pointCoordY2 = windowHeight - windowHeight / 8;
int pointCoordX3 = windowWidth - windowWidth / 8;
int pointCoordY3 = windowHeight - windowHeight / 8;

Point point1;
Point point2;
Point point3;
Point current_point;

int textPosX = 15;
int textPosY = 25;

int buttonFastWidth = 90;
int buttonFastHeight = 50;
int buttonFastCoordX = windowWidth - buttonFastWidth - 15;
int buttonFastCoordY = windowHeight - buttonFastHeight - 15;
Button buttonFast;

int buttonSlowWidth = buttonFastWidth;
int buttonSlowHeight = buttonFastHeight;
int buttonSlowCoordX = buttonFastCoordX - buttonSlowWidth - 15;
int buttonSlowCoordY = buttonFastCoordY;
Button buttonSlow;

int buttonColor = #42ebf4;

// =================================================================
// =================================================================
// =================================================================

void setup() {
  size(1000, 800, P2D);
  background(backgroundColor);
  frameRate(framesPerSec);
  
  setup_3points();
  setup_initial_point();
  
  buttonFast = new Button(buttonFastCoordX, buttonFastCoordY, buttonFastWidth, buttonFastHeight);
  buttonSlow = new Button(buttonSlowCoordX, buttonSlowCoordY, buttonSlowWidth, buttonSlowHeight);
  
  show_frame_rate();
}

void draw() {
  for (int i = 0; i < 50; ++i) {
    compute_new_point();
    
    current_point.display();
    buttonFast.display();
    buttonSlow.display();
    
    show_frame_rate();
  }
}

// =================================================================
// =================================================================
// =================================================================

void setup_3points() {
  point1 = new Point(pointCoordX1, pointCoordY1);
  point2 = new Point(pointCoordX2, pointCoordY2);
  point3 = new Point(pointCoordX3, pointCoordY3);
  
  point1.display();
  point2.display();
  point3.display();
}

void setup_initial_point() {
  int coordX = (int) random(0, width);
  int coordY = (int) random(0, height);
  current_point = new Point(coordX, coordY);
  current_point.display();
}

void show_frame_rate() {
  fill(255, 255, 255);
  rect(0, 0, 200, 40);
  fill(0);
  textSize(20);
  text("frame rate : " + framesPerSec, textPosX, textPosY);
  noFill();
}

// =================================================================
// =================================================================
// =================================================================

void compute_new_point() {
  int oldCoordX = current_point.getCoordX(); //<>//
  int oldCoordY = current_point.getCoordY();
  
  int newCoordX = 0;
  int newCoordY = 0;
  
  int rdn = ((int) random(100)) % 3;
  
  if (rdn == 0) {
    newCoordX = (oldCoordX + point1.getCoordX()) / 2;
    newCoordY = (oldCoordY + point1.getCoordY()) / 2;
  } else if (rdn == 1) {
    newCoordX = (oldCoordX + point2.getCoordX()) / 2;
    newCoordY = (oldCoordY + point2.getCoordY()) / 2;
  } else if (rdn == 2) {
    newCoordX = (oldCoordX + point3.getCoordX()) / 2;
    newCoordY = (oldCoordY + point3.getCoordY()) / 2;
  }
  
  current_point.setCoordX(newCoordX);
  current_point.setCoordY(newCoordY);
}

// =================================================================
// =================================================================
// =================================================================

void mouseClicked() {
  int coordX = mouseX;
  int coordY = mouseY;
  
  if (buttonSlow.containsCoord(coordX, coordY))
    framesPerSec -= 1;
   
  if (buttonFast.containsCoord(coordX, coordY))
    framesPerSec += 1;
    
  framesPerSec = max(5, min(60, framesPerSec));
    
  frameRate(framesPerSec);
}