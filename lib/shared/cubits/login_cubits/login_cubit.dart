import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialprofitional/shared/cubits/login_cubits/login_states.dart';

class LogInCubit extends Cubit<LogInStates>{
  LogInCubit():super(LogInInitialState());
  static LogInCubit get(context)=>BlocProvider.of(context);
  bool isNotVisible=true;
  IconData icon=Icons.visibility_off;
  void changeIconPassword()
  {
    isNotVisible=!isNotVisible;
    icon=isNotVisible?Icons.visibility_off:Icons.visibility;
    emit(ChangeIconVisibleState());
  }
}