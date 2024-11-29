import 'package:flutter/material.dart';
import 'package:media_design_expert_task/di.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencyInjection();
  runApp(const MyApp());
}
