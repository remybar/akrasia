// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:akrasia/application/auth/auth_bloc.dart';
import 'package:akrasia/injection.dart';
import 'package:akrasia/ui/routes/router.gr.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => getIt<AuthBloc>()..add(const AuthCheckRequested()),
          ),
        ],
        child: MaterialApp(
          title: 'Akrasia',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            primaryColor: Colors.deepPurple[300],
            accentColor: Colors.blueAccent,
            // inputDecorationTheme:
            //     InputDecorationTheme(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          ),
          builder: ExtendedNavigator.builder<AkrasiaRouter>(
            router: AkrasiaRouter(),
          ),
          onGenerateRoute: AkrasiaRouter(),
        ));
  }
}
