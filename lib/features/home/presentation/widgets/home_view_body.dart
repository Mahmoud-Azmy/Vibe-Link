import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vibe_link/core/functions/is_arabic.dart';
import 'package:vibe_link/core/utils/app_assets.dart';
import 'package:vibe_link/features/home/data/models/botton_nav_bar_item_model.dart';
import 'package:vibe_link/features/home/presentation/widgets/custom_floating_action_button.dart';
import 'package:vibe_link/features/home/presentation/widgets/home_feed_section.dart';
import 'package:vibe_link/features/home/presentation/widgets/profile_feed_section.dart';

// Cubit for bottom navigation
class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);
  void changeIndex(int index) => emit(index);
}

class HomeViewBody extends StatelessWidget {
  HomeViewBody({super.key});

  final List<BottonNavBarItemModel> sampleData = [
    BottonNavBarItemModel(
      title: "Home",
      launchWidget: HomeFeedSection(),
      icon: SvgPicture.asset(AppAssets.activeHome, height: 24, width: 24),
      alternateIcon: SvgPicture.asset(
        AppAssets.inactiveHome,
        height: 24,
        width: 24,
      ),
    ),
    BottonNavBarItemModel(
      title: 'Category',
      launchWidget: Center(
        child: Text(
          'Category View',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      icon: SvgPicture.asset(AppAssets.activeCategory, height: 24, width: 24),
      alternateIcon: SvgPicture.asset(
        AppAssets.inactiveCategory,
        height: 24,
        width: 24,
      ),
    ),
    BottonNavBarItemModel(
      title: "Notifications",
      launchWidget: Center(
        child: Text(
          "Notifications View",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      icon: SvgPicture.asset(
        AppAssets.activeNotification,
        height: 24,
        width: 24,
      ),
      alternateIcon: SvgPicture.asset(
        AppAssets.inactiveNotification,
        height: 24,
        width: 24,
      ),
    ),
    BottonNavBarItemModel(
      title: "Profile",
      launchWidget: ProfileFeedSection(),
      icon: SvgPicture.asset(AppAssets.activeProfile, height: 24, width: 24),
      alternateIcon: SvgPicture.asset(
        AppAssets.inactiveProfile,
        height: 24,
        width: 24,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, selectedIndex) {
        return Scaffold(
          body: sampleData[selectedIndex].launchWidget,
          floatingActionButton: CustomFloatingActionButton(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            clipBehavior: Clip.hardEdge,
            shape: CircularNotchedRectangle(),
            notchMargin: 8,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  ...List.generate(sampleData.length, (index) {
                    BottonNavBarItemModel data = sampleData[index];
                    return Expanded(
                      child: GestureDetector(
                        child: Padding(
                          padding: EdgeInsets.only(
                            right:
                                isArabic()
                                    ? (index == 2 ? 20 : 0)
                                    : (index == 1 ? 20 : 0),
                            left:
                                isArabic()
                                    ? (index == 1 ? 20 : 0)
                                    : (index == 2 ? 20 : 0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              selectedIndex == index
                                  ? SizedBox(child: data.icon)
                                  : SizedBox(child: data.alternateIcon),
                            ],
                          ),
                        ),
                        onTap: () {
                          context.read<BottomNavCubit>().changeIndex(index);
                        },
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
