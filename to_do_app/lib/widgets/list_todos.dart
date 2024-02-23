import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final VoidCallback? onTap1;
  final Color color;

  const CustomListTile(
      {super.key, required this.title, required this.subtitle, this.onTap, this.onTap1, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: color,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(onPressed: onTap, icon: const Icon(Icons.delete, color: Colors.red,)),
                IconButton(onPressed: onTap1, icon: Icon(Icons.done, color: color,)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
