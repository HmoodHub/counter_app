import 'package:counter/screens/home_counter.dart';
import 'package:flutter/material.dart';
import 'counter_bloc/counter_imports.dart';
import 'package:counter/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppTheme.primaryColor,
          useMaterial3: true,
        ),
        home: HomeCounter(),
      ),
    );
  }
}
