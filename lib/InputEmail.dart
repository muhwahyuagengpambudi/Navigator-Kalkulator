import 'package:flutter/material.dart';

class InputEmail extends StatefulWidget {
  const InputEmail({Key? key}) : super(key: key);

  @override
  State<InputEmail> createState() => _InputEmailState();
}

class _InputEmailState extends State<InputEmail> {
  TextEditingController ctrEmail = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Email "),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: ctrEmail,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Input Email",
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, ctrEmail.text);
                },
                child: Text("Simpan")),
          ],
        ),
      ),
    );
  }
}
