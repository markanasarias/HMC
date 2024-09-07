import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get.dart';
import 'package:health_system/app/Textstyles.dart';
import 'package:health_system/widget/logout.dart';

class AdminAppbar extends StatelessWidget {
  final String title;

  const AdminAppbar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyles.AppBarHeader,
            ),
            Row(
              children: [
                Text(
                  'Mark Anasarias',
                  style: TextStyles.AppBartext,
                ),
                const SizedBox(width: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(80.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      customButton: Image.asset(
                        'assets/default_profile.jpg',
                        fit: BoxFit.cover,
                        width: 45.0,
                        height: 45.0,
                      ),
                      items: [
                        ...AdminMenuItems.firstItems.map(
                          (item) => DropdownMenuItem<MenuItem>(
                            value: item,
                            child: AdminMenuItems.buildItem(item),
                          ),
                        ),
                        const DropdownMenuItem<Divider>(
                            enabled: false, child: Divider()),
                        ...AdminMenuItems.secondItems.map(
                          (item) => DropdownMenuItem<MenuItem>(
                            value: item,
                            child: AdminMenuItems.buildItem(item),
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        AdminMenuItems.onChanged(context, value! as MenuItem);
                      },
                      dropdownStyleData: DropdownStyleData(
                        width: 160,
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white,
                        ),
                        offset: const Offset(-100, -25),
                      ),
                      menuItemStyleData: MenuItemStyleData(
                        customHeights: [
                          ...List<double>.filled(
                              AdminMenuItems.firstItems.length, 48),
                          8,
                          ...List<double>.filled(
                              AdminMenuItems.secondItems.length, 48),
                        ],
                        padding: const EdgeInsets.only(left: 16, right: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  const MenuItem({
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;
}

abstract class AdminMenuItems {
  static const List<MenuItem> firstItems = [profile, settings];
  static const List<MenuItem> secondItems = [logout];

  static const profile = MenuItem(text: 'Profile', icon: Icons.person);
  static const settings = MenuItem(text: 'Settings', icon: Icons.settings);
  static const logout = MenuItem(text: 'Logout', icon: Icons.logout);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: Colors.black, size: 22),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            item.text,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  static void onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case AdminMenuItems.profile:
        break;
      case AdminMenuItems.settings:
        break;
      case AdminMenuItems.logout:
        LogoutDialog();
        break;
    }
  }
}
