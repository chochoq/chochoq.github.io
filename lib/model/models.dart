import 'package:flutter/widgets.dart';

class ExperienceModel {
  String? desig;
  String? compName;
  String? duration;
  Widget? points;

  ExperienceModel({this.desig, this.compName, this.duration, this.points});
}

class WorkModel {
  String? projectTitle;
  String? projectUri;
  String? projectContent;
  String? tech1;
  String? tech2;
  String? tech3;
  String? appStoreUri;
  String? playStoreUri;

  WorkModel({
    this.projectTitle,
    this.projectUri,
    this.projectContent,
    this.tech1,
    this.tech2,
    this.tech3,
    this.appStoreUri,
    this.playStoreUri,
  });
}
