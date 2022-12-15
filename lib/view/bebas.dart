import 'package:flutter/material.dart';
import 'package:uts_mobile/homepage.dart';
import 'package:uts_mobile/loginpage.dart';
import 'package:uts_mobile/models/lipstick.dart';
import 'package:uts_mobile/view/about.dart';
import 'package:uts_mobile/view/detail.dart';
import '../service/lipstick_service.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'login.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 249, 92, 192),
        elevation: 0,
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins Bold',
            fontSize: 20,
          ),
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Image.asset(
              'assets/img/logo.png',
              height: 129,
              width: 175,
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => About(),
                    ));
              },
            ),
            // ListTile(
            //     leading: Icon(Icons.school),
            //     title: const Text('Teknik Arsitektur'),
            //     onTap: () {
            //       Navigator.of(context).pop();
            //       Navigator.of(context).push(new MaterialPageRoute(
            //           builder: (BuildContext context) => new homepage()));
            //     }),
            new Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<List<Data>>(
          future: RameneService.getDataRamen(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: Text('Sedang loading...'));
            } else {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Detail(
                                          lips: Data(
                                            id: int.parse(
                                                "${snapshot.data?[i].id}"),
                                            nama: "${snapshot.data?[i].nama}",
                                            deskripsi:
                                                "${snapshot.data?[i].deskripsi}",
                                            gambar:
                                                "${snapshot.data?[i].gambar}",
                                            harga: int.parse(
                                                "${snapshot.data?[i].harga}"),
                                          ),
                                        )));
                          },
                          child: Card(
                            color: Color.fromARGB(255, 254, 138, 211),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(),
                                    child: Container(
                                      height: 120,
                                      width: 170,
                                      // child: Image.asset(dataKopi[index].image,fit: BoxFit.contain,),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20)),
                                          // borderRadius: BorderRadius.circular(20),
                                          image: DecorationImage(
                                            image: NetworkImage(snapshot
                                                .data![i].gambar
                                                .toString()),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              snapshot.data![i].nama.toString(),
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 1,
                                          ),
                                          // Text(
                                          //     snapshot.data![i].kategori
                                          //         .toString(),
                                          //     style: TextStyle(
                                          //         fontSize: 8,
                                          //         fontWeight: FontWeight.bold,
                                          //         color: Colors.grey)),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                );
              }
            }
          },
        ),
      ),
      // bottomNavigationBar: ConvexAppBar(
      //   backgroundColor: Color.fromARGB(255, 243, 22, 162),
      //   items: [
      //     TabItem(icon: Icons.shopping_bag_rounded, title: 'Shop'),
      //     TabItem(icon: Icons.message_rounded, title: 'Message'),
      //     TabItem(icon: Icons.home_rounded, title: 'Home'),
      //     TabItem(icon: Icons.people_alt_rounded, title: 'About'),
      //     TabItem(icon: Icons.settings_rounded, title: 'Log'),
      //   ],
      //   initialActiveIndex: 2,
      // ),
    );
  }
}


// import 'package:flutter/material.dart';

// import '../models/ramene.dart';
// import '../service/ramene_service.dart';

// class Bebas extends StatefulWidget {
//   const Bebas({Key? key}) : super(key: key);

//   @override
//   State<Bebas> createState() => _BebasPageState();
// }

// class _BebasPageState extends State<Bebas> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Home", style: TextStyle(color: Colors.black)),
//         backgroundColor: Colors.white,
//       ),
//       body: Column(
//         children: [
//           FutureBuilder<List<Ramene>>(
//               future: RameneService.getDataRamen(),
//               builder: (BuildContext context, AsyncSnapshot snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: Text('Please wait its loading...'));
//                 } else {
//                   if (snapshot.hasError)
//                     return Center(child: Text('Error: ${snapshot.error}'));
//                   else
//                     return Expanded(
//                       child: ListView.builder(
//                           shrinkWrap: true,
//                           padding: EdgeInsets.all(10),
//                           itemCount: snapshot.data!.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             return ListTile(
//                               leading: CircleAvatar(
//                                 radius: 30,
//                                 backgroundImage:
//                                     NetworkImage(snapshot.data![index].img_url),
//                               ),
//                               title: Text(snapshot.data![index].product_name),
//                             );
//                           }),
//                     );
//                 }
//                 ;
//               }),
//         ],
//       ),
//     );
//   }
// }          
// //                       ],
                      
// //                         }
// //                         );
// //                 }

// //                 // return Center(
// //                 //     child: new Text(
// //                 //         '${snapshot.data}')); // snapshot.data  :- get your object which is pass from your downloadData() function
// //               }),
// //         ],
// //       ),
// //     );
// //   }
// // }