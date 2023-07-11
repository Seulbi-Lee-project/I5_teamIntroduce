import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'member_detail.dart';
import 'member_service.dart';
import 'package:flutter/cupertino.dart';

class MemberView extends StatelessWidget {
  const MemberView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MemberService>(
      builder: (context, memberService, child) {
        List<Member> memberList = memberService.memberList;
        double heightSize = 260.0; // * memberList.length;

        return Container(
          width: 300,
          height: heightSize,
          padding: const EdgeInsets.all(0.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.lightBlue),
          ),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: memberList.length,
            itemBuilder: (context, index) {
              Member member = memberList[index];

              return Column(
                children: [
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          member.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ConcretePage(
                            index: index,
                            mode: false,
                          ),
                        ),
                      );
                      //Navigator.push()
                    },
                  ),
                Divider()],
              );
            },
          ),
        );
      },
    );
  }
}
