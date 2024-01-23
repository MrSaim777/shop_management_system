import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shop_management/utils/constants/constant_strings.dart';
import 'package:shop_management/utils/extentions/build_context_extention.dart';
import 'package:shop_management/view/widgets/app_btn.dart';
import 'package:shop_management/view/widgets/app_cupertino_textfield.dart';
import 'package:shop_management/view/widgets/back_btn.dart';
import 'package:shop_management/view_model/auth_view_model.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppCupertinoTextField(
                textEditingController: provider.signUpEmailController,
                hintText: ConstantStrings.email,
                textInputType: TextInputType.emailAddress,
                prefixWidget: Padding(
                  padding: EdgeInsets.only(left: context.width / 20),
                  child: const FaIcon(FontAwesomeIcons.envelope),
                ),
              ),
              SizedBox(height: context.height / 50),
              AppCupertinoTextField(
                textEditingController: provider.signUpPasswordController,
                hintText: ConstantStrings.password,
                textInputType: TextInputType.visiblePassword,
                prefixWidget: Padding(
                  padding: EdgeInsets.only(left: context.width / 20),
                  child: const FaIcon(FontAwesomeIcons.lock),
                ),
              ),
              SizedBox(height: context.height / 20),
              AppButton(
                  onTap: () => provider.signUp(context),
                  btnText: ConstantStrings.signUp),
            ],
          ),
          Positioned(
            bottom: context.height / 40,
            left: context.width / 20,
            child: const BackBtn(),
          ),
        ],
      ),
    );
  }
}
