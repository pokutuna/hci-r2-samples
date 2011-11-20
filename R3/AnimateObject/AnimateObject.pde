import processing.core.*;
import processing.video.*;
import jp.nyatla.nyar4psg.*;

CaptureDS capture;
SingleARTKMarker artk;
float offset = 0.0;

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

  // マーカ座標系の中心
  fill(0, 128, 255, 128);
  sphere(5);

  // rotateメソッドを利用
  // 座標系をrotateで回転 -> translateで座標を指定(オブジェクトごと回転)
  pushMatrix();
  rotateZ(PI + offset);
  translate(80, 0, 20);
  fill(255, 128, 0, 128);
  box(20);
  popMatrix();

  // 数学関数を利用
  // 回転させた座標にtranslateで移動(オブジェクトは回転しない)
  pushMatrix();
  PVector pos = rotateMathematically(new PVector(50, 0), PI - offset);
  translate(pos.x, pos.y, 0);
  fill(128, 255, 0, 128);
  box(10);
  popMatrix();

  // 三角関数で座標をゆらすサンプル
  pushMatrix();
  pos = rotateMathematically(new PVector(30, 0), PI + offset * 2);
  translate(pos.x + sin(offset) * 10, pos.y + cos(offset) * 10, sin(offset) * 100);
  fill(255, 0, 128, 128);
  sphere(10);
  popMatrix();

  // Boxをたくさん回転させる、ある程度複雑なことをするならメソッドを分けるといい
  drawRollingBoxes();

  artk.endTransform();
  offset += 0.05;
}

PVector rotateMathematically(PVector pos, float radian) {
  float destX, destY;
  destX = pos.x * cos(radian) - pos.y * sin(radian);
  destY = pos.x * sin(radian) - pos.y * cos(radian);
  return new PVector(destX, destY);
}

void drawRollingBoxes() {
  colorMode(HSB, 100);
  pushMatrix();
  translate(50, 50, 0);
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 5; j++) {
      pushMatrix();
      translate(10 * i, 10 * j, 10);
      rotateX(PI + offset);
      rotateY(PI - offset * 1.5);
      rotateZ(PI * offset);
      fill((i * 15 +  j * 5), 100, 100, 50);
      box(5);
      popMatrix();
    }
  }
  popMatrix();
  colorMode(RGB, 255);
}
