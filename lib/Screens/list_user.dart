import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListUser extends StatefulWidget {
  ListUser({Key? key}) : super(key: key);

  @override
  _ListUserState createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot?> snapshot) {
          final List storedocs =[];
          snapshot.data?.docs.map((DocumentSnapshot doc) {
            Map? fbData = doc.data()
                as Map<String, dynamic>; //Here we have to tell the app
            //that the data is in String,dynamic format
            storedocs.add(fbData); //Adding data to the list
          }).toList(); //So that it is not null
          if (snapshot.hasError) {
            print('Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Table(
                  border: TableBorder.all(),
                  columnWidths: const <int, TableColumnWidth>{
                    1: FixedColumnWidth(140),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(
                      children: [
                        TableCell(
                          child: Container(
                            color: Colors.greenAccent,
                            child: Center(
                              child: Text(
                                'Name',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            color: Colors.greenAccent,
                            child: Center(
                              child: Text(
                                'Email',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            color: Colors.greenAccent,
                            child: Center(
                              child: Text(
                                'Action',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Center(
                              child: Text("Sanskar Modi",
                                  style: TextStyle(fontSize: 18.0))),
                        ),
                        TableCell(
                          child: Center(
                              child: Text("modisanskar5@gmail.com",
                                  style: TextStyle(fontSize: 18.0))),
                        ),
                        TableCell(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () => {},
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.orange,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  print(storedocs);
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    for (var i = 0; i < storedocs.length; i++) ...[
                      TableRow(
                        children: [
                          TableCell(
                            child: Center(
                                child: Text(storedocs[i]['Name']??'Sanskar',
                                    style: TextStyle(fontSize: 18.0))),
                          ),
                          TableCell(
                            child: Center(
                                child: Text(storedocs[i]?['email']??'tyrtyrtyt',
                                    style: TextStyle(fontSize: 18.0))),
                          ),
                          TableCell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () => {},
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.orange,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    print(storedocs);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]
                  ],
                ),
              ),
            );
          }
        });
  }
}
