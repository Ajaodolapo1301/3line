import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liner/provider/weatherState.dart';
import 'package:liner/screens/home.dart';
import 'package:liner/screens/splashPage.dart';
import 'package:liner/screens/weekly.dart';
import 'package:liner/utils/sizeConfig/sizeConfig.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

import 'provider/appState.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  //
  // Hive.init(appDocumentDirectory.path);
  //
  // Hive.registerAdapter(UserAdapter());

  // await Hive.openBox("user");
  // final box = Hive.box("user");
  // User user = box.get('user', defaultValue: null);
  // final SharedPreferences sharedPref = await SharedPreferences.getInstance();
  // Future<bool> isFirstTime() async {
  //   var isFirstTime = sharedPref.getBool('first_time');
  //   if (isFirstTime != null && !isFirstTime) {
  //     sharedPref.setBool('first_time', false);
  //     return false;
  //   } else {
  //     sharedPref.setBool('first_time', false);
  //     return true;
  //   }
  // }


  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);





  runApp(
      DevicePreview(
          enabled: false,
          builder: (context) =>
              MultiProvider(
                  providers: [
                    ChangeNotifierProvider(create: (_) => AppState()),
                    ChangeNotifierProvider(create: (_) => WeatherState()),
                  ],
                  child: MyApp(

                  ))
      )
  );
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        return OrientationBuilder(
          builder: (context, orientation){
            SizeConfig().init(constraints, orientation);
            return OverlaySupport(
              child: GestureDetector(
                onTap: (){
                  FocusScopeNode currentFocus = FocusScope.of(context);

                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    currentFocus.focusedChild.unfocus();
                  }

                },
                child: MaterialApp(
                  title: 'Test',
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                      primarySwatch: Colors.blue,
                      fontFamily: 'inter',
                      primaryColor: Colors.blue //
                  ),

                  locale: DevicePreview.locale(context), // Add the locale here
                  // builder: DevicePreview.appBuilder,

                  home: SplashPage()
                ),
              ),
            );

          },
        );
      },
    );
  }
}


