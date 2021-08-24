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

class RegisterScreen extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SuccessCreateUserState) {
          CacheHelper.putData(key: 'uId', value: state.uId).then((value) {
            navigateEnd(context, EngzeLayOut());
          }).catchError((error) {
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
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: LightColors.kDarkBlue,
                          fontSize: 25,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: MyTextField(
                        controller: _nameController,
                        label: 'Name',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'name must be not empty';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: MyTextField(
                        controller: _passwordConfController,
                        label: 'Confirm Pass',
                        isPassword: true,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty ||
                              value != _passwordController.text) {
                            return 'password must be Confirmed';
                          }
                          return null;
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          _passwordConfController.clear();
                          cubit.userRegister(
                            email: _emailController.text,
                            password: _passwordController.text,
                            name: _nameController.text,
                            context: context,
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 30.0),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: LightColors.kDarkBlue,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(
                            child: Text(
                              'Register...',
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
