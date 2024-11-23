import 'package:final_project/features/add_group/presentation/views/add_group.dart';
import 'package:final_project/features/login/presentation/views/login_screen.dart';
import 'package:final_project/features/register/presentation/views/register_screen.dart';
import 'package:final_project/features/show_files/presentation/views/show_files.dart';
import 'package:final_project/features/show_groups/presentation/views/groups_screen.dart';
import 'package:final_project/features/splash/presentation/views/splash_screen.dart';
import 'package:final_project/features/users/presentation/views/user_screen.dart';
import 'package:final_project/features/verify_code/presentation/views/verify_code_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kLoginPage = '/login-screen';
  static const kRegisterPage = '/register-screen';
  static const kVerifyCodePage = '/verify-screen';
  static const kAddGroupPage = '/add-group-screen';
  static const kGroupPage = '/group-screen';
  static const kUserPage = '/user-screen';
  static const kFilesPage = '/files-screen';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: kLoginPage,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: kRegisterPage,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
      path: AppRouter.kVerifyCodePage,
      builder: (context, state) {
        final String email = state.extra as String;
        return VerifyCodeScreen(email: email); // تمرير القيم إلى الصفحة الهدف
      },
    ),
      GoRoute(
        path: kAddGroupPage,
        builder: (context, state) => const AddGroupScreen(),
      ),
      GoRoute(
        path: kGroupPage,
        builder: (context, state) => const GroupScreen(),
      ),
      GoRoute(
        path: kUserPage,
        builder: (context, state) => const UserScreen(),
      ),
      GoRoute(
        path: kFilesPage,
        builder: (context, state) => const FilesScreen(),
      ),
    ],
  );
}
