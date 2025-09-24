import 'package:flutter/material.dart';
import 'package:primer_parcial_disp_moviles/config/router/router.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
        Center(
          child: Text("Home page", style: TextStyle(color: Colors.white, ),)),
         backgroundColor: Colors.indigo,
         //Cambiar el color de la hamburguesa
         iconTheme: IconThemeData(color: Colors.white),
         
         ),


      drawer: Drawer(backgroundColor: Colors.white, shadowColor: Colors.black,
          child: ListView(
              children: [

                ...Routers.pages.map((res){

                    return ListTile(
                      title: Text(res.title),
                      subtitle: Text(res.description),
                      onTap: () {
                        Navigator.pushNamed(context, res.path);
                      },
                      leading: Icon(res.icon, color: Colors.indigo,),

                    );
                })
              ],
          ),
      ),
      body: Center(
        child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("Andres Felipe Salas - 192164", style: TextStyle(fontSize: 20, color: Colors.indigo),),
            SizedBox(height: 15,),
            Text("Brian Matheo Alvarez -192219", style: TextStyle(fontSize: 20, color: Colors.indigo),),
            SizedBox(height: 15,),
            Text("Programacion de dispositivos moviles", style: TextStyle(fontSize: 20, color: Colors.indigo),)


      ])),
    );
  }
}
