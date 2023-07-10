import 'package:assignment11/team_blog.dart';
import 'package:assignment11/team_intro.dart';
import 'package:assignment11/team_mbti.dart';
import 'package:assignment11/team_strength.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'member_detail.dart';
import 'member_service.dart';
import 'member_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MemberService>(
      builder: (context, memberService, child) {
        print('Consumer build');
        // memoService로 부터 memoList 가져오기

        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 300,
                      height: 100,
                      //margin: const EdgeInsets.all(30.0),
                      //padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: SizedBox(
                              width: 250,
                              height: 50,
                              child: ElevatedButton(
                                child: Text("팀 소개"),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => TeamIntro(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 400,
                      //margin: const EdgeInsets.all(30.0),
                      //padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: SizedBox(
                              width: 250,
                              height: 50,
                              child: ElevatedButton(
                                child: Text("팀 블로그"),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => TeamBlog()
                                      ,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Center(
                    child: Container(
                      width: 400,
                      //margin: const EdgeInsets.all(30.0),
                      //padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: SizedBox(
                              width: 250,
                              height: 50,
                              child: ElevatedButton(
                                child: Text("팀 MBTI"),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => TeamMbti()
                                      ,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Center(
                    child: Container(
                      width: 400,
                      //margin: const EdgeInsets.all(30.0),
                      //padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: SizedBox(
                              width: 250,
                              height: 50,
                              child: ElevatedButton(
                                child: Text("팀 장점"),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => TeamStrength()
                                      ,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),

                  MemberView(),
                  SizedBox(height: 30,),
                  Center(
                    child: Container(
                      width: 400,
                      //margin: const EdgeInsets.all(30.0),
                      //padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: SizedBox(
                              width: 250,
                              height: 50,
                              child: ElevatedButton(
                                child: Text("멤버등록"),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ConcretePage(
                                        index:
                                        memberService.memberList.length - 1,
                                        mode: true,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
