import 'package:primer_parcial_disp_moviles/config/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:primer_parcial_disp_moviles/presentation/screens/screen.dart';

class Routers {
  static final List<AppRouter> pages = [
    AppRouter(
      path: "/",
      title: "Home",
      description: "Home page",
      icon: Icons.home,
      context: (context) => const HomeScreen(),
    ),
    AppRouter(
      path: "form",
      title: "Form",
      description: "Form page",
      icon: Icons.note_alt,
      context: (context) => const FormScreen(),
    ),
    AppRouter(
      path: "peticion",
      title: "Peticion",
      description: "Peticion page",
      icon: Icons.request_page,
      context: (context) => const PeticionScreen(),
    ),
  ];

  static router() => {for (var page in pages) page.path: page.context};
}
