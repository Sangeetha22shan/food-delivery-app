import 'package:flutter/material.dart';
import 'DrawerMenu.dart';
import 'colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final List<String> bannersList = [
    "https://images.pexels.com/photos/1624487/pexels-photo-1624487.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/7625056/pexels-photo-7625056.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/8983400/pexels-photo-8983400.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/14831540/pexels-photo-14831540.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/674574/pexels-photo-674574.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
  ];

  double transistionvalueX = 0.0;

  double transistionvalueY = 0.0;

  double scale = 1;

  bool toogle = false;
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DrawerMenu(),
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          transform:
              Matrix4.translationValues(transistionvalueX, transistionvalueY, 0)
                ..scale(scale),
          child: ClipRRect(
            borderRadius:
                (toogle) ? BorderRadius.circular(20) : BorderRadius.circular(0),
            child: Scaffold(
              body: Padding(
                padding: EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                toogle = !toogle;
                                if (toogle) {
                                  transistionvalueX = 200;
                                  transistionvalueY = 80;
                                  scale = 0.8;
                                  _animationController.forward();
                                } else {
                                  transistionvalueX = 0;
                                  transistionvalueY = 0;
                                  scale = 1;
                                  _animationController.reverse();
                                }§
                                ;
                                setState(() {});
                              },
                              icon: AnimatedIcon(
                                  icon: AnimatedIcons.menu_arrow,
                                  color: Colors.black,
                                  progress: _animationController),
                              // icon: Icon(
                              //   Icons.menu,
                              //   color: Colors.black,
                              // ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Delivering to',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      ?.copyWith(color: Colors.black45),
                                  //style: TextStyle(fontSize: 15.0, color: Colors.black45),
                                ),
                                InkWell(
                                  onTap: () {
                                    print('Clicked');
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Current location',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 30.0,
                                        color: primaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 45,
                                    margin: EdgeInsets.symmetric(vertical: 5),
                                    padding: EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Material(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(30),
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(30),
                                        onTap: () {},
                                        child: Row(
                                          children: [
                                            Icon(Icons.search),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'Search Foods',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1
                                                  ?.copyWith(
                                                      color: Colors.black45),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.filter_list_alt,
                                  size: 30.0,
                                  color: primaryColor,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Category',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                            ),
                            Container(
                              height: 115,
                              child: ListView.builder(
                                itemCount: listCards.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(17),
                                        margin: EdgeInsets.only(
                                            top: 5,
                                            bottom: 2,
                                            right: 5,
                                            left: 8),
                                        height: 70,
                                        width: 70,
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.green.withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        child: Image.asset(
                                            listCards[index].imageUrl),
                                      ),
                                      Text(
                                        listCards[index].title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2
                                            ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Text(
                              'Popular',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                            ),
                            for (int i = 0; i < bannersList.length; i++) ...{
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 15),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade300,
                                        blurRadius: 5,
                                        spreadRadius: 5),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 220,
                                      margin: EdgeInsets.only(bottom: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                        image: DecorationImage(
                                            image: NetworkImage(bannersList[i]),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        list[i].foodName,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: primaryColor,
                                          ),
                                          Text(
                                            list[i].rating.toString(),
                                            style:
                                                TextStyle(color: primaryColor),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text("("),
                                          Text(list[i].ratingCount.toString()),
                                          SizedBox(width: 5),
                                          Text("rating)"),
                                          Spacer(),
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(list[i].hotelName),
                                          ),
                                          Text("Rs."),
                                          Text(list[i].amount.toString()),
                                          SizedBox(
                                            height: 5,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            },
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryModel {
  String imageUrl;
  String title;
  String? remoteUrl;
  CategoryModel({required this.imageUrl, required this.title, this.remoteUrl});
}

List<CategoryModel> listCards = [
  CategoryModel(imageUrl: "images/gift.png", title: "Offers"),
  CategoryModel(imageUrl: "images/drink.png", title: "Drinks"),
  CategoryModel(imageUrl: "images/ramen.png", title: "Asian"),
  CategoryModel(imageUrl: "images/pizza.png", title: "Pizza"),
  CategoryModel(imageUrl: "images/burger.png", title: "Burger"),
];

class PopularProducts {
  String foodName;
  double rating;
  int ratingCount;
  String hotelName;
  int amount;
  PopularProducts(
      {required this.foodName,
      required this.rating,
      required this.ratingCount,
      required this.hotelName,
      required this.amount});
}

List<PopularProducts> list = [
  PopularProducts(
      foodName: "Biriyani",
      rating: 4.5,
      ratingCount: 128,
      hotelName: "SS Hydrebad Biriyani",
      amount: 250),
  PopularProducts(
      foodName: "Naan and Paneer Gravy",
      rating: 5,
      ratingCount: 103,
      hotelName: "Anna Poorna",
      amount: 380),
  PopularProducts(
      foodName: "Chicken Tandoori",
      rating: 4,
      ratingCount: 58,
      hotelName: "Royal Fast Food",
      amount: 180),
  PopularProducts(
      foodName: "Combo Idly Set",
      rating: 4.8,
      ratingCount: 201,
      hotelName: "Geetha Canteen",
      amount: 130),
  PopularProducts(
      foodName: "Rice and Kurma",
      rating: 3,
      ratingCount: 12,
      hotelName: "Selvam",
      amount: 100)
];
