class Makanan {
  final String nama;
  final String judul;
  final String deskripsi;
  final String gambar;
  final String waktubuka;
  final String harga;
  final String kalori;
  final List<String> slider;
  final List<Map<String, String>> bahan;

  Makanan(
      {required this.nama,
      required this.deskripsi,
      required this.gambar,
      required this.judul,
      required this.waktubuka,
      required this.harga,
      required this.kalori,
      required this.slider,
      required this.bahan});

  factory Makanan.fromJson(Map<String, dynamic> json) {
    return Makanan(
      nama: json['nama'],
      deskripsi: json['detail'],
      gambar: json['gambar'],
      judul: json['deskripsi'],
      waktubuka: json['waktubuka'],
      harga: json['harga'],
      kalori: json['kalori'],
      slider: List<String>.from(json['gambarlain']),
      bahan: List<Map<String, String>>.from(json["bahan"].map(
          (x) => Map.from(x).map((k, v) => MapEntry<String, String>(k, v)))),
    );
  }
}
