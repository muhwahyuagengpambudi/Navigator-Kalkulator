import 'package:flutter/material.dart';
import 'package:flutter_application_1/Kalkulator.dart';
import 'package:flutter_application_1/InputEmail.dart';

class registrasi extends StatefulWidget {
  const registrasi({Key? key}) : super(key: key);

  @override
  _RegistrasiState createState() => _RegistrasiState();
}

class _RegistrasiState extends State<registrasi> {
  TextEditingController CtrNamaLengkap = new TextEditingController();
  TextEditingController CtrNamaPanggilan = new TextEditingController();
  String myEmail = "email";

  Widget TxtInput(String Username, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: Username,
      ),
    );
  }

  Widget btnRegister(String text) {
    return Container(
      width: 150,
      child: ElevatedButton(
          onPressed: () {
            if (CtrNamaPanggilan.text == "" || CtrNamaLengkap == "") {
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Kalkulator(
                            name: CtrNamaPanggilan.text,
                            email: myEmail,
                          )));
            }
          },
          child: Text(text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registrasi")),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            TxtInput("NamaLengkap", CtrNamaLengkap),
            SizedBox(
              height: 10,
            ),
            TxtInput("NamaPanggilan", CtrNamaPanggilan),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 250,
                child: TextField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.tealAccent,
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: myEmail,
                    labelStyle: TextStyle(color: Colors.green),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InputEmail()),
                );
                setState(() {
                  myEmail = result.toString();
                });
              },
              child: Text("Masukan Email Anda"),
            ),
            btnRegister("Masuk")
          ],
        ),
      ),
    );
  }
}
