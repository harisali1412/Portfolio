import 'package:flutter/material.dart';
import 'package:portfolio/utils/projects_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project});

  final ProjectUtils project;

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if(!await launchUrl(uri, mode: LaunchMode.externalApplication)){
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 280,
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomColor.bgLight2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: (){
              if(project.webLink != null){
                _launchURL(project.webLink!);
              }
            },
            child: Image.asset(
              project.image,
              height: 140,
              width: 250,
              fit: BoxFit.cover,
            ),
          ),

          //title
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
            child: Text(
              project.title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: CustomColor.whitePrimary),
            ),
          ),

          //subtitle
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text(
              project.subtitle,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: CustomColor.whiteSecondary),
            ),
          ),
          const Spacer(),

          //footer
/*
          Container(
            color: CustomColor.bgLight1,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),

            child: Row(
              children: [
                const Text(
                  "Available on",
                  style: TextStyle(
                      color: CustomColor.yellowSecondary,
                      fontSize: 10
                  ),
                ),
                const Spacer(),

                if(project.androidLink != null)
                InkWell(onTap: (){
                  js.context.callMethod("open", [project.androidLink]);
                },
                    child: Image.asset("assets/images/android.png", width: 15,)),

                if(project.iosLink != null)
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: InkWell(onTap: (){
                    js.context.callMethod("open", [project.iosLink]);
                  },
                    child: Image.asset("assets/images/ios.png", width: 15,),
                  ),
                ),

                if(project.webLink != null)
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: InkWell(onTap: (){
                    js.context.callMethod("open", [project.webLink]);
                  },
                    child: Image.asset("assets/images/web.png", width: 15,),
                  ),
                ),
              ],
            ),
          ),
*/
        ],
      ),
    );
  }
}
