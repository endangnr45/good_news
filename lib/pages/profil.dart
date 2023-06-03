import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:good_news/pages/auth_page.dart';
import 'package:good_news/pages/edit_profil.dart';

class Profil_Page extends StatefulWidget {
  const Profil_Page({Key? key}) : super(key: key);
  static const routeName = "/profile";

  @override
  State<Profil_Page> createState() => _Profil_PageState();
}

class _Profil_PageState extends State<Profil_Page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Profile",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 31,
                  // fontFamily: 'Alata Reguler',
                )),
            backgroundColor: Color.fromARGB(255, 17, 156, 89),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                alignment: Alignment.centerLeft,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => LoginPage())));
                },
                
              ),
            ],
          ),
          body: ListView(
            children: <Widget>[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      child: CircleAvatar(
                        radius: 40.0,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 12.0,
                              child: Icon(
                                Icons.camera_alt,
                                size: 15.0,
                                color: Color(0xFF404040),
                              ),
                            ),
                          ),
                          radius: 38.0,
                          backgroundImage: AssetImage('assets/images/user.png'),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Text(
                          'Nama User',
                          style: TextStyle(
                            // fontFamily: 'Alata Reguler',
                            fontWeight: FontWeight.w700,
                            fontSize: 24.0,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          '0812xxxxxxxx',
                          style: TextStyle(
                            // fontFamily: 'Alata Reguler',
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => Edit_Profil_Page())));
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            child: Text(
                              'Edit Profile',
                              style: TextStyle(
                                // fontFamily: 'Alata Reguler',
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 17, 156, 89),
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Email',
                        style: TextStyle(
                          color: Color.fromARGB(255, 17, 156, 89),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'email@gmail.com',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    // SizedBox(height: 40),
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.of(context).push(MaterialPageRoute(
                    //         builder: ((context) => Login_Page())));
                    //   },
                    //   child: Text(
                    //     'Logout',
                    //     style: TextStyle(
                    //       color: Color.fromARGB(255, 188, 7, 7),
                    //       fontSize: 17,
                    //       fontWeight: FontWeight.w600,
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
