import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'member_detail.dart';
import 'member_service.dart';
import 'member_view.dart';

class TeamStrength extends StatelessWidget {
  const TeamStrength({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Text("Team Intro"))
    );
  }
}