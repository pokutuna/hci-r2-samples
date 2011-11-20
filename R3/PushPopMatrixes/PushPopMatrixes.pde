import processing.core.*;
import processing.video.*;
import jp.nyatla.nyar4psg.*;

CaptureDS capture;
SingleARTKMarker artk;

void setup() {
  size(640, 480, P3D);
  colorMode(RGB);
  noStroke();
  fill(100, 150, 250, 128);

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

  pushMatrix();
  translate(0, 0, 20);
  fill(100, 150, 250, 128);
  box(40);
  popMatrix();

  pushMatrix();
  translate(100, 0, 0);
  fill(255, 128, 0, 128);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(0, 100, 0);
  rotateX(PI / 2);
  fill(0, 255, 128, 128);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(0, 0, 50);
  rotateY(PI / 2);
  fill(128, 0, 255, 128);
  sphere(20);
  popMatrix();

  pushMatrix();
  fill(128, 255, 0, 128);
  sphere(5);
  popMatrix();

  artk.endTransform();
}
