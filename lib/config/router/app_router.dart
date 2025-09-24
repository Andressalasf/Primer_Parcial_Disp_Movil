
import 'package:flutter/widgets.dart';

class AppRouter {

   final String path;
   final String title;
   final String description;
   final IconData icon;
   final WidgetBuilder context;

  const AppRouter({
      required this.path,
      required this.title,
      required this.description,
      required this.icon,
      required this.context
  });

}