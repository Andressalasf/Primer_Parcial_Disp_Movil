import 'package:flutter/material.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  String _juegos = "Indie";
  bool _ltnmusic = false;
  bool _playvg = false;
  bool _sleep = false;
  bool _wttv = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Seleccione su tipo de juego favorito"),
            RadioListTile(
              title: Text("Indie"),
              value: "Indie",
              groupValue: _juegos,
              onChanged: (value) {
                setState(() {
                  _juegos = value ?? "";
                });
              },
            ),
            RadioListTile(
              title: Text("RPG"),
              value: "RPG",
              groupValue: _juegos,
              onChanged: (value) {
                setState(() {
                  _juegos = value ?? "";
                });
              },
            ),
            RadioListTile(
              title: Text("Mundo abierto"),
              value: "Mundo abierto",
              groupValue: _juegos,
              onChanged: (value) {
                setState(() {
                  _juegos = value ?? "";
                });
              },
            ),

            const Text("Seleccione que hobbies tiene"),
            CheckboxListTile(
              title: Text("Escuchar música"),
              value: _ltnmusic,
              onChanged: (value) {
                setState(() {
                  _ltnmusic = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text("Jugar videojuegos"),
              value: _playvg,
              onChanged: (value) {
                setState(() {
                  _playvg = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text("Dormir"),
              value: _sleep,
              onChanged: (value) {
                setState(() {
                  _sleep = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text("Ver televisión"),
              value: _wttv,
              onChanged: (value) {
                setState(() {
                  _wttv = value!;
                });
              },
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
    );
  }
}
