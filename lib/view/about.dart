import 'package:flutter/material.dart';

class About extends StatefulWidget {
  About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _HomePageState();
}

class _HomePageState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new_outlined),
              onPressed: () {
                Navigator.pop(context);
              }),
          backgroundColor: Color.fromARGB(255, 243, 22, 162),
          elevation: 0,
          title: const Text(
            'About',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontFamily: 'Poppins Bold',
              fontSize: 20,
            ),
          ),
        ),
        body: Material(
          color: Color.fromARGB(255, 252, 157, 217),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  child: Image.asset('assets/img/lip.png'),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  child: Text(
                    "Glamchic as a site that provides more than 1,000 catalogs of beauty products from local to international brands. Glamchic always provides accurate and safe information. You don't need to worry, because all the products in this catalog are guaranteed authentic and have been registered with BPOM.",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
