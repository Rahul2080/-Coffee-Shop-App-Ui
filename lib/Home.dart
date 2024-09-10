import 'package:flutter/material.dart';
import 'ImageCarouselShowcase.dart';

class Coffee {
  final String title;
  final String image;
  final int price;
  final String description;

  Coffee(
      {required this.title,
      required this.image,
      required this.price,
      required this.description});
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController = PageController();

  final List<Coffee> coffeeList = [
    Coffee(
        title: "Caramel Frappuccino Blended",
        image: "assets/coffee1.png",
        price: 11,
        description:
            "Caramel syrup meets coffee, milk and ice for a rendezvous in the blender, while whipped cream and buttery caramel sauce layer the love on top. To change things up, try it affogato-style with a hot espresso shot poured right over the top."),
    Coffee(
        title: "Mocha Cookie Crumble Frappuccino",
        image: "assets/coffee2.png",
        price: 13,
        description:
            "Frappuccino® Roast coffee, mocha sauce and Frappuccino® chips blended with milk and ice, layered on top of whipped cream and chocolate cookie crumble and topped with vanilla whipped cream, mocha drizzle and even more chocolate cookie crumble. Each sip is as good as the last . . . all the way to the end."),
    Coffee(
        title: "Java Chip Frappuccino Blended Beverage",
        image: "assets/coffee3.png",
        price: 10,
        description:
            "We blend mocha sauce and Frappuccino® chips with coffee, milk and ice, then top it off with whipped cream and a mocha drizzle to bring you endless java joy."),
    Coffee(
        title: "Strawberry Crème Frappuccino",
        image: "assets/coffee4.png",
        price: 12,
        description:
            "Summer's favorite berry is the star of this delicious Frappuccino® Blended Beverage—a blend of ice, milk and strawberry puree layered on top of a splash of strawberry puree and finished with vanilla whipped cream."),
    Coffee(
        title: "Oreo Crème Frappuccino",
        image: "assets/coffee2.png",
        price: 18,
        description:
        " Cream Frappuccino, also called an Oreo Frappuccino, is a secret menu drink that’s made by blending java chips into a White Chocolate Creme Frappuccino. It’s topped off with whipped cream."),
    Coffee(
        title: "Peppermint Mocha Frappuccino",
        image: "assets/coffee1.png",
        price: 15,
        description:
        "A delectable blend of chocolate-pepperminty perfection in every cool sip—Frappuccino® Roast coffee, mocha sauce, peppermint-flavored syrup, milk and ice, topped with whipped cream and dark chocolate curls."),

    Coffee(
        title: "Strawberry Crème Frappuccino",
        image: "assets/coffee4.png",
        price: 12,
        description:
        " Starbucks strawberry drinks with strawberry juice, real strawberry puree and pieces of fruit. Here’s a list of top-ranked strawberry drinks on the Starbucks menu, seasonal summer menu, and some popular drink customizations."),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xff017b4a),
            ),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    height: 250,
                    width: 250,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, boxShadow: [
                      BoxShadow(
                          color: Colors.greenAccent.withOpacity(0.5),
                          blurRadius: 100,
                          spreadRadius: 100)
                    ]),
                  ),
                ),
                Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color(0xff024c3f)),
                            padding: const EdgeInsets.all(10),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundImage:
                                      AssetImage("assets/logo.png"),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "STARBUCKS",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 380,
                          width: double.infinity,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0xff0f5d43),
                                    blurRadius: 25,
                                    spreadRadius: -3)
                              ]),
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const SizedBox(
                                height: 25,
                              ),
                              Expanded(
                                child: SizedBox(
                                  child: PageView.builder(
                                      controller: pageController,
                                      scrollDirection: Axis.vertical,
                                      itemCount: coffeeList.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                text: '\$',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: coffeeList[index]
                                                          .price
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 32)),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              coffeeList[index].title,
                                              style: const TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              coffeeList[index].description,
                                              maxLines: 4,
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                              ),
                              Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.black,
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 25,
                                            spreadRadius: -3,
                                            offset: Offset(10, 10))
                                      ]),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "GET IT",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 16),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomImageCarousel(
            coffeeList: coffeeList,
            onPageChange: (index) {
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.elasticOut);
            },
          ),
        ],
      ),
    );
  }
}
