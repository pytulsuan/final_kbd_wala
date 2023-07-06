import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Users1 extends StatefulWidget {
  Users1({super.key});

  @override
  State<Users1> createState() => _Users1State();
}

class _Users1State extends State<Users1> {
  var db = FirebaseFirestore.instance;

  List<dynamic> name = [];

  List<dynamic> address = [];

  List<dynamic> mobile = [];

  List<dynamic> email = [];

  List<dynamic> waste = [];

  List<String> uid = [];

  void initState() {
    super.initState();
    fetchData();
  }

  Future fetchData() async {
    db.collection('users1').get().then((querySnapshot) async {
      for (var docSnapshot in querySnapshot.docs) {
        final docRef = db.collection("users1").doc(docSnapshot.id);
        docRef.get().then(
          (DocumentSnapshot doc) {
            final data = doc.data() as Map<String, dynamic>;
            print(data.values);
            uid.add(doc.id);
            data.forEach((key, value) {
              setState(() {
                if (key == 'name') {
                  name.add(value);
                } else if (key == 'mobile') {
                  mobile.add(value);
                } else if (key == 'address') {
                  address.add(value);
                } else if (key == 'email') {
                  email.add(value);
                } else if (key == 'waste') {
                  waste.add(value);
                }
              });
            });
          },
          onError: (e) => print("Error getting document: $e"),
        );
      }
      print(name + mobile + address);
    }).catchError((onError) => print(onError));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    fetchData();
                  });
        },

                child: Icon(Icons.refresh),
              )
              //ElevatedButton(onPressed: ListView.builder(, child:)
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: name.length,
          itemBuilder: (context, index) {
            final item = name[index];

            return Card(
              child: ListTile(
                  title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Name: " + name[index]),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Address: " + address[index]),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Waste Type: " + waste[index]),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Phone Number: " + mobile[index]),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Email Id: " + email[index]),
                  ),
                  IconButton(
                      onPressed: () {
                        print(index);
                        db.collection('users1').doc(uid[index]).delete();
                        name.remove(name[index]);
                        address.remove(address[index]);
                        mobile.remove(mobile[index]);
                        waste.remove(waste[index]);
                        email.remove(email[index]);
                      },
                      icon: Icon(
                        Icons.delete,
                      ))
                ],
              )),
            );
          },
        ));
  }
}
