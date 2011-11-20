* Samples
- NyARToolkit: NyAR4psg付属のサンプルを若干見やすく
とくになし

- MarkerCondition: マーカの状態を知る
detectの返り値を定数と比較する
ref: http://nyatla.jp/nyartoolkit/doc/nyar4psg/api/1.1.6/jp/nyatla/nyar4psg/SingleARTKMarker.html

- Coordinates: マーカ頂点の2次元上の座標&スクリーン上の座標をマーカ座標系に変換
マーカ座標系からスクリーン上の座標を得るには getMarkerVertex2D を使う
スクリーン上の座標からマーカ座標系を得るには screen2MarkerCoordSystem を使う

- PushPopMatrixes: pushMatrix/popMatrixで原点を保ったままたくさん図形を書く
pushMatrix() で現在の座標系(原点)を保存することができる
popMatrix() で最後にpushした座標系に戻る
pushMatrix -> translate -> いろいろする -> popMatrix -> ...
の繰り返しでマーカ基準にいろいろ描画できる

- TwoMarkers: 2つのマーカを利用する
2つのマーカを利用するサンプル、マーカを追加した順にidが振られる
isExistMarker(id) でマーカが検出されているかどうか判定できる

- Shapes: いろいろな立体を描く
球、直方体以外の図形を描くにはbeginShape, endShapeを使う
beginShape -> vertex(x1, y1, z1) -> vertex(x2, y2, z2) ... -> endShape
で頂点を結んだ図形が描ける。立方体を描くcylindarメソッドはこちらを参照
ref: http://p5info.com/index.php?snippet%2F%E5%86%86%E6%9F%B1

- MoveObject: 立体を矢印キーで動かす
矢印キーで立体を描画する座標を増減させ動かす

- AnimateObject: 立体をアニメーションさせる
rotate -> translate -> 描画 で図形を回転させることができる
座標の計算に数学関数を用いても良い
フレームごとに座標をずらしていくことでアニメーションできる

- ProjectionMatrix: 射影変換行列の保存&利用
getMarkerMatrix でマーカ座標系の射影行列を得ることができる(PMatrix3Dクラス)
setMatrixメソッドに行列を渡すことで、変換行列を適用できる。
マーカ座標系で変換行列を保存し、そののち変換行列を適用することで
以前のマーカ位置に図形描画するなどが可能になる。

- LoadMQO: メタセコイアモデルのロード&描画
メタセコイアモデルの描画にはOpenGLを用いる。
(重要) 絶対パスを直接入力せず、dataPath(モデル名.mqo)を利用すること
OpenGLではglRotatef(degree, x, y, z)でx,y,zベクトルを軸にdegree度回転することができる。
メソッド等だいたい共通のはず ref: http://www.komoto.org/opengl/#Use


* 作成例
- ObjectWithProjection: 弾を発射、座標系を保ったまま飛ぶ
- CrushBox: だんだん大きくなっていく箱を叩くと壊れる


* Links
- NyAR4psg JavaDoc
http://nyatla.jp/nyartoolkit/doc/nyar4psg/api/1.1.6/jp/nyatla/nyar4psg/package-summary.html
