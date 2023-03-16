import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialprofitional/screens/home_screen.dart';
import '../shared/componens.dart';
import '../shared/cubits/register_cubit/register_cubit.dart';
import '../shared/cubits/register_cubit/register_states.dart';
var emailController=TextEditingController();
var passwordController=TextEditingController();
var nameController=TextEditingController();
var phoneController=TextEditingController();
var formKey=GlobalKey<FormState>();
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterStates>(
        listener: (context,state){
          if(state is RegisterSuccessCreateUserState)
            {
              pushAndRemove(context,HomeScreen());
            }
        },
        builder: (context,state)=>Scaffold(

            body: SafeArea(
              child: Container(
                margin: const EdgeInsets.all(2),
                width: 390,
                height: 780,
                decoration:decorOfMainContainer(),
                child: Center(
                  child: SingleChildScrollView(
                    child: Container(
                      height: 570,
                      width: 320,
                      decoration: decorOfContainer(),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              text(text: 'Register',font: 35),
                              const SizedBox(height: 20,),
                              textFormField(
                                controller: nameController,
                                  widget:const Icon(Icons.person,size: 30,color: Colors.black,),
                                  labelText: 'Name',
                                  hintText: 'Please Enter your Name',
                                  keyboardType: TextInputType.name,
                                  obscureText: false,
                                  textValidator: 'please enter your Name'
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
                                  widget:IconButton(
                                    icon:Icon(RegisterCubit.get(context).icon,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                    onPressed: (){
                                      RegisterCubit.get(context).changeIconPassword();
                                    },
                                  ),
                                  labelText: 'Password',
                                  hintText: 'Please Enter your Password',
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText:RegisterCubit.get(context).isNotVisible,
                                  textValidator: 'please enter your password'
                              ),
                              const SizedBox(height: 20,),
                              textFormField(
                                controller: phoneController,
                                  widget:const Icon(Icons.phone,size: 30,color: Colors.black,),
                                  labelText: 'Phone',
                                  hintText: 'Please Enter your Phone',
                                  keyboardType: TextInputType.phone,
                                  obscureText: false,
                                  textValidator: 'please enter your phone'
                              ),
                              const SizedBox(height: 20,),
                              Padding(
                                padding: const EdgeInsets.only(left: 85),
                                child: MaterialButton(
                                  color: Colors.indigoAccent,
                                  splashColor: Colors.white,
                                  padding: EdgeInsets.only(right: 5),
                                  onPressed:(){
                                      if(formKey.currentState!.validate())
                                        {
                                          RegisterCubit.get(context).userRegister(
                                              email: emailController.text,
                                              password: passwordController.text,
                                              name: nameController.text,
                                              phone: phoneController.text);
                                        }

                              },
                                  child:const Text('Register',style:  TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  )),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),

                                  ),
                                ),

                              ),
                            ],
                          ),
                        ),
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
