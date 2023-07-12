import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'member_service.dart';
import 'team_blog_detail.dart';
import 'team_blog_service.dart';
import 'package:url_launcher/url_launcher.dart';

import 'team_blog_view.dart';

class TeamBlog extends StatefulWidget {
  TeamBlog({super.key});

  /*String urlname = '';
  String urllink = '';*/

  @override
  State<TeamBlog> createState() => _TeamBlogState();
}

class _TeamBlogState extends State<TeamBlog> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TeamBlogService>(// Builder -> Consumer로 수정
        builder: (context, teamBlogService, child) {
      List<CommonUrl> commonUrlList = teamBlogService.commonUrlList;

      return Consumer<MemberService>(builder: (context, memberService, child) {
        List<Member> memberList = memberService.memberList; // memberList 불러오기

        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    // 위 아래 flex를 똑같이 주어서 컨테이너의 크기를 같게
                    Text(
                      '팀원 블로그 링크',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Divider(color: Colors.black),
                    Container(
                      width: double.infinity,
                      height: 300,
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
                                print('${member.name}의 블로그');
                              }
                            },
                            child: Text(member.name),
                          );
                        },
                      ),
                    ),
                    Divider(color: Colors.black),
                    Container(
                      width: double.infinity,
                      height: 400,
                      child: Column(
                        children: [
                          Text(
                            '공유하고 싶은 링크',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Divider(color: Colors.black),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => BlogcretePage(
                                    blogIdx:
                                        teamBlogService.commonUrlList.length -
                                            1,
                                    blogmode: true,
                                  ),
                                ),
                              );
                            },
                            icon: Icon(Icons.add),
                          ),
                          Divider(color: Colors.black),
                          TeamBlogView(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
    });
  }
}
