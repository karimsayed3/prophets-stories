import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim/business_test/cubit/bloc_test_cubit.dart';
import 'package:muslim/injection.dart';
import 'package:muslim/presentation/screens/home_screen.dart';
import 'package:device_preview/device_preview.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initGetIt();
  // runApp(DevicePreview(builder: (context) => MyApp(),));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
       create: (context) => getIt<BlocTestCubit>(),
      child: const MaterialApp(
        // builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        home:  UiTest(),
      ),
    );
  }
}