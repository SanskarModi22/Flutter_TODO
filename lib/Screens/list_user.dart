import 'package:flutter/material.dart';

class ListUser extends StatefulWidget {
  ListUser({Key? key}) : super(key: key);

  @override
  _ListUserState createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  @override
  Widget build(BuildContext context) {
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
                        onPressed: () => {},
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
          ],
        ),
      ),
    );
  }
}
