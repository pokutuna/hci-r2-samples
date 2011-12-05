void setup() {
  setProxy(); // プロキシをセット

  // 以降の通信はだいたいproxyが効く、以下google.comのhtmlを標準出力へ書き出すサンプル
  String[] lines = loadStrings("http://google.com");
  for(int i = 0; i < lines.length; i++) {
    println(lines[i]);
  }
}

// 学内プロキシセットするメソッド、以下をまるまるどっかにこぴぺ
import java.util.Properties;
void setProxy() {
  Properties systemSettings = System.getProperties();
  systemSettings.put("http.proxyHost", "proxy.ksc.kwansei.ac.jp");
  systemSettings.put("http.proxyPort", "8080");
  System.setProperties(systemSettings);
}
