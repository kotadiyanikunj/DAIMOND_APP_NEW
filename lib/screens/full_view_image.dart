import 'package:daimond_app/constants/app_images.dart';
import 'package:daimond_app/screens/full_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../utils/padding_widget.dart';
import '../widget/dynamic_text.dart';

class FullimageScreen extends StatefulWidget {
  const FullimageScreen({Key? key}) : super(key: key);

  @override
  State<FullimageScreen> createState() => _FullimageScreenState();
}

class _FullimageScreenState extends State<FullimageScreen> {
  bool isactive = false;
  Future<bool> goback() {
    Get.off(FulldetailsScreen());
    return Future.value();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: goback,
      child: Scaffold(
        backgroundColor: AppColors.color202b,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.036),
          child: Column(
            children: [
              verticalSpacing(height * 0.065),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                          height: 30,
                          width: 30,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: SvgPicture.asset(AppImages.leftArrow),
                          ))),
                  horizontalSpacing(22),
                  Center(
                    child: DynamicText(
                      text: "${Get.arguments}",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 18),
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isactive = !isactive;
                          if (isactive) {
                          } else {}
                        });
                      },
                      icon: isactive
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share,
                        color: Colors.white,
                      ))
                ],
              ),
              verticalSpacing(height * 0.15),
              Container(
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      AppImages.filterimage,
                      fit: BoxFit.fill,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
