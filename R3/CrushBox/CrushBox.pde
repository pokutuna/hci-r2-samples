import processing.core.*;
import processing.video.*;
import jp.nyatla.nyar4psg.*;

Capture capture;
SingleARTKMarker artk;

int status;
PMatrix3D projection;
boolean crushed = false;
int boxSize = 0;
int VERTEX_SIZE = 50;
PVector[] scrappedVertexes = new PVector[VERTEX_SIZE];

void setup() {
  size(640, 480, P3D);
  stroke(128);
  colorMode(HSB, 100);

  capture = new Capture(this, width ,height, 30);

  artk = new SingleARTKMarker(this, width, height, "camera_para.dat");
  artk.setARCodes("patt.hiro", 80);
  artk.setARPerspective();
}

void captureEvent(Capture myCapture) {
  myCapture.read();
}

void draw() {
  background(255);
  artk.drawBackground(capture);
  status = artk.detect(capture);

  if (status == SingleARTKMarker.ST_NOMARKER) {
    noMarker();
  } else if (status == SingleARTKMarker.ST_NEWMARKER) {
    newMarker();
  } else {
    existMarker();
  }
}

void noMarker() {
  if (projection != null) {
    setScrappedVertices(boxSize/2);
    crushed = true;
    pushMatrix();
    setMatrix(projection);
    drawScrappedShape();
    popMatrix();
  }
}

void newMarker() {
  boxSize = 0;
  crushed = false;
}

void existMarker() {
  artk.beginTransform();
  drawBox();
  projection = artk.getMarkerMatrix();
  boxSize += 1;
  artk.endTransform();
}

void drawBox() {
  pushMatrix();
  translate(0, 0, boxSize/2);
  fill(boxSize % 100, 90, 90, 50);
  box(40, 40, boxSize);
  popMatrix();
}

void setScrappedVertices(int edge) {
  if (crushed == false) {
    for(int i = 0; i < VERTEX_SIZE; i++) {
      scrappedVertexes[i] = new PVector(
        random(-edge / 2, edge / 2),
        random(-edge / 2, edge / 2),
        random(-edge / 2, edge / 2));
    }
  }
}

void drawScrappedShape() {
  pushMatrix();
  beginShape(TRIANGLE_STRIP);
  vertex(0, 0, 0);
  for(int i = 0; i < VERTEX_SIZE; i++) {
    vertex(scrappedVertexes[i].x, scrappedVertexes[i].y, scrappedVertexes[i].z);
  }
  vertex(0, 0, 0);
  endShape();
  popMatrix();
}
