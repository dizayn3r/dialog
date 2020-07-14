import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dialog/router.dart';
import 'app.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => Router()),
      ],
      child: const App(),
    ),
  );
}
