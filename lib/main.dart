import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'constants.dart';
import 'package:mobilerdev_project/extensions/locale_keys.dart';
import 'package:mobilerdev_project/extensions/string_extensions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      child: MyApp(),
      supportedLocales: AppConstant.SUPPORTED_LOCALE,
      path: AppConstant.LANG_PATH,
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      home: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.main_title.locale),
          backgroundColor: Colors.orange,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.main_bodytext.locale,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              IconLanguage()
            ],
          ),
        ),
      ),
    );
  }
}

class IconLanguage extends StatelessWidget {
  const IconLanguage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.language),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  actions: [
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              context.locale = AppConstant.ES_LOCALE;
                            },
                            child: Column(
                              children: [
                                Icon(Icons.language),
                                Text("es-ES"),
                              ],
                            )),
                        ElevatedButton(
                            onPressed: () {
                              context.locale = AppConstant.EN_LOCALE;
                            },
                            child: Column(
                              children: [
                                Icon(Icons.language),
                                Text("EN-US"),
                              ],
                            )),
                        ElevatedButton(
                            onPressed: () {
                              context.locale = AppConstant.TR_LOCALE;
                            },
                            child: Column(
                              children: [
                                Icon(Icons.language),
                                Text("TR"),
                              ],
                            )),
                        ElevatedButton(
                            onPressed: () {
                              context.locale = AppConstant.DE_LOCALE;
                            },
                            child: Column(
                              children: [
                                Icon(Icons.language),
                                Text("DE"),
                              ],
                            )),
                      ],
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => MyApp()));
                        },
                        child: Text("Ok"))
                  ],
                );
              });
        });
  }
}
