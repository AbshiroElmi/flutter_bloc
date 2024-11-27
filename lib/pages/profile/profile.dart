import 'package:flutter/material.dart';
import 'package:ulearning/common/value/colors.dart';
import 'package:ulearning/pages/widget/base_text_widget.dart';
import 'package:ulearning/pages/widget/profile_widget.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: buildProfileAppbar(),
        body: SingleChildScrollView(
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                buildProfileiconEditBotton(),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: buildListview(context),
                  
             
                ),

              Padding(
                padding: const EdgeInsets.only(top: 90),
                child: reusableText('click settings logout is working',color: AppColors.primaryElement),
              ), 
              ],
            ),
          )
        ));
  }
}
