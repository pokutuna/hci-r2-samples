import processing.core.*;
import processing.video.*;
import jp.nyatla.nyar4psg.*;

Capture capture;
SingleARTKMarker artk;

void setup() {
  size(640, 480, P3D);
  stroke(128);
  colorMode(RGB);
  fill(100, 150, 250, 128);

  capture = new Capture(this, width ,height, 30);

  artk = new SingleARTKMarker(this, width, height, "camera_para.dat");
  artk.setARCodes("patt.hiro", 80);
}

void captureEvent(Capture myCapture) {
  myCapture.read();
}

void draw() {
  background(255);
  artk.drawBackground(capture);
  artk.detect(capture);
  artk.beginTransform();

  /*
    void cylinder(int corner, float length, float radius1 , float radius2) を利用
    corner: 角数。3なら三角柱。4なら四角柱。大きい数なら円柱。
    length: 作成する柱の大きさ。
    radius1: 底面の大きさ。片方を0にすると錐になる。
    radius2: 上面の大きさ。片方を0にすると錐になる。
  */

  pushMatrix();
  fill(255, 128, 0, 128);
  translate(0, 0, 20);
  // 100角柱、ほぼ円柱
  cylinder(100, 50, 20, 20);
  popMatrix();

  pushMatrix();
  fill(128, 255, 0, 128);
  translate(80, 0, 20);
  // 三角柱
  cylinder(3, 50, 20, 20);
  popMatrix();

  pushMatrix();
  fill(255, 0, 128, 128);
  translate(-80, 0, 20);
  // 四角錐
  cylinder(4, 50, 0, 20);
  popMatrix();

  pushMatrix();
  fill(0, 128, 255);
  translate(0, 80, 20);
  // drawMyShapeで図形を描画、図形は頂点を組み合わせて作ることができる
  drawMyShape(50);
  popMatrix();

  pushMatrix();
  fill(0, 255, 128);
  translate(0, -80, 20);
  drawScrappedShape(50, 50);
  popMatrix();

  artk.endTransform();
}

void drawMyShape(float edge) {
  // ref: http://processing.org/reference/beginShape_.html
  float x, y, z;
  pushMatrix();

  PVector[] vectors = {
    new PVector(0, 0),
    new PVector(edge / 2, 0),
    new PVector(edge / 2, edge / 2),
    new PVector(-edge / 2, edge / 2),
    new PVector(-edge / 2, -edge / 2),
    new PVector(0, -edge / 2)
  };

  beginShape(TRIANGLE_FAN);
  y = -edge / 2;
  for(int i = 0; i < vectors.length; i++) {
    vertex(vectors[i].x, y, vectors[i].y);
  }
  endShape();

  beginShape(TRIANGLE_FAN);
  y = edge / 2;
  for(int i = 0; i < vectors.length; i++) {
    vertex(vectors[i].x, y, vectors[i].y);
  }
  endShape();

  beginShape(TRIANGLE_STRIP);
  for(int i = 0; i < vectors.length; i++) {
    vertex(vectors[i].x, -edge / 2, vectors[i].y);
    vertex(vectors[i].x, edge / 2, vectors[i].y);
  }
  endShape();

  popMatrix();
}

void drawScrappedShape(float edge, int vertexSize) {
  pushMatrix();
  beginShape(TRIANGLE_STRIP);
  vertex(0, 0, 0);
  for(int i = 0; i < vertexSize; i++) {
    vertex(random(-edge / 2, edge / 2), random(-edge / 2, edge / 2), random(-edge / 2, edge / 2));
  }
  vertex(0, 0, 0);
  endShape();
  popMatrix();
}