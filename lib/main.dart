import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.red,
      accentColor: Colors.blue),
    home: MyApp(),
  ),);
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List todos = [];
  String? input;

  // initstate
  @override
  void initState() {
    super.initState();
    todos.add("exampe Items");
    todos.add("Todo Number 2");
    todos.add("Todos 3");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List App"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                ),
              title: Text("Add Todo List"),
              content: TextField(
                onChanged: (String value) {
                  input = value;
                },
              ),
              actions: <Widget> [
                TextButton(onPressed: () {
                  setState(() {
                    todos.add(input);
                  });
                  Navigator.of(context).pop();
                }, child: Text("Add"))
              ],
            );
          });
        },
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(key: Key(todos[index]),
          child: Card(
            margin: EdgeInsets.all(5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)),
            child: ListTile(
              title: Text(todos[index]),
              trailing: IconButton(icon: Icon(Icons.delete, color: Colors.red,),
              onPressed: () {
                setState(() {
                  todos.remove(index);
                });
              },
              ),
              ),
          ));
        }),
    );
  }
}