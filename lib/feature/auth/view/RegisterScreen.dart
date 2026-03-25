import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter/gestures.dart';
import 'package:my_app/Core/utlis/validator.dart';
import 'package:my_app/feature/auth/cubit/auth_cubit.dart';
import 'package:my_app/feature/auth/view/LoginScreen.dart';
import 'package:my_app/feature/auth/view/RegisterScreen.dart';
import 'package:my_app/feature/auth/widgets/custom_button.dart';
import 'package:my_app/feature/auth/widgets/custom_icon.dart';
import 'package:my_app/feature/auth/widgets/custom_text.dart';
import 'package:my_app/feature/auth/widgets/custom_user_txt_field.dart';

class Registerscreen extends StatefulWidget {
  const Registerscreen({super.key});

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController numbercontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController comfirmpasswordcontroller =
      TextEditingController();
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
                  text: "Let’s, Create \nAccount",
                  fontSize: 38,
                  fontFamily: 'Luckiest_Guy',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(30),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomUserTxtField(
                      controller: emailcontroller,
                      keyboardType: TextInputType.emailAddress,
                      hintText: "Enter your email",
                      autofocus: true,
                      validator: MyValidators.emailValidator,
                    ),
                    Gap(20),
                    CustomUserTxtField(
                      controller: numbercontroller,
                      keyboardType: TextInputType.number,
                      hintText: "Enter your number",
                      autofocus: true,
                      validator: MyValidators.phoneValidator,
                    ),
                    Gap(20),
                    CustomUserTxtField(
                      controller: passwordcontroller,
                      keyboardType: TextInputType.visiblePassword,
                      hintText: "Enter your password",
                      autofocus: false,
                      validator: MyValidators.passwordValidator,
                    ),
                    Gap(20),
                    CustomUserTxtField(
                      controller: comfirmpasswordcontroller,
                      keyboardType: TextInputType.visiblePassword,
                      hintText: "Confirm your password",
                      autofocus: false,

                      validator: (value) =>
                          MyValidators.repeatPasswordValidator(
                            value: value,
                            password: passwordcontroller.text,
                          ),
                    ),
                  ],
                ),
              ),

              Gap(111),
              Center(
                child: BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSuccess) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Loginscreen()),
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
                              text: "Create Account",
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthCubit>().register(
                                    "tesffxfffuser",
                                    numbercontroller.text,
                                    "male",
                                    "12345678901234",
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

              Gap(25),
              Center(
                child: CustomText(
                  text: "Don’t have an Account? ",
                  clickableText: "Sign-Up",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Loginscreen()),
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
