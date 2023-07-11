import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'member_detail.dart';
import 'member_service.dart';
import 'member_view.dart';

class TeamMbti extends StatelessWidget {
  const TeamMbti({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("5조 멤버MBTI"),
      ),
      body: const MbtiMain(),
    );
  }
}

class MbtiMain extends StatefulWidget {
  const MbtiMain({super.key});

  @override
  State<MbtiMain> createState() => _MbtiMainState();
}

class _MbtiMainState extends State<MbtiMain> {
  var ImageList = [
    "image/ISTP.png",
    "image/ISTJ.png",
    "image/INFJ.png",
    "image/ISTP.png",
    "image/ISTJ.png"
  ];

  bool _customTileExpanded = false;
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> mbtiList = {
      "ENTJ": "비전을 갖고 타인을 활력적으로 인도하는 사람",
      "ENTP": "풍부한 상상력으로 새로운 것에 도전하는 사람",
      "ISFP": "따뜻한 감성을 가진 겸손한 사람",
      "ISFJ": "성실하고 온화하며 협조를 잘하는 사람",
      "ENFJ": "타인의 성장을 도모하고 협동하는 사람",
      "ENFP": "열정적으로 새로운 관계를 만드는 사람",
      "ISTP": "논리적으로 뛰어난 상황 적응력을 가진 사람",
      "ISTJ": "한 번 시작한 일은 끝까지 해내는 사람",
      "ESFJ": "친절, 현실감을 바탕으로 타인에게 봉사하는 사람",
      "ESFP": "분위기를 고조시키는 우호적인 사람",
      "INTP": "비평적인 관점을 가진 뛰어는 전략을 가진 사람",
      "INTJ": "전체를 조합하여 비전을 제시하는 사람",
      "ESTJ": "사무적, 살용적, 현실적인 사람",
      "ESTP": "친구, 운동, 음식 등 다양함을 선호하는 사람",
      "INFJ": "사람에 관한 뛰어난 통찰력을 가진 사람",
      "INFP": "이상적인 세상을 만들어가는 사람",
    };
    Map<String, dynamic> mbtiImgList = {
      "ENTJ": "",
      "ENTP": "",
      "ISFP": "",
      "ISFJ": "",
      "ENFJ": "",
      "ENFP": "",
      "ISTP": "",
      "ISTJ": "",
      "ESFJ": "",
      "ESFP": "",
      "INTP": "",
      "INTJ": "",
      "ESTJ": "",
      "ESTP": "",
      "INFJ": "image/INFJ.png",
      "INFP": "",
    };

    return Consumer<MemberService>(builder: (context, memberService, child) {
      List<Member> memberList = memberService.memberList;
      return ListView.builder(
        itemCount: memberList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ExpansionTile(
              trailing: Icon(
                _customTileExpanded
                    ? Icons.arrow_drop_down_circle
                    : Icons.arrow_drop_down,
              ),
              children: <Widget>[
                ListTile(
                    title:
                        Text("mbti 특징: ${mbtiList[memberList[index].mbti]}")),
              ],
              onExpansionChanged: (bool expanded) {
                setState(() {
                  _customTileExpanded = expanded;
                });
              },
              title: Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset(mbtiImgList[memberList[index].mbti]),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(children: <Widget>[
                      Text(
                        memberList[index].name,
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
            ),
          );
        },
      );
    });
  }
}
