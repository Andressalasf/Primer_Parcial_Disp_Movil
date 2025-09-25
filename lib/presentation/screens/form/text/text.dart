import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextScreen extends StatefulWidget {
  const TextScreen({super.key});

  @override
  State<TextScreen> createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  void send() {
    print(_nameController.text);
    print(_lastnameController.text);
  }

  final _formkey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "Digite Nombre",
                    icon: Icon(Icons.account_circle_outlined),
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: _lastnameController,
                  decoration: InputDecoration(
                    labelText: "Digite Apellido",
                    icon: Icon(Icons.account_circle_outlined),
                  ),
                ),
                const SizedBox(height: 20, child: Text("")),

                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Enviar"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
