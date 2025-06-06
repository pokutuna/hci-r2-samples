// OBJファイル読み込みサンプル
// 3DモデルをProcessingで表示し、マウスドラッグで回転操作を行う

PShape model;         // 3Dモデルデータを格納
float rotationX = 0;  // X軸回転角度
float rotationY = 0;  // Y軸回転角度

void setup() {
  size(800, 600, P3D);

  // OBJファイルを読み込み（MTLファイルも自動で読み込まれる）
  model = loadShape("jeep.obj");

  // 読み込み結果をコンソールに出力
  if (model == null) {
    println("ERROR: Could not load jeep.obj");
  } else {
    println("Model loaded successfully");
    println("Model dimensions: " + model.getWidth() + " x " + model.getHeight() + " x " + model.getDepth());
  }
}

void draw() {
  background(30);
  lights();

  // 画面中央に移動
  translate(width / 2, height / 2);

  // 回転を適用
  rotateX(rotationX);
  rotateY(rotationY);

  // モデルを描画
  if (model != null) {
    shape(model);
  } else {
    // 読み込み失敗時は赤いキューブを表示
    fill(255, 0, 0);
    box(50);
  }
}

// マウスドラッグによる回転操作
void mouseDragged() {
  rotationY += (mouseX - pmouseX) * 0.01;  // 水平ドラッグでY軸回転
  rotationX += (mouseY - pmouseY) * 0.01;  // 垂直ドラッグでX軸回転
}
