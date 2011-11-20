// ref: http://p5info.com/index.php?snippet%2F%E5%86%86%E6%9F%B1
/**
  corner: 角数。3なら三角柱。4なら四角柱。大きい数なら円柱。
  length: 作成する柱の大きさ。
  radius1: 底面の大きさ。片方を0にすると錐になる。
  radius2: 上面の大きさ。片方を0にすると錐になる。
*/

void cylinder(int corner, float length, float radius1 , float radius2){
  float x, y, z; //座標
  float inc = 360.0 / corner;
  pushMatrix();

  //上面の作成
  beginShape(TRIANGLE_FAN);
  y = -length / 2;

  vertex(0, y, 0);
  for(float deg = 0; deg <= 360; deg = deg + inc){
    x = cos(radians(deg)) * radius1;
    z = sin(radians(deg)) * radius1;
    vertex(x, y, z);
  }
  endShape();

  //底面の作成
  beginShape(TRIANGLE_FAN);
  y = length / 2;
  vertex(0, y, 0);
  for(float deg = 0; deg <= 360; deg = deg + inc){
    x = cos(radians(deg)) * radius2;
    z = sin(radians(deg)) * radius2;
    vertex(x, y, z);
  }
  endShape();


  //側面の作成
  beginShape(TRIANGLE_STRIP);
  for(float deg = 0; deg <= 360; deg = deg + inc){
    x = cos(radians(deg)) * radius1;
    y = -length / 2;
    z = sin(radians(deg)) * radius1;
    vertex(x, y, z);

    x = cos(radians(deg)) * radius2;
    y = length / 2;
    z = sin(radians(deg)) * radius2;
    vertex(x, y, z);
  }
  endShape();
  popMatrix();
}