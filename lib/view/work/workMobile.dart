import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/controller/generalController.dart';
import 'package:portfolio/resource/appClass.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../resource/colors.dart';

class WorkMobile extends ConsumerStatefulWidget {
  const WorkMobile({Key? key}) : super(key: key);

  @override
  ConsumerState<WorkMobile> createState() => _WorkWebState();
}

class _WorkWebState extends ConsumerState<WorkMobile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
              text: "03.",
              style: TextStyle(color: AppColors().neonColor, fontSize: 20, fontFamily: 'sfmono'),
              children: <TextSpan>[
                TextSpan(
                  text: ' My Noteworthy Projects',
                  style: GoogleFonts.roboto(
                      color: AppColors().textColor,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )
              ]),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'view the archives',
            style: TextStyle(color: AppColors().neonColor, fontSize: 12, fontFamily: 'sfmono'),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 30.0, bottom: 50.0),
          child: StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: [
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Tile(index: 0),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Tile(index: 1),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Tile(index: 2),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Tile(index: 3),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Tile({required int index}) {
    return InkWell(
      mouseCursor: MaterialStateMouseCursor.textable,
      onTap: () async {
        switch (index) {
          case 0:
            // await launchUrl(Uri.parse(AppClass.gitSafeC19));
            break;

          case 1:
            //AppClass().alertDialog(context, 'Not Found', 'Sorry the project you requested not found in the repository');
            break;

          case 2:
            // await launchUrl(Uri.parse(AppClass.gitWtIot));
            break;

          case 3:
            // await launchUrl(Uri.parse(AppClass.gitAutoStabilizer));
            break;

          case 4:
            //await launchUrl(Uri.parse(AppClass.gitPAT));
            break;

          case 5:
            AppClass().alertDialog(context, 'Not Found',
                'Sorry the project you requested not found in the repository');
            break;
        }
      },
      onHover: (bool) {
        if (bool) {
          ref.read(hoverProvider.notifier).state = "$index";
        } else {
          ref.read(hoverProvider.notifier).state = "";
        }
      },
      child: Consumer(builder: (context, ref, child) {
        String data = ref.watch(hoverProvider);
        bool isHovered = (data == "$index");
        return Container(
          margin: EdgeInsets.all(0.0),
          child: Tooltip(
            message: AppClass().projectList[index].projectTitle.toString() +
                "\n\n" +
                AppClass().projectList[index].projectContent.toString(),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(AppClass().getMqWidth(context) * 0.1),
            waitDuration: Duration(seconds: 3),
            decoration: BoxDecoration(
              color: AppColors().primaryColor.withOpacity(0.9),
              borderRadius: const BorderRadius.all(Radius.circular(4)),
            ),
            textStyle: TextStyle(color: Colors.white24),
            preferBelow: true,
            verticalOffset: 20,
            child: Card(
              color: AppColors().cardColor,
              elevation: 10,
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/folder.svg',
                          width: 35,
                          height: 35,
                          color: AppColors().neonColor,
                        ),
                        InkWell(
                          onTap: () async {
                            final url = Uri.parse("${AppClass().projectList[index].projectUri}");
                            await launchUrl(url);
                          },
                          child: SvgPicture.asset(
                            'assets/svg/externalLink.svg',
                            width: 20,
                            height: 20,
                            color: isHovered ? AppColors().neonColor : Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 8.0),
                      child: Row(
                        mainAxisAlignment:
                            AppClass().projectList[index].projectTitle.toString().contains('제주다봄')
                                ? MainAxisAlignment.spaceBetween
                                : MainAxisAlignment.start,
                        children: [
                          Text(
                            AppClass().projectList[index].projectTitle.toString(),
                            textAlign: TextAlign.left,
                            style: GoogleFonts.robotoSlab(
                                color: isHovered ? AppColors().neonColor : Colors.white,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          if (AppClass()
                              .projectList[index]
                              .projectTitle
                              .toString()
                              .contains('제주다봄'))
                            Row(
                              children: [
                                // SizedBox(width: 10),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () async {
                                      final url =
                                          Uri.parse("${AppClass().projectList[index].appStoreUri}");
                                      await launchUrl(url);
                                    },
                                    child: Image.asset(
                                      'assets/svg/appStoreLogo.png',
                                      width: 18,
                                      height: 18,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                InkWell(
                                  onTap: () async {
                                    final url =
                                        Uri.parse("${AppClass().projectList[index].playStoreUri}");
                                    await launchUrl(url);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      'assets/svg/playStoreLogo.png',
                                      width: 18,
                                      height: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Text(
                          AppClass().projectList[index].projectContent.toString(),
                          style: GoogleFonts.roboto(
                            color: AppColors().textLight,
                            letterSpacing: 1,
                            height: 1.5,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          AppClass().projectList[index].tech1 ?? "",
                          style: GoogleFonts.roboto(
                            color: AppColors().textLight,
                            letterSpacing: 1,
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          AppClass().projectList[index].tech2 ?? "",
                          style: GoogleFonts.roboto(
                            color: AppColors().textLight,
                            letterSpacing: 1,
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          AppClass().projectList[index].tech3 ?? "",
                          style: GoogleFonts.roboto(
                            color: AppColors().textLight,
                            letterSpacing: 1,
                            height: 1.5,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
