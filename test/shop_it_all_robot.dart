import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shop_it_all/main.dart';
import 'package:shop_it_all/src/common_widgets/add_button.dart';
import 'package:shop_it_all/src/common_widgets/product_card.dart';
import 'package:shop_it_all/src/constants/shop_it_keys.dart';
import 'package:shop_it_all/src/features/account/presentation/signup_page.dart';


class ShopItAllRobot {
  ShopItAllRobot({required this.tester});

  final WidgetTester tester;

  Future<void> pumpShopItAllApp() async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));
    await tester.pumpAndSettle();
  }
  
  Future<void> theIntroSection () async {
    final goId = find.byType(AddButton);
    expect(goId, findsOneWidget);
    await tester.tap(goId);
    await tester.pumpAndSettle();
  }

  Future<void> toAccount () async {
    final findId = find.byKey(ShopItKeys.goToAccountKey);
    expect(findId, findsOneWidget);
    await tester.tap(findId);
    await tester.pumpAndSettle();
  }

  Future<void> showWishScreen() async {
    final wishBtnId = find.byKey(ShopItKeys.wishBtnKey);
    expect(wishBtnId, findsOneWidget);
    await tester.tap(wishBtnId);
    await tester.pumpAndSettle();
  }

  Future<void> clickCreateAccount () async {
    final newAcc = find.byKey(ShopItKeys.changeBtwBtnKey);
    expect(newAcc, findsOneWidget);
    await tester.tap(newAcc);
    await tester.pumpAndSettle();
  }

  void expectationOfTheAccountPage () {
    expect(find.byType(SignupPage), findsOneWidget);
  }

  Future<void> enterEmail(Key email) async {
    final emailId = find.byKey(email);
    expect(emailId, findsOneWidget);
    await tester.enterText(emailId, 'john@mail.com.gh');
  }

  Future<void> enterPassword(Key password) async {
    final passwordId = find.byKey(password);
    expect(passwordId, findsOneWidget);
    await tester.enterText(passwordId, 'qwerty');
  }

  Future<void> createAccount () async {
    await enterEmail(ShopItKeys.emailFieldKey);
    await enterPassword(ShopItKeys.passwordFieldKey);
    final loginId = find.byKey(ShopItKeys.signupOrLoginBtn);
    expect(loginId, findsOneWidget);
    await tester.tap(loginId);
    await tester.pumpAndSettle(Duration(seconds: 5));
  }

  Future<void> loginToAccount () async {
    await enterEmail(ShopItKeys.emailInputKey);
    await enterPassword(ShopItKeys.passwordInputKey);
    final loginId = find.byKey(ShopItKeys.signupOrLoginBtn);
    expect(loginId, findsOneWidget);
    await tester.tap(loginId);
    await tester.pumpAndSettle(Duration(seconds: 5));
  }


  Future<void> showProfileScreen() async {
    final profileId = find.byKey(ShopItKeys.profileBtnKey);
    expect(profileId, findsOneWidget);
    await tester.tap(profileId);
    await tester.pumpAndSettle(Duration(seconds: 5));
  }

  Future<void> showCartScreen() async {
    final cartId = find.byKey(ShopItKeys.cartBtnKey);
    expect(cartId, findsOneWidget);
    await tester.tap(cartId);
    await tester.pumpAndSettle();
  }

  Future<void> likeAndUnlike({required int atIndex}) async {
    final likeBtnId = find.byKey(ShopItKeys.likeBtnKey);
    expect(likeBtnId, findsAny);
     await tester.tap(likeBtnId.at(atIndex));
    await tester.pump(Duration(seconds: 5));
  }

  Future<void> selectProductFromHome({int atIndex = 0}) async {
    final productBtnId = find.byKey(ShopItKeys.productCardKey);
    expect(productBtnId, findsWidgets);
    await tester.tap(productBtnId.at(atIndex));
    await tester.pumpAndSettle();
  }

  Future<void> selectItemFromWish ({required int atIndex}) async {
    final addBtnId = find.byIcon(Icons.shopping_cart_outlined);
    expect(addBtnId, findsAtLeast(1));
    await tester.tap(addBtnId.at(atIndex));
    await tester.pumpAndSettle();
  }
  
  Future<void> addOneItemToCart () async {
    final addCartId = find.byKey(ShopItKeys.addToCartKey);
    expect(addCartId, findsOneWidget);
    await tester.tap(addCartId);
    await tester.pumpAndSettle(Duration(seconds: 5));
  }

  Future<void> backToHome() async {
    final backId = find.byKey(ShopItKeys.backBtnKey);
    expect(backId, findsOneWidget);
    await tester.tap(backId);
    await tester.pumpAndSettle();
  }

  void expectFindAllProductCards() {
    final finder = find.byType(ProductCard);
    expect(finder, findsAtLeast(1));
  }

  void expectFindNProductCards(int count) {
    final finder = find.byType(ProductCard);
    expect(finder, findsNWidgets(count));
  }

  Future<void> showEditInterestPage() async {
    final editId = find.byKey(ShopItKeys.interestEditBtnKey);
    expect(editId, findsAtLeast(1));
    await tester.tap(editId);
    await tester.pumpAndSettle(Duration(seconds: 5));
  }

  Future<void> backToPrevious() async {
    final backArrowId = find.byIcon(Icons.arrow_back);
    expect(backArrowId, findsOneWidget);
    await tester.tap(backArrowId);
    await tester.pumpAndSettle();
  }

  Future<void> showMyInterestPage() async {
    final singleId = find.byKey(ShopItKeys.singleContainerKey);
    expect(singleId, findsAtLeast(1));
    await tester.tap(singleId);
    await tester.pumpAndSettle();
  }

  Future<void> showOrderScreen () async {
    final checkoutId = find.byKey(ShopItKeys.checkoutBtnKey);
    expect(checkoutId, findsOneWidget);
    await tester.tap(checkoutId);
    await tester.pumpAndSettle();
  }

  Future<void> placeYourOrder () async {
    final orderId = find.byKey(ShopItKeys.placeBtnKey);
    expect(orderId, findsOneWidget);
    await tester.tap(orderId);
    await tester.pumpAndSettle();
  }

}