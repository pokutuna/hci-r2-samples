import processing.core.*;
import jp.nyatla.nyar4psg.*;
import hypermedia.video.*;

PFont font;
OpenCV opencv;
SingleARTKMarker nya;
int objPosX, objPosY, objPosZ;
int speed = 5;

void setup() {
  size(640, 480, P3D);
  colorMode(RGB, 100);
  font = createFont("FFScala", 32);
  opencv = new OpenCV(this);
  opencv.capture(width, height);
  nya = new SingleARTKMarker(this, width, height, "camera_para.dat");
  nya.setARCodes("patt.hiro", 80);
}


void draw() {
  background(255);
  opencv.read();

  PImage img = opencv.image();
  nya.drawBackground(img);
  nya.detect(img);

  nya.beginTransform();
  translate(objPosX, objPosY, 20);
  box(40);
  nya.endTransform();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      objPosX += speed;
    } else if (keyCode == DOWN) {
      objPosX -= speed;
    } else if (keyCode == LEFT) {
      objPosY += speed;
    } else if (keyCode == RIGHT) {
      objPosY -= speed;
    }
  }
}