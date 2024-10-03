import 'dart:async';

import 'package:ai_chat/ai_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, bool>> messages = [];
  loadData(String prompt) async {
    var res = await Prompeting(prompt);

    setState(() {
      messages.addAll([
        {res: false}
      ]);
    });
  }

  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GEMINI AI CHAT "),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return Container(
                // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: messages[index].entries.last.value
                    ? EdgeInsets.fromLTRB(20, 10, 100, 10)
                    : EdgeInsets.fromLTRB(100, 10, 20, 10),
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: messages[index].entries.last.value
                        ? Colors.grey
                        : Colors.green),
                child: ListTile(
                  title: Text(messages[index].entries.first.key),
                ),
              );
            }),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.grey[300],
        height: 100,
        child: Center(
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      setState(() {
                        messages.addAll([
                          {_controller.text: true}
                        ]);

                        loadData(_controller.text);
                      });

                      _controller.clear();
                    }),
                hintText: 'Enter your massage here',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
        ),
      ),
    );
  }
}
