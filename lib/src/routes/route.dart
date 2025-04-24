import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_it_all/src/features/Address/presentation/address_info_page.dart';
import 'package:shop_it_all/src/features/account/data/repository/auth_repository.dart';
import 'package:shop_it_all/src/features/account/presentation/change_between_login_signup.dart';
import 'package:shop_it_all/src/features/edit_interest/presentation/edit_interest_page.dart';
import 'package:shop_it_all/src/features/checkout/presentation/check_out_page.dart';
import 'package:shop_it_all/src/features/introduction/presentation/cake_page.dart';
import 'package:shop_it_all/src/features/introduction/presentation/irrelevant_page.dart';
import 'package:shop_it_all/src/features/introduction/presentation/welcome_page.dart';
import 'package:shop_it_all/src/features/introduction/presentation/work_with_page.dart';
import 'package:shop_it_all/src/features/page_navigation/presentation/page_nav.dart';
import 'package:shop_it_all/src/features/payment/presentation/payment_info_page.dart';
import 'package:shop_it_all/src/features/my_interest/presentation/my_interest_page.dart';
import 'package:shop_it_all/src/routes/route_names.dart';

import '../features/account/presentation/controller/current_user_controller.dart';
part 'route.g.dart';

@Riverpod(keepAlive: true)
GoRouter route(Ref ref) {

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (BuildContext context, GoRouterState state) async {
      final isAuthenticated = await ref.watch(currentUserControllerProvider.notifier).isLoggedIn();
      final currentPath = state.uri.path;

      // Handle authentication state
      if (isAuthenticated) {
        if (currentPath == '/') {
          return '/pageNav';
        }
      } else {
        // Redirect unauthorized users from protected routes
        if (currentPath.startsWith('/pageNav/checkout')) {
          return '/irrelevant/workWith/cake/account';
        }
      }

      // No redirect needed
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: RouteNames.intro.name,
        pageBuilder: (context, state) =>
            const MaterialPage(child: WelcomePage()),
      ),
      GoRoute(
        path: '/irrelevant',
        name: RouteNames.irrelevant.name,
        pageBuilder: (context, state) => MaterialPage(child: IrrelevantPage()),
        routes: [
          GoRoute(
            path: 'workWith',
            name: RouteNames.workWith.name,
            pageBuilder: (context, state) =>
                MaterialPage(child: WorkWithPage()),
            routes: [
              GoRoute(
                path: 'cake',
                name: RouteNames.cake.name,
                pageBuilder: (context, state) =>
                    MaterialPage(child: CakePage()),
                routes: [
                  GoRoute(
                    path: 'account',
                    name: RouteNames.account.name,
                    pageBuilder: (context, state) =>
                        const MaterialPage(child: ChangeBetweenLoginSignup()),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      // Main authenticated routes
      ShellRoute(
        builder: (context, state, child) => Scaffold(
          body: child,
        ),
        routes: [
          GoRoute(
            path: '/pageNav',
            name: RouteNames.pageNav.name,
            pageBuilder: (context, state) =>
                const MaterialPage(child: PageNav()),
            redirect: (context, state) {
              if (state.matchedLocation == RouteNames.account.name) {
                return RouteNames.pageNav.name; // Prevent going back to '/'
              }
              return null;
            },
            routes: [
              GoRoute(
                path: 'myInterest',
                name: RouteNames.interest.name,
                pageBuilder: (context, state) =>
                    const MaterialPage(child: MyInterestPage()),
              ),
              GoRoute(
                path: 'editInterest',
                name: RouteNames.editInterest.name,
                pageBuilder: (context, state) =>
                    const MaterialPage(child: EditInterestPage()),
              ),
              GoRoute(
                path: 'checkout',
                name: RouteNames.checkout.name,
                pageBuilder: (context, state) =>
                    const MaterialPage(child: CheckOutPage()),
                routes: [
                  GoRoute(
                    path: 'address',
                    name: RouteNames.address.name,
                    pageBuilder: (context, state) =>
                        const MaterialPage(child: AddressInfoPage()),
                  ),
                  GoRoute(
                    path: 'payment',
                    name: RouteNames.payment.name,
                    pageBuilder: (context, state) =>
                        const MaterialPage(child: PaymentInfoPage()),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
