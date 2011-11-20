import processing.core.*;
import jp.nyatla.nyar4psg.*;
import processing.video.*;

PFont font;
CaptureDS capture;
SingleARTKMarker artk;
int objPosX, objPosY, objPosZ;
int speed = 5;

void setup() {
  size(640, 480, P3D);
  colorMode(RGB, 255);
  stroke(0);
  fill(255, 0, 128, 128);

  capture = new CaptureDS(this, width ,height, 30);

  artk = new SingleARTKMarker(this, width, height, "camera_para.dat");
  artk.setARCodes("patt.hiro", 80);
}

void captureEvent(CaptureDS myCapture) {
  myCapture.read();
}

void draw() {
  background(255);

  artk.drawBackground(capture);
  artk.detect(capture);

  artk.beginTransform();
  translate(objPosX, objPosY, 20);
  box(40);
  artk.endTransform();
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
