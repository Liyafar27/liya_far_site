import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('skills-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.3 && !_isVisible) {
          setState(() {
            _isVisible = true;
          });
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: Column(
          children: [
            Text(
              'AREAS OF EXPERTISE',
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
            const SizedBox(height: 60),
            if (_isVisible) Wrap(
              spacing: 30,
              runSpacing: 30,
              alignment: WrapAlignment.center,
              children: [
                _buildSkillCategory(
                  context,
                  'Mobile Development',
                  [
                    _Skill('Flutter & Dart', FontAwesomeIcons.mobile),
                    _Skill('Android (Kotlin, Java)', FontAwesomeIcons.android),
                    _Skill('UI/UX Design', FontAwesomeIcons.palette),
                    _Skill('Responsive Layouts', FontAwesomeIcons.desktop),
                  ],
                  delay: 0,
                ),
                _buildSkillCategory(
                  context,
                  'Backend Integration',
                  [
                    _Skill('GraphQL', FontAwesomeIcons.database),
                    _Skill('Firebase', FontAwesomeIcons.fire),
                    _Skill('REST APIs', FontAwesomeIcons.networkWired),
                    _Skill('WebSockets', FontAwesomeIcons.plug),
                  ],
                  delay: 0.5,
                ),
                _buildSkillCategory(
                  context,
                  'State Management',
                  [
                    _Skill('Bloc', FontAwesomeIcons.cube),
                    _Skill('Provider', FontAwesomeIcons.code),
                    _Skill('Riverpod', FontAwesomeIcons.stream),
                    _Skill('ValueNotifier', FontAwesomeIcons.bell),
                  ],
                  delay: 1,
                ),
                _buildSkillCategory(
                  context,
                  'Development Tools',
                  [
                    _Skill('Git & GitLab', FontAwesomeIcons.git),
                    _Skill('CI/CD', FontAwesomeIcons.rocket),
                    _Skill('Jira & Confluence', FontAwesomeIcons.jira),
                    _Skill('Figma & Adobe', FontAwesomeIcons.figma),
                  ],
                  delay: 2,
                ),
                _buildSkillCategory(
                  context,
                  'Testing & Quality',
                  [
                    _Skill('Unit Testing', FontAwesomeIcons.vial),
                    _Skill('Widget Testing', FontAwesomeIcons.mobile),
                    _Skill('Integration Testing', FontAwesomeIcons.check),
                    _Skill('Crashlytics & Sentry', FontAwesomeIcons.bug),
                  ],
                  delay: 2.5,
                ),
                _buildSkillCategory(
                  context,
                  'App Features',
                  [
                    _Skill('FCM Notifications', FontAwesomeIcons.bell),
                    _Skill('Local Storage', FontAwesomeIcons.database),
                    _Skill('Deep Linking', FontAwesomeIcons.link),
                    _Skill('Navigation 2.0', FontAwesomeIcons.route),
                  ],
                  delay: 3,
                ),

                _buildSkillCategory(
                  context,
                  'Web3 Development',
                  [
                    _Skill('Wallet Creation Solana', FontAwesomeIcons.wallet),
                    _Skill('Integrating Wallets: Phantom/Meteor etc.', FontAwesomeIcons.link),
                    _Skill('Blockchain: Solana/NEAR/BNB/BTC', FontAwesomeIcons.chain),
                    _Skill('Swaps/Token Transfers Jupiter/Raydium', FontAwesomeIcons.exchangeAlt),
                    _Skill('Transaction Sign/Gas/Fee/Confirmation', FontAwesomeIcons.signature),
                    _Skill('RPC & WebSocket Interaction', FontAwesomeIcons.networkWired),
                    _Skill('Flutter UI for Web3 Integration', FontAwesomeIcons.mobileAlt),
                  ],
                  delay: 4,
                  width: 490,

                ),
                SizedBox(width: 50,),
                _buildSkillCategory(
                  context,
                  'Crypto Trading Bots',
                  [
                    _Skill('Crypto Trading Bots on Node.js', FontAwesomeIcons.robot),
                    _Skill('SOL/USDC, NEAR/USDC, BNB/MEME', FontAwesomeIcons.coins),
                    _Skill('Automatic Token Swaps', FontAwesomeIcons.exchangeAlt),
                    _Skill('Transaction Monitoring and Confirmation', FontAwesomeIcons.eye),
                    _Skill('Trade Execution and Profit Optimization', FontAwesomeIcons.chartLine),
                    _Skill('Arbitrage Trading Bot', FontAwesomeIcons.robot),
                    _Skill('Monitor price PancakeSwap/SushiSwap', FontAwesomeIcons.eye),
    ],
                  delay: 4.5,
                    width: 490,

                ),

              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillCategory(BuildContext context, String title, List<_Skill> skills, {required double delay, double? width}) {
    return Container(
      width: width??300,
      padding: const EdgeInsets.all(20),
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
          Text(
            title,
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
          const SizedBox(height: 20),
          ...skills.map((skill) => _buildSkillItem(context, skill)),
        ],
      ),
    ).animate().fadeIn(
      delay: (delay * 1000).ms,
      duration: 400.ms,
      curve: Curves.easeOut,
    ).slideY(
      begin: 0.3,
      end: 0,
      delay: (delay * 1000).ms,
      duration: 400.ms,
      curve: Curves.easeOut,
    );
  }

  Widget _buildSkillItem(BuildContext context, _Skill skill) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          FaIcon(
            skill.icon,
            size: 20,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(width: 12),
          Text(
            skill.name,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white70,
                ),
          ),
        ],
      ),
    );
  }
}

class _Skill {
  final String name;
  final IconData icon;

  _Skill(this.name, this.icon);
} 