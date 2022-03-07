import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:papr_clip_task/injection_container.dart';
import 'package:papr_clip_task/presentation/bloc/reel_bloc.dart';
import 'package:papr_clip_task/presentation/pages/reels_page.dart';
import 'package:papr_clip_task/presentation/widgets/splash_screen_widget.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ReelBloc>(
      create: (_) => sl<ReelBloc>(),
      child: MaterialApp(
        title: 'Flix',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreenWidget(nextChild: ReelsPage()),
      ),
    );
  }
}
