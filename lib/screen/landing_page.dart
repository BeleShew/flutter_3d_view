import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_3d_object/controller/landing_page_controller.dart';
import 'package:get/get.dart';

import 'home_page.dart';

class LandingPage extends StatelessWidget {
  LandingPage({super.key}) {
    Get.put(LandingPageController());
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LandingPageController>(builder: (controller) {
      return Scaffold(
        backgroundColor:const Color(0xfffebe9f4),
        body:Column(
          children: [
            Expanded(
              child: Container(
                color: const Color(0xfffebe9f4),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child:ListWheelScrollView(
                  controller: controller.listControllers,
                  itemExtent: 200,
                  perspective: 0.009,
                  physics: const FixedExtentScrollPhysics(),
                  diameterRatio:8,
                  children: List.generate(controller.listWheelScrollView.length, (index) {
                    return Container(
                      color: const Color(0xfffebe9f4),
                      child: GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(controller.listWheelScrollView[index].length, (indexs) =>
                            InkWell(
                              onTap: (){
                                // Navigator.push(context, MaterialPageRoute(
                                //     fullscreenDialog: true,
                                //     builder: (context) => HeroProductDetails(imageUrl:controller.listWheelScrollView[index][indexs],heroTag: 'selectedImage${controller.listWheelScrollView[index][indexs]}',)));

                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    fullscreenDialog: true,
                                    transitionDuration:const Duration(milliseconds: 2000),
                                    pageBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation) {
                                      // return HomePage();
                                      return HomePage(heroTag: '34312selectedImage${controller.listWheelScrollView[index][indexs]}',);
                                    },
                                    transitionsBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation,
                                        Widget child) {
                                      return FadeTransition(
                                        opacity: CurvedAnimation(parent: animation, curve: Curves.elasticInOut),
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Hero(
                                tag: '34312selectedImage${controller.listWheelScrollView[index][indexs]}',
                                // transitionOnUserGestures:true,
                                // flightShuttleBuilder: (context,animation,duration,context1,context2){
                                //   // return  imageUrl;
                                //   return  Image.asset('assets/eggpng.png',fit: BoxFit.cover,);
                                // },
                                child: Stack(
                                  children: [
                                    controller.listWheelScrollView[index][indexs],
                                    Container(
                                      height: 200,
                                      decoration: const BoxDecoration(
                                          color: Colors.transparent,
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.all(Radius.circular(20))
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
