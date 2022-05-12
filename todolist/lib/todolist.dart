library todolist;

import 'package:flutter/material.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  late String value;

  var listTODO = [''];

  addToDO(String item) {
    setState(() {
      listTODO.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("TODO APP"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            addToDO(value);
          },
        ),
        body: ListView.builder(
            itemCount: listTODO.length,
            itemBuilder: (context, index) {
              return index == 0
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        decoration: const InputDecoration(hintText: "Add Item"),
                        onChanged: (val) {
                          value = val;
                        },
                      ),
                    )
                  : ListTile(
                      leading: const Icon(Icons.work),
                      title: Text(
                        listTODO[index],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    );
            }));
  }
}
