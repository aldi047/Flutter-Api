import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:studi_kasus_2/HttpHelper.dart';
import 'list_item.dart';
import 'makanan.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Makanan>> futuremakanan;
  HttpHelper api = HttpHelper();
  Future<List<Makanan>> fetchmakanan() async {
    final response = await api.getAPI();

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      // print(jsonResponse);
      return jsonResponse
          .map((makanan) => new Makanan.fromJson(makanan))
          .toList();
    } else {
      throw Exception();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futuremakanan = fetchmakanan();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder<List<Makanan>>(
      future: futuremakanan,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) {
                var makanan = (snapshot.data as List<Makanan>)[index];
                return ListItem(
                  makanan: makanan,
                  api: api,
                );
              },
              itemCount: (snapshot.data as List<Makanan>).length);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    ));
  }
}
