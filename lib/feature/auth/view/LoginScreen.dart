import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:my_app/Core/Const/App_Color.dart';
import 'package:my_app/Core/utlis/validator.dart';
import 'package:my_app/feature/auth/cubit/auth_cubit.dart';
import 'package:my_app/feature/auth/view/RegisterScreen.dart';
import 'package:my_app/feature/auth/widgets/custom_button.dart';
import 'package:my_app/feature/auth/widgets/custom_icon.dart';
import 'package:my_app/feature/auth/widgets/custom_text.dart';
import 'package:my_app/feature/auth/widgets/custom_user_txt_field.dart';
import 'package:my_app/feature/home/view/HomeScreen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 130, left: 20),
                child: CustomText(
                  text: "Hey,\nWelcome Back",
                  fontSize: 40,
                  fontFamily: 'Luckiest_Guy',
                  fontWeight: FontWeight.w800,
                ),
              ),
              Gap(50),
              Form(
                key: _formKey,

                child: Column(
                  children: [
                    CustomUserTxtField(
                      controller: emailcontroller,
                      keyboardType: TextInputType.emailAddress,
                      autofocus: true,
                      hintText: "Enter your email",
                      validator: MyValidators.emailValidator,
                    ),
                    Gap(20),
                    CustomUserTxtField(
                      controller: passwordcontroller,
                      keyboardType: TextInputType.visiblePassword,
                      hintText: "Enter your password",
                      validator: MyValidators.passwordValidator,
                      autofocus: false,
                    ),
                  ],
                ),
              ),

              Gap(18),
              Padding(
                padding: EdgeInsets.only(left: 218),
                child: GestureDetector(
                  onTap: () {
                    print("8l allahm zkernyyyy😊");
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: AppColors.btmcolor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Luckiest_Guy",
                    ),
                  ),
                ),
              ),

              Gap(135),
              Center(
                child: BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSuccess) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Homescreen()),
                      );
                    }
                    if (state is AuthError) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.error)));
                    }
                  },
                  builder: (context, state) {
                    return Center(
                      child: state is AuthLoading
                          ? CircularProgressIndicator()
                          : CustomButton(
                              text: "Login",
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthCubit>().login(
                                    emailcontroller.text,
                                    passwordcontroller.text,
                                  );
                                }
                              },
                            ),
                    );
                  },
                ),
              ),
              Gap(20),
              Center(
                child: Text(
                  "Or Continue with",
                  style: TextStyle(
                    color: Color.fromARGB(255, 139, 146, 156),

                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Rubik",
                  ),
                ),
              ),
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIcon(Imagname: "Images/face_icon.png"),
                  Gap(20),
                  CustomIcon(Imagname: "Images/goooogle-icon.png"),
                  Gap(20),
                  CustomIcon(Imagname: "Images/apple_icon.png", padding: 6),
                ],
              ),

              Gap(25),
              Center(
                child: CustomText(
                  text: "Already have an Account! ",
                  clickableText: "Sign-In",
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Registerscreen()),
                  ),
                  fontSizeclickableText: 16,
                  fontSize: 15,
                  fontFamily: " ",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
