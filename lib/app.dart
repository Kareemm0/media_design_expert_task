import 'package:flutter/material.dart';
import 'package:media_design_expert_task/core/app/app_routing.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Public Sans"),
      routerConfig: router,
    );
  }
}
