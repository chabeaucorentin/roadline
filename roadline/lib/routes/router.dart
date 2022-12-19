import 'package:flutter/material.dart';
import 'package:roadline/routes/routes.dart';
import 'package:roadline/screens/home.dart';
import 'package:roadline/screens/login.dart';
import 'package:roadline/screens/projects.dart';
import 'package:roadline/screens/register.dart';
import 'package:roadline/screens/reset_password.dart';
import 'package:roadline/screens/tasks.dart';

Map<String, WidgetBuilder> router = {
  kLoginRoute: (context) => Login(),
  kRegisterRoute: (context) => Register(),
  kResetPasswordRoute: (context) => ResetPassword(),
  kHomeRoute: (context) => Home(),
  kProjectsRoute: (context) => Projects(),
  kTasksRoute: (context) => Tasks(),
};
