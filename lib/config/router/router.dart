
import 'package:primer_parcial_disp_moviles/config/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:primer_parcial_disp_moviles/presentation/screens/home/home.dart';
class Routers{

    static final List<AppRouter> pages = [

        AppRouter(path: "/",
          title: "Home",
          description: "Home page",
          icon: Icons.home,
          context: (context) => const HomeScreen()
          ),

    ];

  static router() => { for (var page in pages) page.path: page.context}; 
}