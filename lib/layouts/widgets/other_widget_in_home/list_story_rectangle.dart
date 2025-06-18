import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/config/manager_font_size.dart';
import 'package:marrige_app/config/manager_height.dart';
import 'package:marrige_app/config/manager_width.dart';

class NearbyProfilesList extends StatelessWidget {
  const NearbyProfilesList({super.key});

  final List<Map<String, dynamic>> profiles = const [
    {
      'name': 'Halima',
      'age': 19,
      'city': 'BERLIN',
      'distance': '16 km away',
      'image':
          'https://plus.unsplash.com/premium_photo-1673792686302-7555a74de717?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'name': 'Vanessa',
      'age': 18,
      'city': 'MUNICH',
      'distance': '4.8 km away',
      'image':
          'https://plus.unsplash.com/premium_photo-1673792686302-7555a74de717?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'name': 'James',
      'age': 20,
      'city': 'HANOVER',
      'distance': '2.2 km away',
      'image':
          'https://plus.unsplash.com/premium_photo-1673792686302-7555a74de717?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'name': 'Halima',
      'age': 19,
      'city': 'BERLIN',
      'distance': '16 km away',
      'image':
          'https://plus.unsplash.com/premium_photo-1673792686302-7555a74de717?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'name': 'Vanessa',
      'age': 18,
      'city': 'MUNICH',
      'distance': '4.8 km away',
      'image':
          'https://plus.unsplash.com/premium_photo-1673792686302-7555a74de717?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'name': 'James',
      'age': 20,
      'city': 'HANOVER',
      'distance': '2.2 km away',
      'image':
          'https://plus.unsplash.com/premium_photo-1673792686302-7555a74de717?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'name': 'Halima',
      'age': 19,
      'city': 'BERLIN',
      'distance': '16 km away',
      'image':
          'https://plus.unsplash.com/premium_photo-1673792686302-7555a74de717?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'name': 'Vanessa',
      'age': 18,
      'city': 'MUNICH',
      'distance': '4.8 km away',
      'image':
          'https://plus.unsplash.com/premium_photo-1673792686302-7555a74de717?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
    {
      'name': 'James',
      'age': 20,
      'city': 'HANOVER',
      'distance': '2.2 km away',
      'image':
          'https://plus.unsplash.com/premium_photo-1673792686302-7555a74de717?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ManagerHeight.h160,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: profiles.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final profile = profiles[index];
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 12 : 0,
              right: index == profiles.length - 1 ? 12 : 0,
            ),
            child: _buildCard(
              name: profile['name'],
              age: profile['age'],
              city: profile['city'],
              distance: profile['distance'],
              imageUrl: profile['image'],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCard({
    required String name,
    required int age,
    required String city,
    required String distance,
    required String imageUrl,
  }) {
    return Container(
      height: ManagerHeight.h160,
      width: ManagerWidth.w110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.deepPurple[400],
        image: DecorationImage(
          image: CachedNetworkImageProvider(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [Colors.transparent, AppColors.gradientStory],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            top: ManagerHeight.h8,
            left: ManagerWidth.w8,
            child: Container(
              height: ManagerHeight.h22,
              width: ManagerWidth.w40,
              decoration: BoxDecoration(
                color: AppColors.black,
                border: Border.all(color: AppColors.purple),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Center(
                child: Text(
                  "NEW",
                  style: TextStyle(
                    color: AppColors.white,
                    fontFamily: "Acme",
                    fontSize: ManagerFontSize.s11,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Container(
                  height: ManagerHeight.h22,
                  width: ManagerWidth.w71,
                  decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(0.20),
                    borderRadius: BorderRadius.circular(32.r),
                    border: Border.all(color: AppColors.white, width: 1),
                  ),
                  child: Center(
                    child: Text(
                      "2,2 km away",
                      style: TextStyle(
                        color: AppColors.white,
                        fontFamily: "Acme",
                        fontWeight: FontWeight.w400,
                        fontSize: ManagerFontSize.s11,
                      ),
                    ),
                  ),
                ),
                Text(
                  "Vanessa, 18",
                  style: TextStyle(
                    color: AppColors.white,
                    fontFamily: "Acme",
                    fontWeight: FontWeight.w400,
                    fontSize: ManagerFontSize.s14,
                  ),
                ),
                Text(
                  "MUNICH",
                  style: TextStyle(
                    color: AppColors.white,
                    fontFamily: "Acme",
                    fontWeight: FontWeight.w400,
                    fontSize: ManagerFontSize.s11,
                  ),
                ),
                SizedBox(height: ManagerHeight.h2,)
              ],
            ),
          ),
          // Positioned(
          //   top: 8,
          //   left: 8,
          //   child: Container(
          //     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          //     decoration: BoxDecoration(
          //       color: Colors.black,
          //       borderRadius: BorderRadius.circular(12),
          //     ),
          //     child: const Text(
          //       "NEW",
          //       style: TextStyle(color: Colors.white, fontSize: 10),
          //     ),
          //   ),
          // ),
          //
          // // Distance capsule
          // Positioned(
          //   top: 110,
          //   left: 8,
          //   child: Container(
          //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          //     decoration: BoxDecoration(
          //       color: Colors.white.withOpacity(0.25),
          //       borderRadius: BorderRadius.circular(20),
          //     ),
          //     child: Text(
          //       distance,
          //       style: const TextStyle(
          //         color: Colors.white,
          //         fontSize: 10,
          //       ),
          //     ),
          //   ),
          // ),
          //
          // // الاسم والعمر والمدينة
          // Positioned(
          //   bottom: 16,
          //   left: 12,
          //   right: 12,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Row(
          //         children: [
          //           Text(
          //             "$name, $age",
          //             style: const TextStyle(
          //               color: Colors.white,
          //               fontWeight: FontWeight.bold,
          //               fontSize: 14,
          //             ),
          //           ),
          //           const SizedBox(width: 4),
          //           const Icon(Icons.circle, color: Colors.green, size: 8),
          //         ],
          //       ),
          //       const SizedBox(height: 4),
          //       Text(
          //         city,
          //         style: const TextStyle(
          //           color: Colors.white70,
          //           fontSize: 12,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
