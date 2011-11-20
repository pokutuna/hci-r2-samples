import processing.core.*;
import processing.video.*;
import jp.nyatla.nyar4psg.*;

CaptureDS capture;
SingleARTKMarker artk;
ArrayList<PMatrix3D> projectionList;
ArrayList<Float> diffList;

void setup() {
  size(640, 480, P3D);
  noStroke();
  colorMode(RGB);

  capture = new CaptureDS(this, width, height, 30);

  artk = new SingleARTKMarker(this, width, height, "camera_para.dat");
  artk.setARCodes("patt.hiro", 80);
  artk.setARPerspective(); //ARToolkit準拠の変換行列を使う

  projectionList = new ArrayList<PMatrix3D>();
  diffList = new ArrayList<Float>();
}

void captureEvent(CaptureDS myCapture) {
  myCapture.read();
}

void draw() {
  background(255);
  artk.drawBackground(capture);
  artk.detect(capture);

  artk.beginTransform();
  drawBullets();
  drawCanon();
  artk.endTransform();
}

void drawCanon() {
  fill(128, 255, 0);
  pushMatrix();
  translate(0, 0, 20);
  box(40);
  pushMatrix();
  translate(0, 30, 0);
  cylinder(10, 20, 10, 10);
  popMatrix();
  popMatrix();
}

void drawBullets() {
  for(int i = 0; i < projectionList.size(); i++) {
    pushMatrix();
    setMatrix(projectionList.get(i));
    float diff = diffList.get(i);
    translate(0, diff, 20);
    fill(255, 0, 0, 230 - diff);
    sphere(5);
    diffList.set(i, diff + 10);
    popMatrix();
  }
}

void keyPressed() {
  projectionList.add(artk.getMarkerMatrix());
  diffList.add(0.0);
}
