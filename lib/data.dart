import 'package:flutter/material.dart';
import 'dart:convert';
import 'api.dart';
import 'user.dart';

class DataList extends StatefulWidget {
  @override
  createState() => _DataListState(); 
}

class _DataListState extends State {
  var users = new List<User>();

  initState() {
    super.initState();
    _getUsers();
  }

  dispose() {
    super.dispose();
  }

  _getUsers() {
    API.getUsers().then((response) {
      setState((){
        Iterable list = json.decode(response.body);
        users = list.map((item) => User.fromJson(item)).toList();
      });
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data List"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(width: MediaQuery.of(context).size.width),
          child: DataTable(
            columns: <DataColumn>[
              DataColumn(label: Text("Name")),
              DataColumn(label: Text("Role"))
            ],
            rows: List<DataRow>.generate(
              users.length,
              (index) => DataRow(
                color: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected))
                      return Theme.of(context).colorScheme.primary.withOpacity(0.08);
                      
                    if (index % 2 == 0) 
                      return Colors.grey.withOpacity(0.3);
                    
                    return null; 
                  }
                ),
                cells: <DataCell>[
                  DataCell(Text(users[index].name)),
                  DataCell(Text(users[index].role))
                ]
              )
            )
          )
        )
      )
    );
  }
}
