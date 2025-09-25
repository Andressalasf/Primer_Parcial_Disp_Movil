import 'package:flutter/material.dart';
import 'package:primer_parcial_disp_moviles/presentation/screens/screen.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final List<Widget> _elementos = <Widget>[TextScreen(), RadioScreen()];
  int _indicador = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Page", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigo,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: _elementos[_indicador],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indicador,
        onTap: (value) {
          setState(() {
            _indicador = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.telegram), label: "text"),
          BottomNavigationBarItem(icon: Icon(Icons.radar), label: "radio"),
        ],
      ),
    );
  }
}
