import 'package:assignment11/team_modify.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'member_detail.dart';
import 'member_service.dart';
import 'member_view.dart';
import 'team_service.dart';

class TeamIntro extends StatefulWidget {
  @override
  _TeamIntroState createState() => _TeamIntroState();
}

class _TeamIntroState extends State<TeamIntro> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TeamService>(builder: (context, teamService, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('팀 소개'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('우리 팀 특징'),
                TextField(
                  readOnly: true,
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 40.0, horizontal: 45.0),
                  ),
                  controller:
                      TextEditingController(text: teamService.team.character),
                ),
                SizedBox(height: 30.0),
                Text('우리 팀 목표'),
                TextField(
                  readOnly: true,
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 40.0, horizontal: 45.0),
                  ),
                  controller:
                      TextEditingController(text: teamService.team.goal),
                ),
                SizedBox(height: 30.0),
                Text('우리 팀 약속'),
                TextField(
                  readOnly: true,
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 40.0, horizontal: 45.0),
                  ),
                  controller:
                      TextEditingController(text: teamService.team.promise),
                ),
                SizedBox(height: 30.0),
                ElevatedButton(
                  child: Text('수정하기'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => TeamModify()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
