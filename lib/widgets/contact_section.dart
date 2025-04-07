import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:js' as js;

import 'js_open.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
            width: 1,
          ),
        ),
      ),
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
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
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
                _buildContactInfo(context),
                const SizedBox(height: 40),
                _buildSocialLinks(context),
                const SizedBox(height: 20),
                Text(
                  '© ${DateTime.now().year} Aliya Far. All rights reserved.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return Wrap(
      spacing: 40,
      runSpacing: 20,
      alignment: WrapAlignment.center,
      children: [
        _buildContactItem(
          context,
          FontAwesomeIcons.phone,
          '+7 705 985 0438',
          delay: 400,
        ),
        _buildContactItem(
          context,
          FontAwesomeIcons.locationDot,
          'Aktau, Kazakhstan',
          delay: 500,
        ),
        _buildContactItem(
          context,
          FontAwesomeIcons.envelope,
          'liyafarapp@gmail.com',
          delay: 600,
        ),
      ],
    );
  }

  Widget _buildContactItem(
    BuildContext context,
    IconData icon,
    String text, {
    required int delay,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(
            icon,
            size: 20,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white70,
                ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(
          delay: delay.ms,
          duration: 200.ms,
          curve: Curves.easeIn,
        )
        .slideX(
          begin: 0.2,
          end: 0,
          delay: delay.ms,
          duration: 200.ms,
          curve: Curves.easeOut,
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
        ),SizedBox(width: 16,),
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
