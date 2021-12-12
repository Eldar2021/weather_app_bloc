import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../route/route_name.dart';
import '../route/route.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: () {
        return MaterialApp(
          title: 'Material App',
          theme: ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoute().onGenerateRoute,
          initialRoute: RouteName.HOME,
        );
      },
    );
  }
}
