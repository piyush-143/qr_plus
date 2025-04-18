import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qr_plus/screen/result_screen.dart';
import 'package:qr_plus/widgets/oval_bg.dart';
import 'package:qr_plus/widgets/uihelper/concat_string.dart';
import 'package:qr_plus/widgets/uihelper/flushbar_message.dart';
import 'package:qr_plus/widgets/uihelper/size_data.dart';

import '../../provider/db_provider.dart';
import '../../provider/toggle_provider.dart';
import '../../widgets/custom_cross_container.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/generate_qr_button.dart';
import '../../widgets/uihelper/color.dart';

class ForWiFiScreen extends StatefulWidget {
  const ForWiFiScreen({super.key});

  @override
  State<ForWiFiScreen> createState() => _ForWiFiScreenState();
}

class _ForWiFiScreenState extends State<ForWiFiScreen> {
  TextEditingController networkController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // networkController.dispose();
    // passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> code = [networkController, passController];
    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      body: OvalBg(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
                        Navigator.pop(context);
                      },
                      size: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 28.0),
                      child: Text(
                        "Wi-Fi",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: SizeData.belowAppBar),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: CustomColor.barBgColor.withAlpha(150),
                      border: Border.symmetric(
                          horizontal: BorderSide(
                              color: CustomColor.goldColor, width: 2)),
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
                          Icons.wifi,
                          size: 68,
                          color: CustomColor.goldColor,
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                          labelText: "Network",
                          controller: networkController,
                        ),
                        CustomTextField(
                          labelText: "Password",
                          controller: passController,
                        ),
                        SizedBox(height: 10),
                        GenerateQrButton(
                          onTap: () async {
                            if (networkController.text.isNotEmpty &&
                                passController.text.isNotEmpty) {
                              final date = DateTime.now();
                              String d =
                                  "${DateFormat('d MMM y, hh:mm').format(date)} ${DateFormat("a").format(date).toLowerCase()}";
                              context.read<ToggleProvider>().vibrate();
                              context.read<DBProvider>().addData(
                                  code: concatenateString(code).text,
                                  date: DateTime.now(),
                                  isCreate: true);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ResultScreen(
                                      code: concatenateString(code).text,
                                      date: d,
                                    ),
                                  ));
                            } else {
                              flushBarMessage(
                                  context, "Enter required details!!!");
                            }
                          },
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
