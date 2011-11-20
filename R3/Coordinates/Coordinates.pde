import processing.core.*;
import processing.video.*;
import jp.nyatla.nyar4psg.*;

PFont font;
CaptureDS capture;
SingleARTKMarker artk;

void setup() {
  size(640, 480, P3D);
  colorMode(RGB);

  font = createFont("ipaexg.ttf", 15);
  textFont(font);

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

  // マーカ頂点の二次元座標(スクリーン上の座標)
  drawMarkerVertexes();

  // スクリーン上の座標をマーカ座標系に変換
  drawScreenMousePosition();

  // Box
  drawBox();
}

void drawMarkerVertexes() {
  stroke(0);
  fill(255, 128, 0, 230);

  // ref: PVector http://processing.org/reference/PVector.html
  PVector[] vertexes = artk.getMarkerVertex2D();
  for (int i = 0; i < vertexes.length; i++) {
    text("(" + vertexes[i].x + ", " + vertexes[i].y + ")", vertexes[i].x, vertexes[i].y);
    ellipse(vertexes[i].x, vertexes[i].y, 10, 10);
  }
}

void drawScreenMousePosition() {
  stroke(0);
  fill(128, 255, 0, 230);

  // ref: screen2MarkerCoordSystem http://nyatla.jp/nyartoolkit/doc/nyar4psg/api/1.1.6/jp/nyatla/nyar4psg/SingleMarkerBaseClass.html#screen2MarkerCoordSystem(int, int)
  artk.beginTransform();
  pushMatrix();
  PVector position = artk.screen2MarkerCoordSystem(mouseX, mouseY);
  translate(position.x, position.y, 0);
  ellipse(0, 0, 10, 10);
  popMatrix();
  artk.endTransform();

  text("(" + position.x + ", " + position.y + ")", mouseX, mouseY);
}

void drawBox() {
  stroke(255,255,0);
  fill(100, 150, 250, 128);

  artk.beginTransform();
  translate(0, 0, 20);
  box(40);
  artk.endTransform();
}
