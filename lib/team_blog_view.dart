import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'team_blog.dart';
import 'team_blog_detail.dart';
import 'team_blog_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamBlogView extends StatelessWidget {
  const TeamBlogView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TeamBlogService>(
      // Builder -> Consumer로 수정
      builder: (context, teamBlogService, child) {
        List<CommonUrl> commonUrlList = teamBlogService.commonUrlList;

        return Container(
          width: 300,
          height: 300,
          child: ListView.builder(
            itemCount: commonUrlList.length,
            itemBuilder: (BuildContext blogctx, int blogIdx) {
              CommonUrl commonUrl = commonUrlList[blogIdx];

              return Column(
                children: [
                  ListTile(
                    trailing: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BlogcretePage(
                                blogIdx: blogIdx,
                                blogmode: false,
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.delete)),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          commonUrl.urlname,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    onTap: () async {
                      final url = Uri.parse(commonUrl.urllink);
                      if (await canLaunchUrl(url)) {
                        launchUrl(url);
                      } else {
                        // ignore: avoid_print
                        print(commonUrl.urlname);
                      }
                    },
                  ),
                  Divider()
                ],
              );
            },
          ),
        );
      },
    );
  }
}
