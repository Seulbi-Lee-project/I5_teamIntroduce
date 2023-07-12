import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'team_blog_service.dart';

class BlogcretePage extends StatefulWidget {
  BlogcretePage({super.key, required this.blogIdx, required this.blogmode});

  final int blogIdx;
  final bool blogmode; // true : 저장하기, false : 수정하기
  String urlname = '';
  String urllink = '';

  @override
  State<BlogcretePage> createState() => BlogcretePageState();
}

class BlogcretePageState extends State<BlogcretePage> {
  TextEditingController urlnameController = TextEditingController();
  TextEditingController urllinkController = TextEditingController();

  int count = 0;

  @override
  Widget build(BuildContext blogcontext) {
    TeamBlogService teamBlogService = blogcontext.read<TeamBlogService>();
    CommonUrl commonUrl;

    if (!widget.blogmode && count < 1) {
      commonUrl = teamBlogService.commonUrlList[widget.blogIdx];

      urlnameController.text = commonUrl.urlname;
      urllinkController.text = commonUrl.urllink;

      widget.urlname = commonUrl.urlname;
      widget.urllink = commonUrl.urllink;
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          widget.blogmode
              ? Text('')
              : IconButton(
                  onPressed: () {
                    showDelDialog(blogcontext, teamBlogService);
                  },
                  icon: Icon(Icons.delete),
                ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 30,
            ),
            Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("    이름",
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
                          controller: urlnameController,
                          decoration: InputDecoration(
                            hintText: "이름",
                            border: InputBorder.none,
                          ),
                          autofocus: true,
                          maxLines: null,
                          expands: true,
                          keyboardType: TextInputType.multiline,
                          onChanged: (value) {
                            widget.urlname = value; // 텍스트필드 안의 값이 변할 때
                          },
                        ),
                      ),
                    ),
                  ]),
            ),
            SizedBox(height: 20),
            Text("          링크", style: TextStyle(fontWeight: FontWeight.bold)),
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
                    controller: urllinkController,
                    decoration: InputDecoration(
                      hintText: "공유하고싶은 URL 링크를 올려주세요.",
                      border: InputBorder.none,
                    ),
                    autofocus: true,
                    maxLines: null,
                    expands: true,
                    keyboardType: TextInputType.multiline,
                    onChanged: (value) {
                      widget.urllink = value; // 텍스트필드 안의 값이 변할 때
                    },
                  ),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child: widget.blogmode
                    ? IconButton(
                        onPressed: () {
                          if (widget.urlname.isNotEmpty &&
                              widget.urllink.isNotEmpty) {
                            teamBlogService.createUrl(
                              urlname: widget.urlname,
                              urllink: widget.urllink,
                            );
                            Navigator.pop(blogcontext);
                          } else {
                            showWarnDialog(blogcontext);
                          }
                        },
                        icon: Icon(Icons.save))
                    : IconButton(
                        onPressed: () {
                          if (widget.urlname.isNotEmpty &&
                              widget.urllink.isNotEmpty) {
                            teamBlogService.updateUrl(
                              blogIdx: widget.blogIdx,
                              urlname: widget.urlname,
                              urllink: widget.urllink,
                            );
                            Navigator.pop(context);
                          } else {
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

  void showDelDialog(BuildContext blogctx, TeamBlogService teamBlogService) {
    showDialog(
      context: blogctx,
      builder: (blogctx) {
        return AlertDialog(
          title: Text("정말로 삭제하시겠습니까?"),
          actions: [
            // 취소 버튼
            TextButton(
              onPressed: () {
                Navigator.pop(blogctx);
              },
              child: Text("취소"),
            ),
            // 확인 버튼
            TextButton(
              onPressed: () {
                teamBlogService.deleteUrl(blogIdx: widget.blogIdx);
                Navigator.pop(blogctx); // 팝업 닫기
                Navigator.pop(blogctx); // HomePage 로 가기
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
