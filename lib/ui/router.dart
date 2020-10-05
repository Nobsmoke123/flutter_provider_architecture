import 'package:flutter/material.dart';
import 'package:provider_architecture/core/models/post.dart';
import 'package:provider_architecture/ui/views/home_screen.dart';
import 'package:provider_architecture/ui/views/login_screen.dart';
import 'package:provider_architecture/ui/views/post_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/' :
          return MaterialPageRoute(builder: (_) => HomeView());
      case '/login':
          return MaterialPageRoute(builder: (_) => LoginView());
      case '/post':
          var posts = settings.arguments as Post;
          return MaterialPageRoute(builder: (_) => PostView(post: posts,));
      default:
          return MaterialPageRoute(builder: (_) => Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          ));
    }
  }
}