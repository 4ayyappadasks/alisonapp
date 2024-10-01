import 'package:alisonprojects/Controller/homescreenController/homeScree_Controller.dart';
import 'package:alisonprojects/main.dart';
import 'package:alisonprojects/utils/color.dart';
import 'package:alisonprojects/view/bottomsheet/bottomnav.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeScreenController());
    //final CarouselController _carouselController = CarouselController();
    return Scaffold(
      bottomNavigationBar: BtmNav(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        leading: Image.asset("images/swanimage.png"),
        actions: [
          Icon(Icons.search),
          SizedBox(
            width: MyApp.width * .05,
          ),
          Obx(
            () => controller.homedataloading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(Icons.favorite),
                      Positioned(
                        top: -4, // Adjust top position
                        right: -4, // Adjust right position
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Text(
                            "${controller.homedata?.wishlistcount}",
                            style: GoogleFonts.aBeeZee(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
          SizedBox(
            width: MyApp.width * .05,
          ),
          Obx(
            () => controller.homedataloading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(Icons.card_travel),
                      Positioned(
                        top: -4,
                        right: -4,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Text(
                            "${controller.homedata?.cartcount}",
                            style: GoogleFonts.aBeeZee(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
          SizedBox(
            width: MyApp.width * .05,
          ),
        ],
      ),
      body: Obx(
        () => controller.homedataloading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: MyApp.width,
                          height: MyApp.height * .3,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://swan.alisonsnewdemo.online/images/banner/${controller.homedata?.banner1[0].image}"))),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: MaterialButton(
                              shape: OutlineInputBorder(
                                  borderSide: BorderSide(color: appwhitecolor),
                                  borderRadius: BorderRadius.circular(35)),
                              onPressed: () {},
                              child: Text(
                                "Shop Now",
                                style: TextStyle(color: appwhitecolor),
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: MyApp.height * .02,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Our Brands",
                            style: GoogleFonts.aBeeZee(
                                color: appblackcolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            "View All",
                            style: GoogleFonts.aBeeZee(
                                color: appprimary,
                                fontWeight: FontWeight.w100,
                                fontSize: 15,
                                decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MyApp.width,
                      height: MyApp.height * .3,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.homedata?.recentviews.length ?? 0,
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              Container(
                                height: MyApp.height * .5,
                                width: MyApp.width * .3,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            "https://swan.alisonsnewdemo.online/images/product/${controller.homedata?.recentviews[index].image}"))),
                              ),
                              Positioned.fill(
                                  child: Center(
                                child: Text(
                                  "${controller.homedata?.recentviews[index].manufacturer}",
                                  style: GoogleFonts.aBeeZee(
                                      fontWeight: FontWeight.bold,
                                      color: appwhitecolor,
                                      fontSize: 15),
                                ),
                              ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MyApp.height * .02,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Our Products",
                            style: GoogleFonts.aBeeZee(
                                color: appblackcolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            "View All",
                            style: GoogleFonts.aBeeZee(
                                color: appprimary,
                                fontWeight: FontWeight.w100,
                                fontSize: 15,
                                decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MyApp.width,
                      height: MyApp.height * .6,
                      child: CarouselSlider.builder(
                        itemCount: controller.homedata?.ourProducts.length ?? 0,
                        options: CarouselOptions(
                          height: MyApp.height * .5,
                          autoPlay: false,
                          enlargeCenterPage: true,
                          viewportFraction: .5,
                          aspectRatio: .5,
                          enableInfiniteScroll: true,
                          scrollPhysics: BouncingScrollPhysics(),
                        ),
                        itemBuilder: (context, index, realIndex) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: MyApp.height * .3,
                                      width: MyApp.width * .3,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            "https://swan.alisonsnewdemo.online/images/product/${controller.homedata?.ourProducts[index].image}",
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: controller
                                                    .homedata
                                                    ?.ourProducts[index]
                                                    .wishlist ==
                                                0
                                            ? Icon(Icons.favorite_border)
                                            : Icon(Icons.favorite),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  "${controller.homedata?.ourProducts[index].store}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Text(
                                  "${controller.homedata?.ourProducts[index].price}",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Suggested For You",
                            style: GoogleFonts.aBeeZee(
                                color: appblackcolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            "View All",
                            style: GoogleFonts.aBeeZee(
                                color: appprimary,
                                fontWeight: FontWeight.w100,
                                fontSize: 15,
                                decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MyApp.height * .02,
                    ),
                    SizedBox(
                      width: MyApp.width,
                      height: MyApp.height * .6,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            controller.homedata?.suggestedProducts.length ?? 0,
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: MyApp.height * .4,
                                    width: MyApp.width * .4,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          "https://swan.alisonsnewdemo.online/images/product/${controller.homedata?.suggestedProducts[index].image}",
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    child: IconButton(
                                      onPressed: () {
                                        // Add your logic for wishlist here
                                      },
                                      icon: controller
                                                  .homedata
                                                  ?.suggestedProducts[index]
                                                  .wishlist ==
                                              0
                                          ? Icon(Icons.favorite_border)
                                          : Icon(Icons.favorite),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                "${controller.homedata?.suggestedProducts[index].store}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                "${controller.homedata?.suggestedProducts[index].price}",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Transform.rotate(
                      angle: 0.089066,
                      child: Container(
                          height: MyApp.height * .08,
                          width: MyApp.width * 1.5,
                          color: appprimary,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Center(
                                child: Text(
                              "New Arrival * ",
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 20, color: appwhitecolor),
                            )),
                          )),
                    ),
                    SizedBox(
                      height: MyApp.height * .02,
                    ),
                    SizedBox(
                      width: MyApp.width,
                      height: MyApp.height * 1,
                      child: MasonryGridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                            controller.homedata!.suggestedProducts.length > 4
                                ? 4
                                : controller.homedata?.suggestedProducts.length,
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Material(
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              "https://swan.alisonsnewdemo.online/images/product/${controller.homedata?.suggestedProducts[index].image}",
                                            ),
                                          ),
                                        ),
                                        height: (index % 2 == 0)
                                            ? MyApp.height * .3
                                            : MyApp.height * .4,
                                      ),
                                      elevation: 5,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    Positioned(
                                      right: 0,
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: controller
                                                    .homedata
                                                    ?.suggestedProducts[index]
                                                    .wishlist ==
                                                0
                                            ? Icon(Icons.favorite_border)
                                            : Icon(Icons.favorite),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  "${controller.homedata?.suggestedProducts[index].store}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Text(
                                  "${controller.homedata?.suggestedProducts[index].price}",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: MyApp.height * .02,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "View All",
                          style: GoogleFonts.aBeeZee(
                              color: appprimary,
                              fontWeight: FontWeight.w100,
                              fontSize: 15,
                              decoration: TextDecoration.underline),
                        )),
                    SizedBox(
                      height: MyApp.height * .02,
                    ),
                    SizedBox(
                      width: MyApp.width,
                      height: MyApp.height * .6,
                      child: CarouselSlider.builder(
                        options: CarouselOptions(
                          height: MyApp.height * 0.7,
                          aspectRatio: .1,
                          viewportFraction: .5,
                          enlargeCenterPage: true,
                          autoPlay: false,
                          autoPlayInterval: Duration(seconds: 3),
                          scrollPhysics: BouncingScrollPhysics(),
                        ),
                        itemCount: controller.homedata?.recentviews.length ?? 0,
                        itemBuilder: (context, index, realIndex) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              Container(
                                height: MyApp.height * .5,
                                width: MyApp.width * .9,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            "https://swan.alisonsnewdemo.online/images/product/${controller.homedata?.recentviews[index].image}"))),
                              ),
                              Positioned.fill(
                                  child: Center(
                                child: Text(
                                  "${controller.homedata?.recentviews[index].manufacturer}",
                                  style: GoogleFonts.aBeeZee(
                                      fontWeight: FontWeight.bold,
                                      color: appwhitecolor,
                                      fontSize: 15),
                                ),
                              ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Bestsellers",
                            style: GoogleFonts.aBeeZee(
                                color: appblackcolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            "View All",
                            style: GoogleFonts.aBeeZee(
                                color: appprimary,
                                fontWeight: FontWeight.w100,
                                fontSize: 15,
                                decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MyApp.width,
                      height: MyApp.height * .6,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.homedata?.bestSeller.length ?? 0,
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: MyApp.height * .4,
                                    width: MyApp.width * .4,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          "https://swan.alisonsnewdemo.online/images/product/${controller.homedata?.bestSeller[index].image}",
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    child: IconButton(
                                      onPressed: () {
                                        // Add your logic for wishlist here
                                      },
                                      icon: controller
                                                  .homedata
                                                  ?.bestSeller[index]
                                                  .wishlist ==
                                              0
                                          ? Icon(Icons.favorite_border)
                                          : Icon(Icons.favorite),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                "${controller.homedata?.bestSeller[index].store}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                "${controller.homedata?.bestSeller[index].price}",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Trending Categories",
                            style: GoogleFonts.aBeeZee(
                                color: appblackcolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(
                            "",
                            style: GoogleFonts.aBeeZee(
                                color: appprimary,
                                fontWeight: FontWeight.w100,
                                fontSize: 15,
                                decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MyApp.width,
                      height: MyApp.height * .7,
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: MyApp.width / (MyApp.height * 1),
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                        ),
                        itemCount: controller.homedata!.bestSeller.length > 6
                            ? 6
                            : controller.homedata?.bestSeller.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: MyApp.height * .2,
                                    width: MyApp.width,
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          "https://swan.alisonsnewdemo.online/images/product/${controller.homedata?.bestSeller[index].image}",
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    child: IconButton(
                                      onPressed: () {
                                        // Add your logic for wishlist here
                                      },
                                      icon: controller
                                                  .homedata
                                                  ?.bestSeller[index]
                                                  .wishlist ==
                                              0
                                          ? Icon(Icons.favorite_border)
                                          : Icon(Icons.favorite),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                "${controller.homedata?.bestSeller[index].store}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                "${controller.homedata?.bestSeller[index].price}",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
