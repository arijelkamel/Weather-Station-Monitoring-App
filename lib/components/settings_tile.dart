import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:mobile_project/styles/colors.dart';

class SettingsTile extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  const SettingsTile({
    Key? key,
    required this.color,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color,
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: PurpleLight,
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: onTap,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: darkBlue,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(Ionicons.chevron_forward_outline, color: PurpleLight),
          ),
        )
      ],
    );
  }
}
