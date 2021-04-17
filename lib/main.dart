import 'package:flutter/material.dart';
import 'package:flutter_chat_socket/src/app.dart';
import 'package:flutter_chat_socket/src/common/app_initializer.dart';
import 'package:flutter_chat_socket/src/common/dependecy_injection.dart';
import 'package:flutter_chat_socket/src/services/socket_service.dart';
import 'package:flutter_chat_socket/src/shared/logger/logger_utils.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:get/get_navigation/get_navigation.dart';

Injector injector = Injector();

void main() async {
  DependencyInjection().initialise(injector);
  //injector = injector;
  await AppInitializer().initialise(injector);
  final SocketService socketService = injector.get<SocketService>();
  socketService.createSocketConnection();
  runApp(
    GetMaterialApp(
      enableLog: true,
      logWriterCallback: Logger.write,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Chat Realtime',
      home: App(),
    ),
  );
}
