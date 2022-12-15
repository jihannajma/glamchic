import 'package:flutter/material.dart';

class homepage2 extends StatelessWidget {
  const homepage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> daftarfilm = [
      {
        "nama": "All The Bright Places",
        "gambar": "assets/img/bright.jpg",
      },
      {"nama": "Civil War", "gambar": "assets/img/civilwar.jpg"},
      {"nama": "Now You See Me", "gambar": "assets/img/nysm.jpg"},
      {"nama": "Oceans 8", "gambar": "assets/img/oceans.jpg"},
      {"nama": "Pride & Prejudice", "gambar": "assets/img/pride.jpg"},
      {"nama": "Shawshank", "gambar": "assets/img/shaw.jpg"},
      {"nama": "Cinderella", "gambar": "assets/img/cinder.jpg"},
      {"nama": "Cruella", "gambar": "assets/img/cruella.jpg"},
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Now Showing',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 42, 36, 219),
        actions: [
          IconButton(
            icon: new Icon(Icons.logout_rounded),
            onPressed: () {
              print('Telah Logout');
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
            crossAxisCount: 3,
            children: daftarfilm
                .map((e) => Card(
                      child: Column(
                        children: [
                          Image.asset(e['gambar'], height: 159, width: 130),
                          Text(
                            e['nama'],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ))
                .toList()),
      ),
    );
  }
}
