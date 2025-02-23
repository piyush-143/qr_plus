import 'package:flutter/material.dart';
import 'package:qr_plus/widgets/uihelper/size_data.dart';

import '../screen/generate_screen.dart';
import 'uihelper/color.dart';
import 'custom_cross_container.dart';
import 'custom_text_field.dart';
import 'generate_qr_button.dart';

class SingleField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String labelText;
  final VoidCallback onTap;
  final IconData icon;
  int? minLine;
  SingleField({
    required this.controller,
    required this.title,
    required this.labelText,
    required this.onTap,
    required this.icon,
    this.minLine,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: SizeData.aboveAppBar),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Row(
              children: [
                CustomCrossContainer(
                  icon: Icons.arrow_back_ios_sharp,
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GenerateScreen(),
                        ));
                  },
                  size: 35,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: SizeData.belowAppBar),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: CustomColor.barBgColor.withAlpha(150),
              border: Border.symmetric(
                  horizontal:
                      BorderSide(color: CustomColor.goldColor, width: 2)),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: CustomColor.barBgColor,
                  blurRadius: 8,
                  blurStyle: BlurStyle.outer,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              spacing: 22,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  icon,
                  size: 68,
                  color: CustomColor.goldColor,
                ),
                SizedBox(height: 10),
                CustomTextField(
                  labelText: labelText,
                  controller: controller,
                  minLine: minLine ?? 1,
                ),
                SizedBox(height: 10),
                GenerateQrButton(onTap: onTap),
                SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
