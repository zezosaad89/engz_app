import 'package:engz_app/screens/auth/register_screen.dart';
import 'package:engz_app/shared/components/navigation.dart';
import 'package:engz_app/shared/network/local/cashe_helper.dart';
import 'package:engz_app/shared/theme/colors/light_color.dart';
import 'package:engz_app/shared/theme/icons/broken_icons.dart';
import 'package:engz_app/shared/widgets/my_text_form_filed.dart';
import 'package:engz_app/blocs/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../layout_screen.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
        if(state is SuccessUserLoginState){
          CacheHelper.putData(
              key: 'uId', value: state.uId).then((value){
            navigateEnd(context, EngzeLayOut());
          }).catchError((error){
            print(error.toString());
          });
        }
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Scaffold(
          backgroundColor: LightColors.kDarkYellow,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 40.0,
                        left: 20,
                        right: 20.0,
                        bottom: 30,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Login With Us',
                            style: TextStyle(
                              color: LightColors.kDarkBlue,
                              fontSize: 25,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              navigateTo(context, RegisterScreen());
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(
                                color: LightColors.kDarkBlue,
                                fontSize: 16,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: MyTextField(
                        controller: _emailController,
                        label: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'email must be not empty';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: MyTextField(
                        controller: _passwordController,
                        label: 'Password',
                        isPassword: true,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 7) {
                            return 'password must be 7 number';
                          }
                          return null;
                        },
                      ),
                    ),
                    Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 15.0),
                          child: Text(
                            'Forget Password ?',
                            style: TextStyle(
                              color: LightColors.kDarkBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              letterSpacing: 1.0,
                            ),
                          ),
                        )),
                    GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          cubit.userLogin(
                            email: _emailController.text,
                            password: _passwordController.text,
                            context: context,
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: LightColors.kDarkBlue,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(
                            child: Text(
                              'Login...',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    // Padding(
                    //   padding: const EdgeInsets.all(15.0),
                    //   child: TextFormField(
                    //     controller: _emailController,
                    //     decoration: InputDecoration(
                    //
                    //       labelText: 'Email',
                    //       prefixIcon: Icon(IconBroken.Send),
                    //       labelStyle: TextStyle(
                    //         color: LightColors.kDarkBlue,
                    //         letterSpacing: 1.0,
                    //       ),
                    //
                    //       border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey) , borderRadius: BorderRadius.circular(20.0)),
                    //       focusedBorder: OutlineInputBorder(borderSide:BorderSide(color: LightColors.kDarkBlue , width: 1.3) ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
