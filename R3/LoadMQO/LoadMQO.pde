import processing.video.*;
import processing.opengl.*;
import javax.media.opengl.*;
import jp.nyatla.nyar4psg.*;
import jp.nyatla.kGLModel.*;
import jp.nyatla.kGLModel.contentprovider.*;

CaptureDS capture;
SingleARTKMarker artk;
KGLModelData model;
ContentProvider content;

void setup() {
  size(640, 480, OPENGL);
  hint(ENABLE_OPENGL_4X_SMOOTH);

  capture = new CaptureDS(this, width, height, 30);

  artk = new SingleARTKMarker(this, width, height, "camera_para.dat");
  artk.setARCodes("patt.hiro", 80);

  // mqoモデルの読み込み、dataPathを用いて絶対パスを取得する
  content = new LocalContentProvider(this, dataPath("jeep.mqo"));
  PGraphicsOpenGL pgl = (PGraphicsOpenGL) g;
  GL gl = pgl.beginGL();
  model = KGLModelData.createGLModelPs(this, gl, null, content, 0.015f,
    KGLExtensionCheck.IsExtensionSupported(gl, "GL_ARB_vertex_buffer_object"), true);
  pgl.endGL();
}

void captureEvent(CaptureDS myCapture) {
  myCapture.read();
}

void draw() {
  background(128);
  artk.drawBackground(capture);
  artk.detect(capture);

  PGraphicsOpenGL pgl = (PGraphicsOpenGL) g;
  artk.beginTransform(pgl);
  GL gl = pgl.beginGL();

  // glRotatef(degree, x, y, z) -> x,y,zベクトルを軸にdegree度回転
  gl.glRotatef(-90, 1, 0, 0);
  model.enables(10);
  model.draw();
  model.disables();

  pgl.endGL();
  artk.endTransform();
}