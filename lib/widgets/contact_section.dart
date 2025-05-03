import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'js_open.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
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
    return Container(
      height: 400,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
      ),
      child: MouseRegion(
        onHover: (event) {
          setState(() {
            _offset = event.position - center;
          });
        },
        child: Stack(
          children: [
            SizedBox(
              height: 350,
              child: Stack(
                children: [
                  Transform.scale(
                    scale: 1.0,
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
                    scale: 1.0,
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
                    scale: 1,
                    child: Transform.translate(
                      offset: Offset(_offset.dx * 0.04, _offset.dy * 0.04),
                      child: SizedBox.expand(
                        child: Image.asset(
                          'assets/images/bg3.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Transform.scale(
                    scale: 1,
                    child: Transform.translate(
                      offset: Offset(_offset.dx * 0.05, _offset.dy * 0.05),
                      child: SizedBox.expand(
                        child: Image.asset(
                          'assets/images/bg2.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              color: Colors.black.withValues(alpha: 0.7),
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    'GET IN TOUCH',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                      shadows: [
                        Shadow(
                          color: Theme.of(context).colorScheme.primary,
                          blurRadius: 15,
                        ),
                        Shadow(
                          color: Theme.of(context).colorScheme.primary,
                          blurRadius: 30,
                        ),
                        Shadow(
                          color: Theme.of(context).colorScheme.primary,
                          blurRadius: 45,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Text(
                          'Let\'s Create Something Amazing Together',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                            shadows: [
                              Shadow(
                                color: Theme.of(context).colorScheme.secondary,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ).animate().fadeIn(
                              delay: 200.ms,
                              duration: 200.ms,
                              curve: Curves.easeIn,
                            ),
                        const SizedBox(height: 40),
                        _buildSocialLinks(context),
                        const SizedBox(height: 20),
                        Text(
                          '© ${DateTime.now().year} Aliya Far. All rights reserved.',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.white54,
                                  ),
                        ).animate().fadeIn(
                              delay: 800.ms,
                              duration: 200.ms,
                              curve: Curves.easeIn,
                            ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialLinks(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton(
          context,
          'GitHub',
          FontAwesomeIcons.github,
          'https://github.com/Liyafar27',
          delay: 700,
        ),
        const SizedBox(width: 20),
        _buildSocialButton(
          context,
          'LinkedIn',
          FontAwesomeIcons.linkedin,
          'https://linkedin.com/in/aliya-farkhshatova-570167203',
          delay: 750,
        ),
        const SizedBox(width: 20),
        _buildSocialButton(
          context,
          'Telegram',
          FontAwesomeIcons.telegram,
          'https://t.me/LiyaFar',
          delay: 800,
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
          ).animate(onPlay: (controller) => controller.repeat()).shimmer(
              duration: 2000.ms,
              color:
                  Theme.of(context).colorScheme.primary.withValues(alpha: 0.3)),
        )
      ],
    );
  }

  Widget _buildSocialButton(
    BuildContext context,
    String label,
      IconData icon,
      String url, {
    required int delay,
  }) {
    return Tooltip(
      message: label,
      child: IconButton(
        icon: FaIcon(
          icon,
          color: Theme.of(context).colorScheme.primary,
        ),
        onPressed: () => _launchURL(url),
        iconSize: 30,
      )
          .animate()
          .fadeIn(
            delay: delay.ms,
            duration: 200.ms,
            curve: Curves.easeIn,
          )
          .scale(
            begin: const Offset(0.5, 0.5),
            end: const Offset(1, 1),
            delay: delay.ms,
            duration: 200.ms,
            curve: Curves.easeOut,
          ),
    );
  }
}
