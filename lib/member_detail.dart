import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'member_service.dart';

class ConcretePage extends StatefulWidget {
  ConcretePage({super.key, required this.index, required this.mode});

  final int index;
  final bool mode; // true : 저장하기, false : 수정하기
  String _name = '';
  String _mbti = '';
  String _merit = '';
  String _style = '';
  String _blog = '';
  @override
  State<ConcretePage> createState() => _ConcretePageState();
}

class _ConcretePageState extends State<ConcretePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mbtiController = TextEditingController();
  TextEditingController meritController = TextEditingController();
  TextEditingController styleController = TextEditingController();
  TextEditingController blogController = TextEditingController();

  int count = 0;

  @override
  Widget build(BuildContext context) {
    MemberService memberService = context.read<MemberService>();
    Member member;

    if (!widget.mode && count < 1) {
      member = memberService.memberList[widget.index];
      nameController.text = member.name;
      mbtiController.text = member.mbti;
      meritController.text = member.merit;
      styleController.text = member.style;
      blogController.text = member.blog;
      widget._name = member.name;
      widget._mbti = member.mbti;
      widget._merit = member.merit;
      widget._style = member.style;
      widget._blog = member.blog;
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          widget.mode
              ? Text('')
              : IconButton(
                  onPressed: () {
                    showDelDialog(context, memberService);
                  },
                  icon: Icon(Icons.delete),
                ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [SizedBox(width: 30,),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text("    이름",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Container(
                      width: 140,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.lightBlue),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: "이름",
                            border: InputBorder.none,
                          ),
                          autofocus: true,
                          maxLines: null,
                          expands: true,
                          keyboardType: TextInputType.multiline,
                          onChanged: (value) {
                            widget._name = value; // 텍스트필드 안의 값이 변할 때
                          },
                        ),
                      ),
                    ),
                  ]),
                SizedBox(width : 20,),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text("    MBTI",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Container(
                        width: 140,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.lightBlue),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: TextField(
                            controller: mbtiController,
                            decoration: InputDecoration(
                              hintText: "MBTI",
                              border: InputBorder.none,
                            ),
                            autofocus: true,
                            maxLines: null,
                            expands: true,
                            keyboardType: TextInputType.multiline,
                            onChanged: (value) {
                              widget._mbti = value; // 텍스트필드 안의 값이 변할 때
                            },
                          ),
                        ),
                      ),
                    ]),
              ],
            ),

            SizedBox(height: 20),
            Text("          나의 장점",
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Center(
              child: Container(
                width: 300,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.lightBlue),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: meritController,
                    decoration: InputDecoration(
                      hintText: "나의 장점을 입력 해주세요.",
                      border: InputBorder.none,
                    ),
                    autofocus: true,
                    maxLines: null,
                    expands: true,
                    keyboardType: TextInputType.multiline,
                    onChanged: (value) {
                      widget._merit = value; // 텍스트필드 안의 값이 변할 때
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("          나의 협업 스타일",
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Center(
              child: Container(
                width: 300,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.lightBlue),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: styleController,
                    decoration: InputDecoration(
                      hintText: "나의 협업 스타일을 입력해주세요.",
                      border: InputBorder.none,
                    ),
                    autofocus: true,
                    maxLines: null,
                    expands: true,
                    keyboardType: TextInputType.multiline,
                    onChanged: (value) {
                      // 텍스트필드 안의 값이 변할 때
                      widget._style = value;
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("          BLOG",
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Center(
              child: Container(
                width: 300,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.lightBlue),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: blogController,
                    decoration: InputDecoration(
                      hintText: "블로그를 입력 해주세요.",
                      border: InputBorder.none,
                    ),
                    autofocus: true,
                    maxLines: null,
                    expands: true,
                    keyboardType: TextInputType.multiline,
                    onChanged: (value) {
                      widget._blog = value; // 텍스트필드 안의 값이 변할 때
                    },
                  ),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child: widget.mode
                    ? IconButton(
                        onPressed: () {

                          if (widget._name.isNotEmpty
                              && widget._mbti.isNotEmpty
                              && widget._merit.isNotEmpty
                              && widget._style.isNotEmpty
                              && widget._blog.isNotEmpty) {
                            memberService.createMember(
                                name: widget._name,
                                mbti: widget._mbti,
                                merit: widget._merit,
                                style: widget._style,
                                blog: widget._blog,);
                            Navigator.pop(context);
                          }
                          else {
                            showWarnDialog(context);
                          }
                        },
                        icon: Icon(Icons.save))
                    : IconButton(
                        onPressed: () {
                          if (widget._name.isNotEmpty
                              && widget._mbti.isNotEmpty
                              && widget._merit.isNotEmpty
                              && widget._style.isNotEmpty
                              && widget._blog.isNotEmpty) {
                            memberService.updateMember(
                              index: widget.index,
                              name: widget._name,
                              mbti: widget._mbti,
                              merit: widget._merit,
                              style: widget._style,
                              blog: widget._blog,);
                              Navigator.pop(context);
                          }
                          else {
                            showWarnDialog(context);
                          }
                        },
                        icon: Icon(Icons.save),
                      ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  void showDelDialog(BuildContext context, MemberService memberService) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("정말로 삭제하시겠습니까?"),
          actions: [
            // 취소 버튼
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("취소"),
            ),
            // 확인 버튼
            TextButton(
              onPressed: () {
                memberService.deleteMember(index: widget.index);
                Navigator.pop(context); // 팝업 닫기
                Navigator.pop(context); // HomePage 로 가기
              },
              child: Text(
                "확인",
                style: TextStyle(color: Colors.pink),
              ),
            ),
          ],
        );
      },
    );
  }

  void showWarnDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("빈칸을 채워주세요."),
          actions: [
            // 취소 버튼
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("확인"),
            ),
            // 확인 버튼
          ],
        );
      },
    );
  }
}
