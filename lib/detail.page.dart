import 'package:flutter/material.dart';
import 'package:studi_kasus_2/HttpHelper.dart';
import 'package:studi_kasus_2/makanan.dart';

class DetailPage extends StatelessWidget {
  final Makanan makanan;
  HttpHelper api = HttpHelper();

  // final String nama;
  // final String gambar;
  // final String deskripsi;
  // final String judul;
  // final String waktubuka;
  // final String harga;
  // final String kalori;
  // final List<String> slider;
  // final List<Map<String, String>> bahan;
  DetailPage({super.key, required this.makanan, required this.api});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.network(
                api.url + makanan.gambar,
                scale: 0.5,
              ),
              Positioned.fill(
                  child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.white,
                        shadows: [Shadow(color: Colors.black)],
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              )),
              FavouriteButton()
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makanan.slider.map((lokasi) {
                return Padding(
                    padding: EdgeInsets.all(10),
                    child: ClipRRect(
                      child: Image.network(api.url + lokasi),
                      borderRadius: BorderRadius.circular(10),
                    ));
              }).toList(),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  iconDetail(Icons.monetization_on_outlined, Colors.green[900]!,
                      Colors.green, makanan.harga),
                  iconDetail(Icons.local_fire_department_rounded, Colors.red,
                      Colors.red[200]!, makanan.kalori),
                  iconDetail(Icons.access_time_rounded, Colors.orange,
                      Colors.amberAccent, makanan.waktubuka),
                ]),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  makanan.nama,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  makanan.deskripsi,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text(
              'Bahan Racikan',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 100,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.cyan[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Image.network(
                              api.url + makanan.bahan[index].values.first,
                              width: 52),
                          Text(makanan.bahan[index].keys.first),
                        ],
                      ),
                    ),
                separatorBuilder: (_, index) => SizedBox(
                      width: 15,
                    ),
                itemCount: makanan.bahan.length),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    )));
  }
}

Container iconDetail(IconData icon, Color color, Color bgColor, String detail) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(10))),
    child: Column(
      children: [
        Icon(
          icon,
          size: 35,
          color: color,
        ),
        Text(
          detail,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: color),
        )
      ],
    ),
  );
}

class FavouriteButton extends StatefulWidget {
  const FavouriteButton({super.key});

  @override
  State<StatefulWidget> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavouriteButton> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: IconButton(
          icon: Icon(
            isFav ? Icons.favorite : Icons.favorite_border,
            size: 50,
            color: Colors.red,
          ),
          onPressed: () {
            setState(() {
              isFav = !isFav;
            });
          },
        ),
      ),
    ));
  }
}
