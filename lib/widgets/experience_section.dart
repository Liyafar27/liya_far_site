import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'PROFESSIONAL EXPERIENCE',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                  shadows: [
                    Shadow(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                      blurRadius: 15,
                    ),
                    Shadow(
                      color: Theme.of(context).colorScheme.primary,
                      blurRadius: 25,
                    ),
                    Shadow(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                      blurRadius: 35,
                    ),
                  ],
                ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: _buildExperienceTimeline(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceTimeline(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildExperienceItem(
          context,
          company: 'Zenden Group',
          position: 'Flutter Developer',
          period: 'December 2021 - March 2025',
          description: 'Development of fashion retail mobile applications',
          projects: [
            _Project(
              'Zenden: обувь и сумки',
              [
                'https://play.google.com/store/apps/details?id=ru.zenden.android',
                'https://apps.apple.com/kz/app/zenden-%D0%BE%D0%B1%D1%83%D0%B2%D1%8C-%D0%B8-%D1%81%D1%83%D0%BC%D0%BA%D0%B8/id1546221084',
              ],
            ),
            _Project(
              'Salamander',
              [
                'https://apps.apple.com/kz/app/salamander/id1639312032',
                'https://play.google.com/store/apps/details?id=ru.fittin.salamander.android',
              ],
            ),
            _Project(
              'Thomas Münz: обувь, сумки',
              [
                'https://play.google.com/store/apps/details?id=ru.thomasmuenz.android',
                'https://apps.apple.com/ru/app/thomas-münz-обувь-сумки/id1544254303?l=en-GB',
              ],
            ),
            _Project(
              'MUNZ GROUP Staff',
              ['https://play.google.com/store/apps/details?id=ru.zenden.corp'],
            ),
            _Project(
              'FAGE - Digital Fashion Lounge',
              ['https://apps.apple.com/kz/app/fage-digital-fashion-lounge/id1546087280'],
            ),
            _Project(
              'Staff Zenden',
              ['https://play.google.com/store/apps/details?id=ru.team.zenden'],
            ),
          ],
        ),
        _buildExperienceItem(
          context,
          company: 'YO SOLUTIONS',
          position: 'Flutter Developer',
          period: 'June 2021 - December 2021',
          description: 'Development of water delivery company applications',
          projects: [
            _Project('Red Key Water Delivery', ['https://play.google.com/store/apps/details?id=ru.yoso.mobile.red_spring&hl=ru','https://apps.apple.com/kz/app/%D0%BA%D1%80%D0%B0%D1%81%D0%BD%D1%8B%D0%B9-%D0%BA%D0%BB%D1%8E%D1%87-%D1%81%D1%82%D0%B5%D1%80%D0%BB%D0%B8%D1%82%D0%B0%D0%BC%D0%B0%D0%BA/id1560809662']),
            _Project('Sister Water Delivery', ['https://play.google.com/store/apps/details?id=ru.yoso.mobile.sestrica','https://apps.apple.com/kz/app/%D0%B2%D0%BE%D0%B4%D0%B0-%D1%81%D0%B5%D1%81%D1%82%D1%80%D0%B8%D1%86%D0%B0-%D1%81%D1%8B%D0%B7%D1%80%D0%B0%D0%BD%D1%8C/id6479362712']),
          ],
        ),
        _buildExperienceItem(
          context,
          company: 'Omega-soft',
          position: 'Android Developer',
          period: 'October 2020 - June 2021',
          description: 'Mobile application development',
          projects: [
            _Project('SeekMed - doctor online', ['https://play.google.com/store/apps/details?id=com.omega_r.healthcare&hl=ru&gl=US']),
            _Project('Own old app for children (Java)', ['https://play.google.com/store/apps/details?id=ru.soundsforbaby']),
          ],
        ),
      ],
    );
  }

  Widget _buildExperienceItem(
    BuildContext context, {
    required String company,
    required String position,
    required String period,
    required String description,
    List<_Project> projects = const [],
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
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
                FontAwesomeIcons.buildingUser,
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        // Основной текст
                        Text(
                          company,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        // Слой свечения (мягкое пульсирование)
                        Text(
                          company,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                                shadows: [
                                  Shadow(
                                    color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                                    blurRadius: 8,
                                  ),
                                ],
                              ),
                        ).animate(
                          onPlay: (controller) => controller.repeat(reverse: true),
                        ).custom(
                          duration: 3000.ms,
                          builder: (context, value, child) => Opacity(
                            opacity: 0.3 + (value * 0.3), // Плавное изменение прозрачности от 0.3 до 0.6
                            child: child,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      position,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                    Text(
                      period,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Colors.white70,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (description.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white70,
                  ),
            ),
          ],
          if (projects.isNotEmpty) ...[
            const SizedBox(height: 12),
            ...projects.map((project) => _buildProjectItem(context, project)),
          ],
        ],
      ),
    ).animate().fadeIn(duration: 400.ms).slideX(begin: -0.1);
  }

  Widget _buildProjectItem(BuildContext context, _Project project) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.mobileScreen,
                color: Theme.of(context).colorScheme.secondary,
                size: 14,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  project.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ],
          ),
          if (project.links.isNotEmpty) ...[
            const SizedBox(height: 6),
            Wrap(
              spacing: 8,
              children: project.links.map((link) {
                final isAppStore = link.contains('apple.com');
                return TextButton.icon(
                  onPressed: () => _launchURL(link),
                  icon: FaIcon(
                    isAppStore ? FontAwesomeIcons.appStoreIos : FontAwesomeIcons.googlePlay,
                    size: 14,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  label: Text(
                    isAppStore ? 'App Store' : 'Google Play',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 12,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    minimumSize: Size.zero,
                  ),
                );
              }).toList(),
            ),
          ],
        ],
      ),
    );
  }
}

class _Project {
  final String name;
  final List<String> links;

  _Project(this.name, this.links);
} 