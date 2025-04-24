
import 'package:flutter_test/flutter_test.dart';

import '../test/shop_it_all_robot.dart';

void main() {
  testWidgets('UI flow and transition from screen to screen', (tester) async {
    final shopItAllRobot = ShopItAllRobot(tester: tester);
    await shopItAllRobot.pumpShopItAllApp();

    await shopItAllRobot.theIntroSection();
    await shopItAllRobot.theIntroSection();
    await shopItAllRobot.theIntroSection();
    await shopItAllRobot.toAccount();

    await shopItAllRobot.clickCreateAccount();
    shopItAllRobot.expectationOfTheAccountPage();
    await shopItAllRobot.createAccount();

    await shopItAllRobot.loginToAccount();

    shopItAllRobot.expectFindAllProductCards();
    await shopItAllRobot.selectProductFromHome();
    await shopItAllRobot.addOneItemToCart();
    //await shopItAllRobot.backToHome();

    await shopItAllRobot.likeAndUnlike(atIndex: 0);
    await shopItAllRobot.likeAndUnlike(atIndex: 1);
    await shopItAllRobot.likeAndUnlike(atIndex: 2);
   // await shopItAllRobot.likeAndUnlike(atIndex: 3);

    await shopItAllRobot.showWishScreen();
    await shopItAllRobot.selectItemFromWish(atIndex: 0);
    await shopItAllRobot.addOneItemToCart();

    // await shopItAllRobot.showProfileScreen();
    // await shopItAllRobot.showEditInterestPage();
    // await shopItAllRobot.backToPrevious();
    // await shopItAllRobot.showMyInterestPage();
    // await shopItAllRobot.backToPrevious();
    // await shopItAllRobot.showCartScreen();

    // await shopItAllRobot.showOrderScreen();
    // await shopItAllRobot.placeYourOrder();
  });
}