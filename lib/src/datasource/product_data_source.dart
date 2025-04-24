import 'package:shop_it_all/src/features/home/domain/product_model.dart';

class ProductDataSource {
  static List<ProductModel> productList = [
    ProductModel(
        productId: '1',
        productImage: 'assets/images/product_images/xbox360.png',
        productName: 'Xbox 360',
        productPrice: 500.00,
        productDescription:
            'The Xbox 360 is a home video game console developed by Microsoft '
            'and released in 2005 as the successor to the original Xbox.'),
    ProductModel(
        productId: '2',
        productImage: 'assets/images/product_images/Cardigan.png',
        productName: 'Cardigan',
        productPrice: 60.00,
        productDescription:
            'A cardigan is a type of knitted sweater or jacket that opens in '
            'the front'),
    ProductModel(
        productId: '3',
        productImage: 'assets/images/product_images/blueHoodie.png',
        productName: 'Eagle Hoodie',
        productPrice: 180.00,
        productDescription:
            'A hoodie is a casual sweatshirt or jacket that features a hood at'
            ' the back, often with drawstrings to adjust the fit'),
    ProductModel(
        productId: '4',
        productImage: 'assets/images/product_images/pinkKimono.png',
        productName: 'Kimono',
        productPrice: 350.00,
        productDescription:
            'A kimono is a traditional Japanese garment characterized by its'
            ' T-shaped, wrap-around design, long sleeves, and wide sash '
            'tied around the waist'),
    ProductModel(
        productId: '5',
        productImage: 'assets/images/product_images/SummerDress.png',
        productName: 'Summer Dress',
        productPrice: 120.00,
        productDescription:
            'A summer dress is typically characterized by its lightweight'
                ' fabrics, breezy silhouettes, and vibrant colors or playful '
                'prints, designed for comfort and style in warm weather'),
    ProductModel(
        productId: '6',
        productImage: 'assets/images/product_images/blackTShirt.png',
        productName: 'T Shirt',
        productPrice: 105.00,
        productDescription:
            'T-Shirt is designed for comfort and versatility, often worn '
                'as an everyday garment'),
    ProductModel(
        productId: '7',
        productImage: 'assets/images/product_images/blueCar.png',
        productName: 'Blue Car',
        productPrice: 89000.00,
        productDescription:
            'Chrome accents around the grille, headlights, and windscreen.'
                ' A small, elegant badge on the hood.'),
    ProductModel(
        productId: '8',
        productImage: 'assets/images/product_images/GameBoy.png',
        productName: 'Game boy',
        productPrice: 275.99,
        productDescription:
            'The Game Boy is a handheld game console developed by Nintendo'),
    ProductModel(
        productId: '9',
        productImage: 'assets/images/product_images/tShirt.png',
        productName: 'Grey T-Shirt',
        productPrice: 49.50,
        productDescription:
            'T-Shirt is designed for comfort and versatility, often worn '
            'as an everyday garment'),
    ProductModel(
        productId: '10',
        productImage: 'assets/images/product_images/sportShoes.png',
        productName: 'Nike Shoe',
        productPrice: 250.00,
        productDescription:
            'A shoe is a type of footwear designed to protect and provide '
            'comfort to the feet while walking, running, or standing'),
    ProductModel(
        productId: '11',
        productImage: 'assets/images/product_images/earBud.png',
        productName: 'Ear Phones',
        productPrice: 130.99,
        productDescription:
            'Earbuds are compact audio devices designed to fit snugly in the '
                'outer ear, allowing users to listen to music, podcasts, or '
                'other audio content privately'),
    ProductModel(
        productId: '12',
        productImage: 'assets/images/product_images/oneJeans.png',
        productName: 'Jeans',
        productPrice: 29.99,
        productDescription:
            'Jeans are a type of pants made from denim or dungaree fabric, '
            'known for their durability and versatility.'),
    ProductModel(
        productId: '13',
        productImage: 'assets/images/product_images/TwoPoloShirt.png',
        productName: 'polo TShirt',
        productPrice: 90.99,
        productDescription:
        'A polo T-shirt is a short-sleeved, collared shirt that blends '
            'casual and semi-formal styles.'),
    ProductModel(
        productId: '14',
        productImage: 'assets/images/product_images/redHeadSet.png',
        productName: 'Red HeadSet',
        productPrice: 210.00,
        productDescription:
        'A headset is a versatile audio device that combines headphones '
            'and a microphone, allowing users to listen to audio and communicate'
            ' hands-free.'),
    ProductModel(
        productId: '15',
        productImage: 'assets/images/product_images/blueHeadSet.png',
        productName: 'Blue Headset',
        productPrice: 250.00,
        productDescription:
        'A headset is a versatile audio device that combines headphones '
            'and a microphone, allowing users to listen to audio and communicate'
            ' hands-free.'),
    ProductModel(
        productId: '16',
        productImage: 'assets/images/product_images/GamingPc.png',
        productName: 'Gaming PC',
        productPrice: 4600.00,
        productDescription:
        'A gaming PC, or gaming computer, is a specialized personal computer '
            'designed to deliver high-performance gaming experiences.'),
    ProductModel(
        productId: '17',
        productImage: 'assets/images/product_images/greenDress.png',
        productName: 'Ball Dress',
        productPrice: 5500.00,
        productDescription:
        'A ball dress, commonly referred to as a ball gown, is a type of formal '
            'attire designed for grand occasions such as balls or formal dances'),
    ProductModel(
        productId: '18',
        productImage: 'assets/images/product_images/manyJeans.png',
        productName: 'Jeans Collection',
        productPrice: 3000.00,
        productDescription:
        'Jeans are a type of pants made from denim or dungaree fabric, '
            'known for their durability and versatility. '),
    ProductModel(
        productId: '19',
        productImage: 'assets/images/product_images/onePoloShirt.png',
        productName: 'Polo T Shirt',
        productPrice: 210.00,
        productDescription:
        'A polo T-shirt is a short-sleeved, collared shirt that blends '
            'casual and semi-formal styles.'),
    ProductModel(
        productId: '20',
        productImage: 'assets/images/product_images/PlayStation.png',
        productName: 'PlayStation 4',
        productPrice: 390.00,
        productDescription:
        'PlayStation is a prominent video gaming brand owned by Sony '
            'Interactive Entertainment (SIE)'),
    ProductModel(
        productId: '21',
        productImage: 'assets/images/product_images/redCar.png',
        productName: 'Benes Car',
        productPrice: 20500.00,
        productDescription:
        'Chrome accents around the grille, headlights, and windscreen. '
            'A small, elegant badge on the hood.'),
  ];
}
