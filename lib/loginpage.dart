import 'package:flutter/material.dart';
import 'package:uts_mobile/homepage2.dart';

import 'homepage.dart';

class loginpage extends StatelessWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController pwdController = TextEditingController();

    var email = "najmajihan@gmail.com";
    var pwd = "britishman";

    return Scaffold(
      // backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //HELLO SNEAKY TEXT
              SizedBox(
                height: 25,
              ),
              Text(
                'Courts Movie Theater',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 42, 36, 219),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Find now showing movies in one screen!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                height: 20,
              ),

              // IMAGE
              Image.asset(
                'assets/img/bioskop.jpg',
                height: 298,
                width: 298,
              ),

              //EMAIL FIELD
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Email'),
                      ),
                    )),
              ),
              SizedBox(
                height: 10,
              ),

              //PW FIELD
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: pwdController,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Password'),
                      ),
                    )),
              ),
              SizedBox(
                height: 10,
              ),

              SizedBox(
                height: 55,
                width: 355,
                child: ElevatedButton(
                  child: Text(
                    'Sign In',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    primary: Color.fromARGB(255, 42, 36, 219),
                  ),
                  onPressed: () {
                    if (emailController.text == email) {
                      if (pwdController.text == pwd) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => homepage2()));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Password Salah'),
                        ));
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Email Salah'),
                      ));
                    }
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => homepage2()));
                    print('Login Berhasil');
                  },
                ),
              ),

              // Tulisan Register
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'I dont have account yet',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Color.fromARGB(255, 42, 36, 219),
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    print('Daftar Terpencet');
                  },
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
