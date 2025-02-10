import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mytravel/constant/color.dart';
import 'package:mytravel/model/data.dart';
import 'package:mytravel/wiget/Destination.dart';
import 'package:mytravel/wiget/Proflie_widget.dart';
import 'package:mytravel/wiget/SearchBar.dart';
import 'package:mytravel/wiget/icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Row 1 - Proflie image
              ProflieWidget(),
              SizedBox(
                height: 15,
              ),
              //Row 2
              Text(
                'Point of Interest',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: primaryColors, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              //Row 3
              SearchABar(),
              SizedBox(
                height: 15,
              ),
              //row 4
              IconTab(),
              SizedBox(
                height: 15,
              ),

              Row(
                children: [
                  Text(
                    'Top Destination',
                    style: TextStyle(
                      fontSize: 25,
                      color: primaryColors,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.tune,
                    size: 25,
                    color: primaryColors,
                  ),
                ],
              ),

              SizedBox(
                height: 15,
              ),
              //Row 6 - Display images
              GridView.count(
                crossAxisCount: 2,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                childAspectRatio: 0.75,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                children: List.generate(destinations.length, (index) {
                  var e = destinations[index];

                  return AnimationConfiguration.staggeredGrid(
                      position: index,
                      columnCount: 2,
                      child: SlideAnimation(
                          child: FadeInAnimation(
                              child: DestinationWidget(
                                  name: e.name,
                                  image: e.image,
                                  rate: e.rate,
                                  location: e.location))));
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
