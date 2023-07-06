import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_kbd_wala/homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'firebase_options.dart';
import 'myPage.dart';

final db = FirebaseFirestore.instance;

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp() );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PROFILE LIST',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //_MyHomePageState({super.key});
  //   with SingleTickerProviderStateMixin {
  //late TabController controller;

  //get documentId => null;
  //TabController controller = new TabController(length: 4, initialIndex: 0, vsync: this);

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //     SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.green));
    // return Scaffold(
    //   appBar: AppBar(
    //       title: TabBar(
    //     indicator: UnderlineTabIndicator(
    //       insets: EdgeInsets.symmetric(horizontal: 16.0),
    //     ),
    //     controller: controller,
    //     labelColor: Colors.white,
    //     unselectedLabelColor: Colors.white,
    //     tabs: <Widget>[
    //       Tab(icon: Icon(Icons.person_add)),
    //       Tab(icon: Icon(Icons.notifications)),
    //     ],
    //   )),
    //   body: TabBarView(
    //     controller: controller,
    //     children: [
    //       HomePage(),
    //       Users1(),
    //     ],
    //   ),
    // );
    return Scaffold(
        appBar: AppBar(
          title: Text('Kabaadiwala'),
        ),
        body: Center(child: HomePage()));
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var myformkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final wasteController = TextEditingController();
  final addController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          key: myformkey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      labelText: "Name",
                      hintText: "Enter Your Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.only())),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: mobileController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Number';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      labelText: "Mobile",
                      hintText: "Enter Your Number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.only())),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Email';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      labelText: "Email",
                      hintText: "Enter Your Email Address",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.only())),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: wasteController,
                  keyboardType: TextInputType.streetAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the type of waste';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      labelText: "Type of Waste",
                      hintText: "ex: papers, wood, irons, etc",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.only())),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: addController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Full Address';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      labelText: "Address",
                      hintText: "Full Address",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.only())),
                ),
              ),
              FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                final data = <String, dynamic>{
                  "name": nameController.text,
                  "email": emailController.text,
                  "mobile": mobileController.text,
                  "waste": wasteController.text,
                  "address": addController.text,
                };

                db
                    .collection("users1")
                    .add(data)
                    .then((value) => debugPrint(value.id + value.path));

                if (myformkey.currentState?.validate() != null &&
                    myformkey.currentState?.validate() == true) {}

                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                          title: const Text('Registered'),
                          content: SizedBox(
                              height: 60,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                            "Your complain has been registered"),
                                      ],
                                    )
                                  ])));
                    });
              }

              ),
              FloatingActionButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Users1()
                )
                );
              },
                child: Icon(Icons.remove_red_eye_rounded),
              )
            ],
          ),
        ),
      ),
    );
  }
}
