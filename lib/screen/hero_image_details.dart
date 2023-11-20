import 'package:flutter/material.dart';
import 'package:flutter_3d_object/screen/home_page.dart';
import 'package:get/get.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../controller/home_controller.dart';
import 'credit_form.dart';

class HeroProductDetails extends StatelessWidget {
  HeroProductDetails({super.key, required this.imageUrl,required this.heroTag});
  Widget imageUrl;
  String heroTag;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xfffebe9f4),
      body: SafeArea(
        child: InkWell(
          onTap: (){
            Get.delete<HomeController>(force: true);
            Get.put(HomeController());
            // Navigator.of(context).pop();
            // Navigator.of(context).pop(
            //   PageRouteBuilder(
            //     transitionDuration: const Duration(milliseconds: 1000),
            //     pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            //       return HomePage(); // Replace with the widget for the replacement page
            //     },
            //     transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
            //       return FadeTransition(
            //         opacity: CurvedAnimation(parent: animation, curve: Curves.elasticInOut),
            //         child: child,
            //       );
            //     },
            //   ),
            // );
          },
          child: Hero(
            tag: heroTag,
            child: Stack(
              children: [
                 Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child:imageUrl,
                    ),
                  ],
                ),
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
