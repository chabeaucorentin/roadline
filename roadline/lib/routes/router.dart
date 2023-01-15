import 'package:flutter/material.dart';
import 'package:roadline/routes/routes.dart';
import 'package:roadline/screens/add_task.dart';
import 'package:roadline/screens/home.dart';
import 'package:roadline/screens/login.dart';
import 'package:roadline/screens/new_project.dart';
import 'package:roadline/screens/profile.dart';
import 'package:roadline/screens/projects.dart';
import 'package:roadline/screens/register.dart';
import 'package:roadline/screens/reset_password.dart';
import 'package:roadline/screens/tasks.dart';

Map<String, WidgetBuilder> router = {
  kLoginRoute: (context) => LoginScreen(),
  kRegisterRoute: (context) => RegisterScreen(),
  kResetPasswordRoute: (context) => ResetPasswordScreen(),
  kHomeRoute: (context) => HomeScreen(),
  kProjectsRoute: (context) => ProjectsScreen(),
  kNewProjectRoute: (context) => NewProjectScreen(),
  kTasksRoute: (context) => TasksScreen(),
  kAddTaskRoute: (context) => AddTaskScreen(),
  kProfileRoute: (context) => ProfileScreen(),
};
