import 'package:dogether/common/routes/route.dart';
import 'package:dogether/common/utils/constants.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: ProviderScope(child: MyApp())));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  static final defaultDarkColorScheme = ColorScheme.fromSwatch(
    brightness: Brightness.dark,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        minTextAdapt: true,
        designSize: const Size(375, 825),
        builder: (context, child) {
          return DynamicColorBuilder(
              builder: (lightColorScheme, darkColorScheme) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Dogether',
              theme: ThemeData(
                scaffoldBackgroundColor: AppConst.prDark,
                colorScheme: darkColorScheme ?? defaultDarkColorScheme,
                useMaterial3: true,
              ),
              themeMode: ThemeMode.dark,
              routeInformationParser: goRouter.routeInformationParser,
              routeInformationProvider: goRouter.routeInformationProvider,
              routerDelegate: goRouter.routerDelegate,
            );
          });
        });
  }
}
