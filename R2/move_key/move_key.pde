
int posX, posY;

void setup() {
  size(640, 480);
}

void draw() {
  background(255);
  fill(255, 128, 0);
  ellipse(posX, posY, 50, 50);
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      posY -= 10;
    } else if (keyCode == DOWN) {
      posY += 10;
    } else if (keyCode == LEFT) {
      posX -= 10;
    } else if (keyCode == RIGHT) {
      posX += 10;
    }
  }
}

