import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:main_cluesnew/common/my_colors.dart';
import 'package:main_cluesnew/common/my_font_size.dart';
import 'package:main_cluesnew/screen/onboarding1.dart';
import 'package:main_cluesnew/screen/onboarding2.dart';
import 'package:main_cluesnew/ui/screens/tracking/tracking_shipment.dart';
import 'package:main_cluesnew/ui/widgets/custom_card.dart';


class WidgetStraggeredGridView extends StatefulWidget {
  const WidgetStraggeredGridView({Key? key}) : super(key: key);

  @override
  _WidgetStraggeredGridViewState createState() => _WidgetStraggeredGridViewState();
}

class _WidgetStraggeredGridViewState extends State<WidgetStraggeredGridView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: [
          CustomCard(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const OnboardingScreen1()));
            },
            shadow: false,
            width: double.infinity,
            bgColor: MyColors.softGrey,
            borderRadius: BorderRadius.circular(15),
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCard(
                  shadow: false,
                  height: 50,
                  width: 50,
                  bgColor: MyColors.yellow,
                  borderRadius: BorderRadius.circular(100),
                  child: const Center(
                    child: Icon(Icons.car_rental)
                  )
                ),
                const SizedBox(height: 15,),
                Text(
                  "Track Your Shipment Location",
                  style: TextStyle(
                    color: MyColors.blackText,
                    fontSize: MyFontSize.medium1,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  "Control your package like a boss",
                  style: TextStyle(
                    color: MyColors.blackText.withOpacity(.8),
                    fontSize: MyFontSize.small3,
                  ),
                ),
              ],
            ),
          ),
         
          CustomCard(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const OnboardingScreen2()));
            },
            shadow: false,
            width: double.infinity,
            bgColor: MyColors.softGrey,
            borderRadius: BorderRadius.circular(15),
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCard(
                  shadow: false,
                  height: 50,
                  width: 50,
                  bgColor: MyColors.yellow,
                  borderRadius: BorderRadius.circular(100),
                  child: const Center(
                    child: Icon(Icons.restore)
                  )
                ),
                const SizedBox(height: 15,),
                Text(
                  "Return the damaged item",
                  style: TextStyle(
                    color: MyColors.blackText,
                    fontSize: MyFontSize.medium1,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  "We accept returns of damaged goods , ",
                  style: TextStyle(
                    color: MyColors.blackText.withOpacity(.8),
                    fontSize: MyFontSize.small3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
