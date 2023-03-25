import 'package:flutter/material.dart';

class AdbStatus extends StatelessWidget {
  const AdbStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "ADB Status:",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(width: 8.0),
        Text(
          "Not installed!",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Colors.red,
          ),
        ),
        SizedBox(width: 16.0),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }
}
