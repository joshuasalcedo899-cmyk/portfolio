import 'package:flutter/material.dart';
import 'package:flutter_testing/widgets/modals/project_modal/project_tags.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String image;
  final Color bgColor;
  final List<String> tags;

  const ProjectCard({
    super.key,
    required this.title,
    required this.image,
    required this.bgColor,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  ProjectTags(tags),
                  SizedBox(height: 20,),
                  Container(
                    height: 50,
                    alignment: Alignment.center,
                    child: FilledButton(
                      onPressed: (){
                    
                    },
                    style: FilledButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                      ),
                      backgroundColor: Color.fromARGB(255, 57, 59, 59)
                    ),
                    child: Text('View Project')),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
