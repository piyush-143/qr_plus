import 'package:flutter/material.dart';
import 'package:qr_plus/widgets/oval_bg.dart';

import '../../widgets/uihelper/color.dart';
import '../../widgets/custom_cross_container.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/generate_qr_button.dart';
import '../generate_screen.dart';

class ForBusinessScreen extends StatefulWidget {
  const ForBusinessScreen({super.key});

  @override
  State<ForBusinessScreen> createState() => _ForBusinessScreenState();
}

class _ForBusinessScreenState extends State<ForBusinessScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController industryController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    industryController.dispose();
    phoneController.dispose();
    emailController.dispose();
    websiteController.dispose();
    addressController.dispose();
    cityController.dispose();
    countryController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.bgColor,
      body: OvalBg(
        body: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25, bottom: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
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
                        "Business",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 17),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                  spacing: 9,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.business_sharp,
                      size: 58,
                      color: CustomColor.goldColor,
                    ),
                    CustomTextField(
                      labelText: "Company Name",
                      controller: nameController,
                    ),
                    CustomTextField(
                      labelText: "Industry Name",
                      controller: industryController,
                    ),
                    RowTextField(
                        controller1: phoneController,
                        controller2: emailController,
                        labelText1: "Phone",
                        labelText2: "Email"),
                    CustomTextField(
                      labelText: "Website",
                      controller: websiteController,
                    ),
                    CustomTextField(
                      labelText: "Address",
                      controller: addressController,
                    ),
                    RowTextField(
                        controller1: cityController,
                        controller2: countryController,
                        labelText1: "City Name",
                        labelText2: "Country Name"),
                    GenerateQrButton(onTap: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
