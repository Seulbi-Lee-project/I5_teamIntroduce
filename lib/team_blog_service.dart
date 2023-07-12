import 'package:flutter/material.dart';

// Memo 데이터의 형식을 정해줍니다. 추후 isPinned, updatedAt 등의 정보도 저장할 수 있습니다.
class CommonUrl {
  CommonUrl({
    required this.urlname,
    required this.urllink,
  });

  String urlname;
  String urllink;

  Map toJson() {
    return {
      'urlname': urlname,
    };
  }

  factory CommonUrl.fromJson(json) {
    return CommonUrl(
      urlname: json['urlname'],
      urllink: json['urllink'],
    );
  }
}

// Memo 데이터는 모두 여기서 관리
class TeamBlogService extends ChangeNotifier {
  List<CommonUrl> commonUrlList = [
    CommonUrl(
      urlname: '내일배움캠프',
      urllink: 'https://spartacodingclub.kr/',
    ),
    CommonUrl(
      urlname: 'Google',
      urllink: 'https://m.google.com/',
    ), // 더미(dummy) 데이터
  ];

  createUrl({
    required String urlname,
    required String urllink,
  }) {
    CommonUrl commonUrl = CommonUrl(
      urlname: urlname,
      urllink: urllink,
    );
    commonUrlList.insert(
        0, commonUrl); // Consumer<MemberService>의 builder 부분을 호출해서 화면 새로고침
    notifyListeners();
  }

  updateUrl({
    required int blogIdx,
    required String urlname,
    required String urllink,
  }) {
    CommonUrl commonUrl = commonUrlList[blogIdx];
    commonUrl.urlname = urlname;
    commonUrl.urllink = urllink;
    notifyListeners();
  }

  deleteUrl({required int blogIdx}) {
    commonUrlList.removeAt(blogIdx);
    notifyListeners();
  }
}
