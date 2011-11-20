import processing.core.*;
import processing.video.*;
import jp.nyatla.nyar4psg.*;

PFont font;
Capture capture;
SingleARTKMarker artk;
int c = 0;

void setup() {
  size(640, 480, P3D);
  colorMode(RGB, 255);

  font = createFont("FFScala", 32);

  capture = new Capture(this, width, height, 30);

  artk = new SingleARTKMarker(this, width, height, "camera_para.dat");
  artk.setARCodes("patt.hiro", 80);
}

void draw() {
  c++;
  background(255);
  capture.read();

  artk.drawBackground(capture);

  switch(artk.detect(capture)){
  case SingleARTKMarker.ST_NOMARKER:
    return;
  case SingleARTKMarker.ST_NEWMARKER:
    println("Marker found.");
    return;
  case SingleARTKMarker.ST_UPDATEMARKER:
    break;
  case SingleARTKMarker.ST_REMOVEMARKER:
    println("Marker removed.");
    return;
  default:
    return;
  }

  artk.beginTransform();//マーカ座標系に設定
  setMatrix(artk.getMarkerMatrix());//マーカ姿勢をセット
  drawBox();
  drawMarkerXYPos();
  artk.endTransform();  //マーカ座標系を終了

  drawMarkerPatt();
  drawVertex();
}

void drawBox() {
  pushMatrix();

  fill(255, 0, 128, 128);
  stroke(255, 200, 0);
  translate(0, 0, 20);
  box(40);
  noFill();
  translate(0, 0, -20);
  rect(-40, -40, 80, 80);

  popMatrix();
}

//この関数は、マーカパターンを描画します。
void drawMarkerPatt() {
  PImage p = artk.pickupMarkerImage(40, 40, -40, 40, -40, -40, 40, -40, 100, 100);
  image(p, 0, 0);
}

//この関数は、マーカ平面上の点を描画します。
void drawMarkerXYPos() {
  pushMatrix();
  PVector pos = artk.screen2MarkerCoordSystem(mouseX, mouseY);
  translate(pos.x, pos.y, 0);
  noFill();
  stroke(0, 0, 100);
  ellipse(0, 0, 20-c%20, 20-c%20);
  popMatrix();
}

//この関数は、マーカ頂点の情報を描画します。
void drawVertex() {
  PVector[] i_v = artk.getMarkerVertex2D();
  textFont(font, 10.0);
  stroke(100, 0, 0);
  for(int i = 0; i < 4; i++){
    fill(100, 0, 0);
    ellipse(i_v[i].x, i_v[i].y, 6, 6);
    fill(0, 0, 0);
    text("(" + i_v[i].x + "," + i_v[i].y + ")", i_v[i].x, i_v[i].y);
  }
}
