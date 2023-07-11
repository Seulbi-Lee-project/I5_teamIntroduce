import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'member_detail.dart';
import 'member_service.dart';
import 'member_view.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamBlog extends StatefulWidget {
  const TeamBlog({super.key});

  @override
  State<TeamBlog> createState() => _TeamBlogState();
}

// final List<String> entries = <String>['A', 'B', 'C'];

class _TeamBlogState extends State<TeamBlog> {
  @override
  Widget build(BuildContext context) {
    //
    return Consumer<MemberService>(builder: (context, memberService, child) {
      List<Member> memberList = memberService.memberList; // memberList 불러오기

      return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: memberList.length,
                itemBuilder: (BuildContext ctx, int index) {
                  Member member = memberList[index];

                  return ElevatedButton(
                    onPressed: () async {
                      final url = Uri.parse(member.blog);
                      if (await canLaunchUrl(url)) {
                        launchUrl(url);
                      } else {
                        // ignore: avoid_print
                        print(member.blog);
                      }
                    },
                    child: Text(member.name),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
