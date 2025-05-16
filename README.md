# Tafoo
Tafoo, ikinci el araç alım satım işlemlerinde yanlış bilginin önüne geçmek amacıyla görüntü işleme teknikleri kullanılarak hasarın ve hasar bölgesinin tespiti yapılmasını hedeflemektedir. Buna ek olarak, uygulama içindeki chatbot sayesinde kullanıcıların araç alım sürecinde akıllarındaki sorulara cevaplar verilerek yanlış bilgiye maruz kalmalarının önlenmesi amaçlanmıştır.



### 🛠 Kullanılan Teknolojiler

- Mobil Uygulama Geliştirme: Flutter (https://flutter.dev/)
- Yapay Zeka Chatbot API Sistemi: OpenRouter (https://openrouter.ai/)
- Veri Tabanı: Firebase Firestore (https://firebase.google.com/docs/firestore)
- Yapay Zeka Modelleri: Detectron, Mask R-CNN, Torch.
- Arayüz ve model entegresi: Flask
- UI/UX tasarımı : Figma

Görseller:

<div align="center"> 

  <div style="border: 1px solid white; padding: 15px; margin: 20px auto; display: inline-block; border-radius: 8px; background-color: #222;">
    <h3 style="color: white; margin-bottom: 10px;">Splash & Giriş ekranı & Anasayfa</h3>
    <img src="assets/splash-screen.png" width="130" />
    <img src="assets/login.png" width="130" />
    <img src="assets/homepage-mobil.png" width="130" />
  </div>

  <div style="border: 1px solid white; padding: 15px; margin: 20px auto; display: inline-block; border-radius: 8px; background-color: #222;">
    <h3 style="color: white; margin-bottom: 10px;">İlan Arama Kısımları</h3>
    <img src="assets/ilan-ara.png" width="130" />
    <img src="assets/kesfet.png" width="130" />
  </div>

  <div style="border: 1px solid white; padding: 15px; margin: 20px auto; display: inline-block; border-radius: 8px; background-color: #222;">
    <h3 style="color: white; margin-bottom: 10px;">İlan Verme ve Sonuçları Görme</h3>
    <img src="assets/ilan-ver-1.png" width="130" />
    <img src="assets/ilan-ver-2.png" width="130" />
    <img src="assets/resim-yukle.png" width="130" />
    <img src="assets/ai-waiting.png" width="130" />
    <img src="assets/preview.png" width="130" />
    <img src="assets/damage-details.png" width="130" />
  </div>

  <div style="border: 1px solid white; padding: 15px; margin: 20px auto; display: inline-block; border-radius: 8px; background-color: #222;">
    <h3 style="color: white; margin-bottom: 10px;">Chatbot</h3>
    <img src="assets/chat-bot-home.png" width="130" />
    <img src="assets/chat-bot-message-page.png" width="130" />
  </div>

</div>


Tafoo, ikinci el araç alım satım işlemlerinde kullanıcılara basit arayüzü ve hızlı çalışma yapısıyla destek olmaktadır. Bununla birlikte kullanıcıların bilgilere doğru ve hızlı şekilde ulaşması amaçlanarak tasarım ve modelleme kısımları bu şartlara uygun şekilde değerlendirilmiştir.

Proje kapsamında sonuçlar incelenerek R50-FPN ve R101-FPN methodlarının arasından yüksek değerleri olan tercih edilerek uygulamaya entegre edilmiştir. Uygulama içerisinde de hem ilan verme aşamasında hem de kolay kullanım sunması açısından direkt erişim olarak anasayfaya eklenmiştir. Böylece ikinci el araç ilanlarında hasar tespiti ve bölge tespiti yapılarak kullanıcıyı doğru bilgiye ulaştırma amaçlanmıştır.

İlerleyen aşamalarda daha iyi bir veri seti ile daha doğru değerlere sahip modeller eğitilebilir. Böylelikle uygulamanın amacı daha da pekiştirilmiş olacaktır. Proje kapsamı geliştirilerek tespit edilen hasarın maliyet ve onarım fiyatı belirlemesi işlemi eklenebilir. 