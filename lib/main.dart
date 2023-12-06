import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_prestapyme/src/data/apis/get_articles_service.dart';
import 'package:test_prestapyme/src/domain/controllers/quoter_controller.dart';
import 'package:test_prestapyme/src/ui/menu/pages/menu_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>  QuoterController()),
        ChangeNotifierProvider(create: (_)=>  GetArticlesService()),
      ],
      child: const MaterialApp(
        title: 'Test App',
        debugShowCheckedModeBanner: false,
        home: MenuPage()
      ),
    );
  }
}