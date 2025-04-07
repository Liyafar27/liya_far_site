import 'package:flutter/material.dart';
import '../widgets/hero_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/portfolio_section.dart';
import '../widgets/contact_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeroSection(),
            Container(
              constraints: const BoxConstraints(maxWidth: 1200),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Column(
                children: [
                  SkillsSection(),
                  SizedBox(height: 40),
                  ExperienceSection(),
                  SizedBox(height: 40),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.black,
              child: const ContactSection(),
            ),
          ],
        ),
      ),
    );
  }
} 