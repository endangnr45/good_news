import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Edit_Profil_Page extends StatefulWidget {
  const Edit_Profil_Page({Key? key}) : super(key: key);
  static const routeName = "/edit-profile";

  @override
  State<Edit_Profil_Page> createState() => _Edit_Profil_PageState();
}

class _Edit_Profil_PageState extends State<Edit_Profil_Page> {
  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Edit Profile",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Alata Reguler',
                )),
            backgroundColor: Color.fromARGB(255, 17, 156, 89),
            leading: IconButton(
              icon: new Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            // Icon(
            //   Icons.arrow_back,
            //   color: Colors.white,
            // ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.save,
                  color: Colors.white,
                ),
                alignment: Alignment.centerLeft,
                onPressed: () {
                  // do something
                },
              ),
            ],
          ),
          body: ListView(
            children: //<Widget>
                [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
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
                                child: GestureDetector(
                                  onTap: () => pickImage(),
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 15.0,
                                    color: Color(0xFF404040),
                                  ),
                                ),
                              )),
                          radius: 38.0,
                          backgroundImage: AssetImage('assets/images/user.png'),
                          // backgroundImage: image != null
                          //     ? Image.file(
                          //         image!,
                          //         width: 160,
                          //         height: 160,
                          //         fit: BoxFit.cover,
                          //       ) as ImageProvider
                          //     : AssetImage('assets/images/user.png'),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Text(
                          'Nama User',
                          style: TextStyle(
                            fontFamily: 'Alata Reguler',
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
                            fontFamily: 'Alata Reguler',
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                height: 170,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 17, 156, 89),
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                ),
              ),
              // Container(
              // height: 150,
              // decoration: BoxDecoration(
              //   color: Color.fromARGB(255, 17, 156, 89),
              //   borderRadius: BorderRadius.all(Radius.circular(3)),
              // ),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: <Widget>[
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceAround,
              //         children: <Widget>[
              //           CircleAvatar(
              //             backgroundColor: Colors.grey,
              //             minRadius: 60.0,
              //             child: CircleAvatar(
              //               backgroundColor: Colors.grey,
              //               radius: 50.0,
              //               child: Image.asset('assets/images/user.png',
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //       // Column(
              //       //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //       //   children: <Widget>[
              //       //     CircleAvatar(
              //       //       backgroundColor: Colors.amber,
              //       //       minRadius: 20.0,
              //       //       child: Icon(Icons.edit),
              //       //     ),
              //       //   ],
              //       // ),
              //     ],
              //   ),
              // ),
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Nama Lengkap",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          style: TextStyle(
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.start,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: "Endang Nurjanah",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                              borderRadius: BorderRadius.circular(
                                15,
                              ),
                            ),
                            fillColor: Color(
                              0xfff3f3f4,
                            ),
                            filled: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Username",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          style: TextStyle(
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.start,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: "user123",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                              borderRadius: BorderRadius.circular(
                                15,
                              ),
                            ),
                            fillColor: Color(
                              0xfff3f3f4,
                            ),
                            filled: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Email",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          style: TextStyle(
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.start,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: "email@gmail.com",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(
                                15,
                              ),
                            ),
                            fillColor: Color(
                              0xfff3f3f4,
                            ),
                            filled: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // color: Colors.blue,
                    margin: EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "No HP",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          style: TextStyle(
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.start,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: "08xxxxxxxx",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(
                                15,
                              ),
                            ),
                            fillColor: Color(
                              0xfff3f3f4,
                            ),
                            filled: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
