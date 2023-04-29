import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:portfolio/model/models.dart';
import 'package:portfolio/resource/styles.dart';
import 'package:url_launcher/url_launcher.dart';

enum ScreenType { mobile, tab, web }

class AppClass {
  static final AppClass _mAppClass = AppClass._internal();
  static BuildContext? lastContext;
  ScrollController controller = ScrollController();

  /* URL */
  static final resumeDownloadURL =
      '''https://drive.google.com/file/d/1X4Z_hgsTB72g81EXWf1DCeBv4oF8nfkS/view?usp=share_link''';

  static final gitSafeC19 = '''https://github.com/chochoq''';

  List<WorkModel> projectList = [
    WorkModel(
        projectUri: 'https://devchocho.notion.site/6db8e06d8f604e819b503504f161def6',
        projectTitle: "제주다봄 @PeopleBomb",
        projectContent:
            '''제주다봄에서는 제주도 여행정보와 함께 제주도 내의 숙박시설과 부동산 관련 정보도 제공하여, 사용자가 제주도에 대한 다양한 정보를 한곳에서 쉽게 확인하고 활용할 수 있도록 도와줍니다.''',
        tech1: "Flutter",
        tech2: "Node.js",
        tech3: "MySQL"),
    WorkModel(
        projectUri: 'https://devchocho.notion.site/65559e93337146f690b1c17875fd9f90',
        projectTitle: "뉴닉 클론코딩",
        projectContent: "즐겨 구독하던 뉴닉 뉴스레터의 홈페이지를 클론코딩보았습니다.",
        tech1: "React",
        tech2: "Aws Sever(S3,EC2)",
        tech3: "Axios"),
    WorkModel(
        projectUri: 'https://devchocho.notion.site/651928c3a9e8462d81ccf350cae3172e',
        projectTitle: "뉴스레터저장소 뉴편함",
        projectContent: '''메일링서비스 춘추전국시대지만, 정작 어떤 메일링 서비스가 있는지 찾아보기는 쉽지 않습니다.

"모든 뉴스레터 서비스를 한 눈에 모아 볼수있게 만들어보면 어떨까?" 하는 생각으로 프로젝트를 진행했습니다.

스파르타코딩클럽 종합반과 플러스 강의의 커리큘럼 속에 있는 기능들을 사용해 원하는 기능들을 구현할 수 있게 초점을 맞추며 기본적인 CRUD(추가,업데이트,리스트,삭제)를 만들기위해 노력했습니다.''',
        tech1: "JS",
        tech2: "Python",
        tech3: "MongoDB"),
    WorkModel(
        projectUri: 'https://devchocho.notion.site/723d2b846d494353870120d6dc9127d8',
        projectTitle: "동아리 및 일정관리 오때",
        projectContent:
            '''소규모 모임 약속을 잡게 되면 서로의 스케쥴을 항상 먼저 물어보게 됩니다. 하지만 다수의 사람이 같은 날짜에 시간이 비는 경우는 드뭅니다. 서로의 스케쥴을 확인하며 약속 혹은 모임을 수월하게 잡을 수 있다면 어떨까요?

모임 구성원과 약속을 잡기 위해 일정을 확인하고 싶을 때 혹은 취미 등을 위해 근처에 같은 목적을 가진 사람을 만나는 것은 어떨까 하는 생각에 시작하게 되었습니다
''',
        tech1: "JS",
        tech2: "Spring",
        tech3: "OracleSQL"),
    WorkModel(projectTitle: "", projectContent: '''''', tech1: "", tech2: "", tech3: ""),
    WorkModel(projectTitle: "", projectContent: '''''', tech1: "", tech2: "", tech3: ""),
  ];

  factory AppClass() {
    return _mAppClass;
  }

  AppClass._internal();

  getMqWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  getMqHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  showSnackBar(String msg, {BuildContext? context}) {
    ScaffoldMessenger.of(context ?? lastContext!).showSnackBar(SnackBar(content: Text(msg)));
  }

  ScreenType getScreenType(BuildContext context) {
    double scrWidth = getMqWidth(context);
    if (scrWidth > 915) {
      return ScreenType.web;
    } else if (scrWidth < 650) {
      return ScreenType.mobile;
    }
    return ScreenType.tab;
  }

  downloadResume(context) async {
    await launchUrl(Uri.parse(AppClass.resumeDownloadURL));
  }

  alertDialog(context, title, msg) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
                title: Text(title, style: TxtStyle().boldWhite(context)),
                content: Text(msg),
                actions: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      onPressed: () => Navigator.pop(context),
                      child: Text('Okay'))
                ]));
  }

  Future<bool> sendEmail(name, contact, msg) async {
    var url = Uri.https('hbk-portfolio-mailer.web.app', '/sendMail');
    var response = await post(url, body: {"name": name, "contactInfo": contact, "message": msg})
        .timeout(Duration(seconds: 10));
    print(response.body);
    return response.statusCode == 200;
  }
}
