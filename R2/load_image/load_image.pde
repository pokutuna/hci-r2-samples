PImage img;

void setup() {
  size(640, 480);
  img = loadImage("hitode.png");
}

void draw() {
  image(img, 0, 0);
}
