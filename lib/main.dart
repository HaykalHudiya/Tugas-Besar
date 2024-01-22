import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_tugas_besar/bloc/Khs/khs_bloc.dart';
import 'package:flutter_template_tugas_besar/data/datasource/auth_local_datasource.dart';
import 'package:flutter_template_tugas_besar/pages/auth/auth_page.dart';
import 'package:flutter_template_tugas_besar/pages/mahasiswa/mahasiswa_page.dart';
// import 'pages/auth/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder<bool>(
        future: AuthLocalDatasource().isLogin(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!) {
            return BlocProvider(
              create: (context) => KhsBloc(),
              child: const MahasiswaPage(),
            );
          } else {
            return const AuthPage();
          }
        },
      ),
      // home: const SplashPage(),
    );
  }
}
