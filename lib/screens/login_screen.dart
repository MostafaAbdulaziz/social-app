import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialprofitional/screens/register_screen.dart';


import '../shared/componens.dart';
import '../shared/cubits/login_cubits/login_cubit.dart';
import '../shared/cubits/login_cubits/login_states.dart';
var emailController=TextEditingController();
var passwordController=TextEditingController();
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>LogInCubit(),
      child: BlocConsumer<LogInCubit,LogInStates>(
        listener: (context,state){},
        builder: (context,state)=>Scaffold(
            body: SafeArea(
              child: Container(
                margin: const EdgeInsets.all(2),
                width: 390,
                height: 780,
                decoration: decorOfMainContainer(),
                child: Center(
                  child: Container(
                    height: 450,
                    width: 320,
                    decoration: decorOfContainer(),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          text(text: 'LOGIN',font: 35),
                          const SizedBox(height: 10,),
                          text(
                              text: 'login now to browse our hot offers',
                              color: Colors.white.withOpacity(0.5)
                          ),
                          const SizedBox(height: 20,),
                          textFormField(
                            controller: emailController,
                              widget:const Icon(Icons.email,size: 30,color: Colors.black,),
                              labelText: 'Email',
                              hintText: 'Please Enter your Email',
                              keyboardType: TextInputType.emailAddress,
                              obscureText: false,
                            textValidator: 'please enter your email'
                          ),
                          const SizedBox(height: 20,),
                          textFormField(
                            controller: passwordController,
                              widget: IconButton(
                                  icon:Icon(LogInCubit.get(context).icon,
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                onPressed: (){
                                  LogInCubit.get(context).changeIconPassword();
                                },
                              ),
                              labelText: 'Password',
                              hintText: 'Please Enter your Password',
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: LogInCubit.get(context).isNotVisible,
                              textValidator: 'please enter your password'
                          ),
                          const SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.only(left: 70),
                            child: materialButton(
                              text: 'LOGIN',
                              icon:null,
                              width: 100,
                              function: (){}
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              text(
                                  text: 'are you don\'t have an account',
                                  color: Colors.black
                              ),
                              textButton(
                                  text: 'Register',
                                  screen: const RegisterScreen(),
                                  context: context)
                            ]
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              materialButton(
                                text: 'Facebook',
                                icon: Icons.facebook,
                                width: 120,
                                function: (){}
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              materialButton(
                                  text: 'Google',
                                  icon: Icons.g_mobiledata_rounded,
                                width: 100,
                                  function: (){}
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
        ),
      ),
    );
  }
}
