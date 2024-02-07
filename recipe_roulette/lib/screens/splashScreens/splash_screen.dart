import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_roulette/widgets/my_linear_gradient.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    return Container(
      decoration: BoxDecoration(
        gradient:
            MyLinearGradient(const Color(0xff801336), const Color(0xff2d132c)),
      ),
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 300),
            ShaderMask(
              shaderCallback: (bounds) => MyLinearGradient(
                      const Color(0xffc72c41),
                      const Color.fromARGB(255, 234, 149, 146),)
                  .createShader(bounds),
              child: const Icon(
                Icons.room_service_rounded,
                color: Colors.white,
                size: 100,
              ),
            ),
            ShaderMask(
              shaderCallback: (bounds) => MyLinearGradient(
                      const Color.fromARGB(255, 234, 149, 146),
                      const Color(0xffc72c41))
                  .createShader(bounds),
              child: const Text(
                'Recipe Roulette',
                style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: 10),
            ShaderMask(
              shaderCallback: (bounds) => MyLinearGradient(
                      const Color(0xffc72c41),
                      const Color.fromARGB(255, 234, 149, 146))
                  .createShader(bounds),
              child: const Text(
                'Version 1.0.0',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const Spacer(),
            ShaderMask(
              shaderCallback: (bounds) => MyLinearGradient(
                      const Color.fromARGB(255, 234, 149, 146),
                      const Color(0xffc72c41),)
                  .createShader(bounds),
              child: const Text(
                '@ NBPT',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.amber,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 30),
          ],
        ),
      ),
    );
  }
}
