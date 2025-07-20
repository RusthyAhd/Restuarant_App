import 'package:flutter/material.dart';
import '../models/courses.dart';

class HCard extends StatelessWidget {
  const HCard({Key? key, required this.section}) : super(key: key);

  final CourseModel section;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 120),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: section.color,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: section.color.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  section.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  section.caption,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.9),
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(0.5),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              section.image,
              width: 32,
              height: 32,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
