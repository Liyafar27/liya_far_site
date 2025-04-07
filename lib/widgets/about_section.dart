import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('about-section'),
      onVisibilityChanged: (info) {
        // Animation trigger on visibility
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: Column(
          children: [
            Text(
              'EDUCATION & CONTACT',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                    shadows: [
                      Shadow(
                        color: Theme.of(context).colorScheme.primary,
                        blurRadius: 15,
                      ),
                    ],
                  ),
            ).animate().fadeIn(duration: 600.ms),
            const SizedBox(height: 60),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        _buildEducationSection(context),
                        const SizedBox(height: 40),
                        _buildContactSection(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEducationSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.graduationCap,
                color: Theme.of(context).colorScheme.primary,
                size: 24,
              ),
              const SizedBox(width: 15),
              Text(
                'Education',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                      shadows: [
                        Shadow(
                          color: Theme.of(context).colorScheme.primary,
                          blurRadius: 5,
                        ),
                      ],
                    ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Volga State University of Technology',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            '2008-2013',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Colors.white70,
                ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2);
  }

  Widget _buildContactSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.addressCard,
                color: Theme.of(context).colorScheme.secondary,
                size: 24,
              ),
              const SizedBox(width: 15),
              Text(
                'Contact Information',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                      shadows: [
                        Shadow(
                          color: Theme.of(context).colorScheme.secondary,
                          blurRadius: 5,
                        ),
                      ],
                    ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildContactItem(
            context,
            FontAwesomeIcons.phone,
            '+7 705 985 0438',
          ),
          _buildContactItem(
            context,
            FontAwesomeIcons.locationDot,
            'Aktau, Kazakhstan',
          ),
          _buildContactItem(
            context,
            FontAwesomeIcons.passport,
            'Citizenship: Russia',
          ),
          _buildContactItem(
            context,
            FontAwesomeIcons.envelope,
            'liyafarapp@gmail.com',
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms).slideX(begin: 0.2);
  }

  Widget _buildContactItem(BuildContext context, IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          FaIcon(
            icon,
            color: Theme.of(context).colorScheme.secondary,
            size: 20,
          ),
          const SizedBox(width: 15),
          Text(
            text,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white70,
                ),
          ),
        ],
      ),
    );
  }
} 