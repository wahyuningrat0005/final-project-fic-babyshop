import 'package:baby_shop/common/components/space_height.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.0,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 52, 203, 10),
              // borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
          ),
          const Positioned(
            right: -122.0,
            top: 0.0,
            child: CircleAvatar(
              backgroundColor: Colors.orange,
              radius: 120.0,
            ),
          ),
          Positioned(
            top: 20.0,
            right: 38.0,
            bottom: 0.0,
            child: Container(
              width: 150.0,
              height: 150.0,
              child: Image.asset(
                'assets/images/crm1.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 20.0,
            top: 20.0,
            bottom: 0.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\$60.000',
                  style: GoogleFonts.oswald(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Facial Cream",
                  style: GoogleFonts.oswald(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SpaceHeight(15.0),
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 3.0,
                    ),
                    child: Text(
                      "20% off",
                      style: GoogleFonts.oswald(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
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
