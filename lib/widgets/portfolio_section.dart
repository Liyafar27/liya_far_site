import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Column(
        children: [
          Text(
            'Портфолио',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ).animate().fadeIn(duration: 600.ms),
          const SizedBox(height: 60),
          MasonryGridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: _getCrossAxisCount(context),
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            itemCount: _projects.length,
            itemBuilder: (context, index) {
              return _ProjectCard(project: _projects[index])
                  .animate()
                  .fadeIn(duration: 600.ms)
                  .scale(delay: (100 * index).ms);
            },
          ),
        ],
      ),
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width > 1200) return 3;
    if (width > 800) return 2;
    return 1;
  }
}

class _Project {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> technologies;
  final String? link;

  const _Project({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.technologies,
    this.link,
  });
}

final List<_Project> _projects = [
  _Project(
    title: 'Fitness App',
    description: 'Мобильное приложение для фитнеса с персонализированными тренировками и отслеживанием прогресса.',
    imageUrl: 'assets/images/fitness_app.png',
    technologies: ['Flutter', 'Firebase', 'Provider'],
    link: 'https://github.com/your-username/fitness-app',
  ),
  _Project(
    title: 'E-commerce Platform',
    description: 'Платформа электронной коммерции с интеграцией платежей и системой управления заказами.',
    imageUrl: 'assets/images/ecommerce.png',
    technologies: ['Flutter', 'REST API', 'Bloc'],
    link: 'https://github.com/your-username/ecommerce-app',
  ),
  _Project(
    title: 'Task Manager',
    description: 'Приложение для управления задачами с возможностью совместной работы и уведомлениями.',
    imageUrl: 'assets/images/task_manager.png',
    technologies: ['Flutter', 'SQLite', 'Provider'],
    link: 'https://github.com/your-username/task-manager',
  ),
];

class _ProjectCard extends StatelessWidget {
  final _Project project;

  const _ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                child: Center(
                  child: Icon(
                    Icons.image,
                    size: 48,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  project.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: project.technologies.map((tech) {
                    return Chip(
                      label: Text(tech),
                      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                      labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                    );
                  }).toList(),
                ),
                if (project.link != null) ...[
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      // Implement link opening
                    },
                    child: const Text('Подробнее'),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
} 