import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/config.dart';
import 'presentation/provider/theme/theme_provider.dart';
import 'utils/util.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await PrefHelper.instance.init();
  DbHelper.instance.onInit();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
@override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouteProvider);
    final isdark = ref.watch(darkThemeProvider);
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return Builder(builder: (context) {
            return MaterialApp.router(
              routeInformationParser: appRouter.routeInformationParser,
              routerDelegate: appRouter.routerDelegate,
              routeInformationProvider: appRouter.routeInformationProvider,
              debugShowCheckedModeBanner: false,
              title: 'Base project',
              theme: Styles.themeData(isdark, context),
            );
          });
        });
  }
}
