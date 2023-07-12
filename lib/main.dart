import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'member_home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'member_service.dart';
import 'team_service.dart';
import 'team_blog_service.dart';

late SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MemberService()),
        ChangeNotifierProvider(create: (context) => TeamService()),
        ChangeNotifierProvider(
            create: (context) => TeamBlogService()), // 팀블로그 멀티프로바이더 추가
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
