import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/features/Home/presention/views/home_view.dart';
import 'package:bookly/features/splash/presention/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:go_router/go_router.dart';

class splash_View_Body extends StatefulWidget {
  const splash_View_Body({Key? key}) : super(key: key);
  @override
  State<splash_View_Body> createState() => _splash_View_BodyState();
}

class _splash_View_BodyState extends State<splash_View_Body>
    with SingleTickerProviderStateMixin {
  late AnimationController animationcontrollar;
  late Animation<Offset> slidinganimation;
  @override
  void initState() {
    // TODO: implement initState
    initslidinganimation();
    Navigatetohome();
    super.initState();
  }

  void initslidinganimation() {
    animationcontrollar = AnimationController(
      vsync: this,
      duration: Duration(minutes: 1),
    );
    slidinganimation = Tween<Offset>(
      begin: Offset(0, 2),
      end: Offset.zero,
    ).animate(animationcontrollar);
    animationcontrollar.forward();
  }

  void Navigatetohome() {
    Future.delayed(const Duration(seconds: 2), () {
      /* Get.to(
        () => const HomeView(),
        transition: Transition.fade,
        duration: Duration(microseconds: 250),
      );*/
      GoRouter.of(context).push(AppRoute.KHomeVIewDirest);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationcontrollar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset('assets/images/Logo.png'),
        SizedBox(height: 30),
        slidingtext(slidinganimation: slidinganimation),
      ],
    );
  }
}
