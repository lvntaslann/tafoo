import 'package:flutter/material.dart';
import 'package:tafoo/Pages/shared_car_details.dart';

class WebHomePage extends StatefulWidget {
  const WebHomePage({Key? key}) : super(key: key);

  @override
  _WebHomePageState createState() => _WebHomePageState();
}

class _WebHomePageState extends State<WebHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0XFFFAFAFA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.1,
              decoration: BoxDecoration(color: Color(0XFFFE7F21)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Alırken, Satarken, Kullanırken!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: size.width * 0.4),
                  WebNavButton(),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  WebNavButton(),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  WebNavButton(),
                ],
              ),
            ),
            Row(
              children: [
                Image.asset(
                  "assets/images/tafoologo.png",
                  width: 180,
                  height: 130,
                ),
                Text(
                  "hep yanında !",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFFFE7F21)),
                ),
                MyWebSearchBar(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Sol bölüm (CarType listesi)
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Container(
                    height: size.height * 0.9,
                    width: size.width * 0.25,
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        CarType(
                          image: 'assets/images/car.png',
                          title: 'Otomobil',
                          number: '91.234',
                        ),
                        CarType(
                          image: 'assets/images/suv.png',
                          title: 'Arazi, SUV, Pick-up',
                          number: '12.123',
                        ),
                        CarType(
                          image: 'assets/images/motorcycle.png',
                          title: 'Motosiklet',
                          number: '2.343',
                        ),
                        CarType(
                          image: 'assets/images/pickup.png',
                          title: 'Ticari Araçlar',
                          number: '1.234',
                        ),
                        CarType(
                          image: 'assets/images/broken-car.png',
                          title: 'Hasarlı Araçlar',
                          number: '9.254',
                        ),
                      ],
                    ),
                  ),
                ),

                // Sağ bölüm (Resim ve ilan seçenekleri)
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Üstteki geniş resim
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 20), // Daha küçük bir boşluk bırakıldı
                        child: Container(
                          width: 1150, // Resmin genişliği
                          height: 450, // Resmin yüksekliği
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/background1.jpg"), // Resim yolu
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    "Şimdi Nissan\nX-Trail sizlerle",
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Fiyat bilgisi al butonu
                                    },
                                    child: Text("Fiyat bilgisi al"),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Colors.orange, // Buton rengi
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Alt seçenekler kısmı
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          MyWebDefaultContainer(
                            text: "İlan ara",
                            description: "Hayalindeki aracı\nbul!",
                            image: "assets/images/searchcar.png",
                            height: 180,
                            width: 185,
                            isNumber: true,
                            isAiOto: false,
                            onTap: () => (),
                          ),
                          MyWebDefaultContainer(
                            text: "İlan ver",
                            description:
                                "Ücretsiz ilan ver\n60 güne kadar yayında kalsın!",
                            image: "assets/images/add-icon-logo.png",
                            height: 180,
                            width: 180,
                            isNumber: false,
                            isAiOto: false,
                            onTap: () => (),
                          ),
                          MyWebDefaultContainer(
                            text: "Araban kaç para?",
                            description:
                                "Arabanın gerçek\npiyasa değerini öğren!",
                            height: 180,
                            width: 185,
                            isNumber: false,
                            isAiOto: false,
                            onTap: () => (),
                          ),
                          MyWebDefaultContainer(
                            text: "Garaj",
                            description:
                                "Aracının periyodik\nbakımlarını takip et!",
                            image: "assets/images/garage.png",
                            height: 180,
                            width: 185,
                            isNumber: false,
                            isAiOto: false,
                            onTap: () => (),
                          ),
                          MyWebDefaultContainer(
                            text: "AI OTO EKSPERTİZ",
                            description:
                                "Doğruluk oranı yüksek olan yapay\nzeka desteği ile aracını test et!",
                            image: "assets/images/ai_oto.png",
                            height: 200,
                            width: 350,
                            isNumber: false,
                            isAiOto: true,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          Padding(
  padding: const EdgeInsets.only(left: 60),
  child: Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Keşfet",
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Color(0XFFFE7F21),
              ),
            ),
            Container(
              height: size.height * 0.67,  // Yüksekliği ekran boyutuna göre ayarlıyoruz
              width: size.width,           // Genişliği ekran boyutuna göre ayarlıyoruz
              decoration: BoxDecoration(
                color: Color(0XFFFAFAFA),
              ),
              child: GridView.count(
                crossAxisCount: 4, // 6 sütun yan yana olacak
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                padding: EdgeInsets.all(10),
                children: List.generate(
                  8, // Toplamda 12 adet öğe olacak
                  (index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SharedCarDetails(tag: 'car_$index'),
                        ),
                      );
                    },
                    child: Container(
                      width: 220,
                      height: 175,
                      decoration: BoxDecoration(
                        color: Color(0XFFffffff),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: "car_$index",
                            child: Image.asset(
                              "assets/images/carbmw.png",
                              width: 164,
                              height: 108,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "İstanbul",
                                  style: TextStyle(
                                    color: Color(0XFF5E5D5D),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                                Text(
                                  "Sahibinden\nhatasız araba",
                                  style: TextStyle(
                                    color: Color(0XFF898989),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 100),
                                  child: Text(
                                    "1.500.000 TL",
                                    style: TextStyle(
                                      color: Color(0XFFFE7F21),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  ),
)


          ],
        ),
      ),
    );
  }
}

class WebNavButton extends StatelessWidget {
  const WebNavButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 35,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextButton(onPressed: () {}, child: Text("Anasayfa")),
    );
  }
}

class MyWebSearchBar extends StatelessWidget {
  const MyWebSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 70, top: 30),
      child: Container(
        width: 953, // Burada genişliği istediğin kadar ayarlayabilirsin
        height: 80,
        child: TextFormField(
          style: TextStyle(
            color: const Color.fromARGB(255, 110, 109, 109).withOpacity(0.9),
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Color.fromRGBO(164, 164, 164, 1.0),
            ),
            labelText: "Marka, Model veya anahtar kelime",
            labelStyle: TextStyle(color: Color.fromRGBO(164, 164, 164, 1.0)),
            filled: true,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            fillColor: Color(0xFFE8E6E6), // Arka plan rengini değiştirdim
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

class CarType extends StatelessWidget {
  final String image;
  final String title;
  final String number;
  const CarType({
    super.key,
    required this.image,
    required this.title,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15),
        Row(
          children: [
            SizedBox(width: 20),
            CircleAvatar(
              backgroundImage: AssetImage(image),
              radius: 30,
            ),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: Color.fromRGBO(254, 127, 33, 1.0),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(width: 10),
            Text(
              number,
              style: TextStyle(
                color: Color.fromRGBO(164, 164, 164, 1.0),
                fontSize: 15,
              ),
            ),
          ],
        ),
        SizedBox(height: 10), // Divider ile Row arasına boşluk ekleyelim
        Padding(
          padding: const EdgeInsets.only(
              left: 20, right: 10), // Divider'ı biraz sağa ve sola boşluk ekle
          child: Divider(
            color: Colors.grey, // Divider'ın rengi
            thickness: 1, // Divider kalınlığı
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}

class MyWebDefaultContainer extends StatelessWidget {
  final String text;
  final String description;
  final String? image;
  final double height;
  final double width;
  final bool isNumber;
  final bool isAiOto;
  final Function()? onTap;
  const MyWebDefaultContainer({
    super.key,
    required this.text,
    required this.description,
    this.image,
    required this.height,
    required this.width,
    required this.isNumber,
    required this.isAiOto,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (image != null && image!.isNotEmpty && isAiOto == true)
                Center(
                  child: Image.asset(
                    image!,
                    height: 110,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: TextStyle(
                    color: Color.fromRGBO(254, 127, 33, 1.0),
                    fontSize: isAiOto ? 15 : 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (isAiOto == false)
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(description,
                      style: TextStyle(
                          color: Color.fromRGBO(164, 164, 164, 1.0),
                          fontSize: 17)),
                ),
              if (isAiOto)
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(description,
                          style: TextStyle(
                              color: Color.fromRGBO(164, 164, 164, 1.0))),
                    ),
                    SizedBox(width: 10),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_circle_right_outlined,
                          size: 30,
                        ))
                  ],
                ),
              Row(
                children: [
                  if (isNumber)
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text("120.552 ilan",
                          style: TextStyle(
                              color: Color.fromRGBO(94, 93, 93, 1.0),
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                    ),
                  if (isNumber == false)
                    SizedBox(
                      width: 80,
                    ),
                  if (image != null && image!.isNotEmpty && isAiOto == false)
                    Expanded(
                        child: Image.asset(
                      image!,
                      height: 45,
                    )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
