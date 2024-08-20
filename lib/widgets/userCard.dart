import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: 380,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 186, 186, 186),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello Sami',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
                'https://reqres.in/img/faces/4-image.jpg'), // Replace with your actual image URL
          ),
        ],
      ),
    );
  }
}
