import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'member_detail.dart';
import 'member_service.dart';
import 'member_view.dart';

class TeamMbti extends StatelessWidget {
  const TeamMbti({super.key});

  @override
  Widget build(BuildContext context) {
    var titleList = ["배근태", "이슬비", "이승훈", "소준선", "이동희"];
    var ImageList = [
      "image/ISTP.png",
      "image/ISTJ.png",
      "image/INFJ.png",
      "image/ISTP.png",
      "image/ISTJ.png"
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text("5조 멤버MBTI"),
        ),
        body: ListView.builder(
          itemCount: titleList.length,
          itemBuilder: (context, index) {
            return Card(
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset(ImageList[index]),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(children: [
                      Text(
                        titleList[index],
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ]),
                  )
                ],
              ),
            );
          },
        ));
  }
}
