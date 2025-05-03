import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:liya_far_site/widgets/js_open.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  Offset _offset = Offset.zero;

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  void openPdf(String url) {
    openPdfInTab(url);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final center = screenSize.center(Offset.zero);
    return MouseRegion(
    onHover: (event) {
          setState(() {
    _offset = event.position - center;
          });
        },
        child:Stack(
    children: [
      SizedBox(
        height: MediaQuery.of(context).size.height-80,
        child: Stack(
          children: [
            // Задний слой
            Transform.scale(
              scale: 1.0, // увеличиваем немного
              child: Transform.translate(
                offset: Offset(_offset.dx * 0.02, _offset.dy * 0.02),
                child: SizedBox.expand(
                  child: Image.asset(
                    'assets/images/bg1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            Transform.scale(
              scale: 1.0, // увеличиваем немного
              child: Transform.translate(
                offset: Offset(_offset.dx * 0.03, _offset.dy * 0.03),
                child: SizedBox.expand(
                  child: Image.asset(
                    'assets/images/bg4.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Transform.scale(
              scale: 1, // увеличиваем немного
              child: Transform.translate(
                offset: Offset(_offset.dx * 0.04, _offset.dy * 0.04),
                child: SizedBox.expand(
                  child: Image.asset(
                    'assets/images/bg3.png',                        fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Transform.scale(
              scale: 1, // увеличиваем немного
              child: Transform.translate(
                offset: Offset(_offset.dx * 0.05, _offset.dy * 0.05),
                child: SizedBox.expand(
                  child: Image.asset(
                    'assets/images/bg2.png',                        fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Текст по центру
            // Center(
            //   child: Transform(
            //     transform: Matrix4.identity()
            //       ..translate(_offset.dx * 0.01, _offset.dy * 0.01)
            //       ..rotateZ(_offset.dx * 0.0001),
            //     child: Text(
            //       'Welcome to my site!',
            //       style: TextStyle(
            //         fontSize: 36,
            //         color: Colors.white,
            //         fontWeight: FontWeight.bold,
            //         shadows: [
            //           Shadow(color: Colors.black54, blurRadius: 10, offset: Offset(3, 3)),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
           Container(
        height: MediaQuery.of(context).size.height,
        // decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.7),
          // gradient: RadialGradient(
          //   center: Alignment.center,
          //   radius: 11,
          //   colors: [
          //     Theme.of(context).colorScheme.primary.withValues(alpha: 0.05),
          //     Colors.black,
          //   ],
          // ),
        // ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
          color: Colors.black.withValues(alpha: 0.4),
                child: Text(
                  'HELLO, I AM',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    shadows: [
                      Shadow(
                        color: Theme.of(context).colorScheme.secondary,
                        blurRadius: 10,
                      ),
                      Shadow(
                        color: Theme.of(context).colorScheme.secondary,
                        blurRadius: 20,
                      ),
                      Shadow(
                        color: Theme.of(context).colorScheme.secondary,
                        blurRadius: 30,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                color: Colors.black.withValues(alpha: 0.3),
                child: Text(
                  'ALIYA FAR',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                    shadows: [
                      Shadow(
                        color:
                            Theme.of(context).colorScheme.primary.withOpacity(0.5),
                        blurRadius: 15,
                      ),
                      Shadow(
                        color: Theme.of(context).colorScheme.primary,
                        blurRadius: 25,
                      ),
                      Shadow(
                        color:
                            Theme.of(context).colorScheme.primary.withOpacity(0.5),
                        blurRadius: 35,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                color: Colors.black.withValues(alpha: 0.3),
                child: DefaultTextStyle(
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    shadows: [
                      Shadow(
                        color: Theme.of(context).colorScheme.secondary,
                        blurRadius: 10,
                      ),
                      Shadow(
                        color: Theme.of(context).colorScheme.secondary,
                        blurRadius: 20,
                      ),
                      Shadow(
                        color: Theme.of(context).colorScheme.secondary,
                        blurRadius: 30,
                      ),
                    ],
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Flutter Developer',
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        'Mobile App Expert',
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        'UI/UX Enthusiast',
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        'Web3 Developer',
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        'Full-Stack Engineer',
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        'Crypto Bot Crafter',
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                    repeatForever: true,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                color: Colors.black.withValues(alpha: 0.3),

                constraints: const BoxConstraints(maxWidth: 800),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Flutter developer with 4 years commercial experience in building high-quality mobile applications for businesses. Whether you need a sleek, user-friendly app or a complex, feature-rich solution, I can help turn your ideas into reality.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        height: 1.5,
                        color: Colors.white70,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                color: Colors.black.withValues(alpha: 0.3),
            constraints: const BoxConstraints(maxWidth: 800),
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Text( 'Web3 development, working with blockchains like Solana, BNB Chain, NEAR, and Bitcoin. I’ve built mobile and web apps that connect to live wallets like Phantom, MetaMask, Uniswap Wallet, and Meteor, supporting everything from token swaps and real-time price tracking to trading bots and NFT interactions.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              height: 1.5,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
        ),  const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton(
                    context,
                    'GitHub',
                    FontAwesomeIcons.github,
                    'https://github.com/Liyafar27',
                  ),
                  const SizedBox(width: 20),
                  _buildSocialButton(
                    context,
                    'LinkedIn',
                    FontAwesomeIcons.linkedin,
                    'https://linkedin.com/in/aliya-farkhshatova-570167203',
                  ),
                  const SizedBox(width: 20),
                  _buildSocialButton(
                    context,
                    'Telegram',
                    FontAwesomeIcons.telegram,
                    'https://t.me/LiyaFar',
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Tooltip(
                    message: 'CV',
                    child: IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.filePdf,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: () => _launchURL(
                          'https://github.com/Liyafar27/cv/blob/main/Aliya%20Farkhshatova%20Flutter%20dev.pdf'),
                      iconSize: 30,
                    )
                        .animate(onPlay: (controller) => controller.repeat())
                        .shimmer(
                            duration: 2000.ms,
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.3)),
                  )
                ],
              ).animate().fadeIn(delay: 800.ms),
            ],
          ),
        ),
      ),
    ],
          ),
    );
  }

  Widget _buildSocialButton(
    BuildContext context,
    String label,
    IconData icon,
    String url,
  ) {
    return Tooltip(
      message: label,
      child: IconButton(
        icon: FaIcon(
          icon,
          color: Theme.of(context).colorScheme.primary,
        ),
        onPressed: () => _launchURL(url),
        iconSize: 30,
      ).animate(onPlay: (controller) => controller.repeat()).shimmer(
          duration: 2000.ms,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.3)),
    );
  }
}
