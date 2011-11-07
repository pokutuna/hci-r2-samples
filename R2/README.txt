授業課題サンプル

* カメラ
camera_opencv - OpenCVを利用したカメラからの画像取得
camera_processing - Processing標準添付ライブラリからの取得(Winで動かない)
deleyed_frame - カメラからの画像を16個保存し並べて表示
convert - OpenCVを利用したグレースケールへの変換
background_diff - 背景差分
namec_skin - ナメック星人化
pimage_namec - PImageに入れた画像をいじってナメック化

* 顔認識
face_detection - OpenCVを利用した顔認識
face_blur - 顔にブラーをかける
copy_face - 顔領域の画像をコピー、顔に画像を貼る

* 他
load_image - 画像の読み込みサンプル
image_type - SOURCE, BUFFER, MEMORY 等OpenCVの画像領域サンプル


* メモ
顔認識器XMLへのパスに日本語が入ってるとうまくいかない場合がある

opencv.read(); カメラから読み込み
opencv.image(); 読み込んだ内容をPImageで返す

opencv.image([type])
  OpenCV.SOURCE 元画像
  OpenCV.BUFFER バッファ領域、フィルタ等変換したもの、何もしなくてもバッファにも読み込まれる
  OpenCV.MEMORY メモリ領域、opencv.remember(); で現在の画像を1件保存しておける


* LISENCE
** OpenCV Processing and Java Library
http://ubaa.net/shared/processing/opencv/
The OpenCV Processing Library is a project of the Atelier hypermédia at the École Supérieure d'Art d'Aix-en-Provence. It is maintained by Stéphane Cousot and Douglas Edric Stanley.

** IPAedFont
このリポジトリ内の一部のプログラムはIPAexFontを利用しています
http://ipafont.ipa.go.jp/ipa_font_license_v1.html

** haarcascade_frontalface_alt.XML
Created by Rainer Lienhart.
see also ./face_detection/data/LISENCE.txt
