import 'package:flutter/material.dart';
import '../theme.dart';
import '../components/restaurant_icons.dart';
import 'dart:ui';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final List<FAQItem> _faqItems = [
    FAQItem(
      question: "What are your restaurant hours?",
      answer:
          "We're open Monday to Thursday from 11:00 AM to 10:00 PM, Friday to Saturday from 11:00 AM to 11:00 PM, and Sunday from 12:00 PM to 9:00 PM.",
      icon: Icons.access_time,
      category: "Hours & Location",
    ),
    FAQItem(
      question: "Do you offer delivery service?",
      answer:
          "Yes! We offer delivery within a 5-mile radius. Delivery is free for orders over \$25, otherwise there's a \$3.99 delivery fee. Estimated delivery time is 30-45 minutes.",
      icon: RestaurantIcons.delivery,
      category: "Delivery",
    ),
    FAQItem(
      question: "How can I make a reservation?",
      answer:
          "You can make reservations through our app, website, or by calling us directly at (555) 123-4567. We recommend booking 24 hours in advance for dinner reservations.",
      icon: RestaurantIcons.reservation,
      category: "Reservations",
    ),
    FAQItem(
      question: "Do you accommodate dietary restrictions?",
      answer:
          "Absolutely! We offer vegetarian, vegan, gluten-free, and halal options. Please inform our staff about any allergies or dietary requirements when ordering.",
      icon: RestaurantIcons.vegetarian,
      category: "Dietary",
    ),
    FAQItem(
      question: "What payment methods do you accept?",
      answer:
          "We accept all major credit cards (Visa, Mastercard, American Express), cash, mobile payments (Apple Pay, Google Pay), and our restaurant wallet credits.",
      icon: RestaurantIcons.payment,
      category: "Payment",
    ),
    FAQItem(
      question: "How does the loyalty program work?",
      answer:
          "Earn 1 point for every dollar spent. Redeem 100 points for \$5 off your next order. Plus, get special birthday rewards and exclusive member discounts!",
      icon: Icons.stars,
      category: "Rewards",
    ),
    FAQItem(
      question: "Can I modify or cancel my order?",
      answer:
          "Orders can be modified or cancelled within 5 minutes of placing them. After that, please contact us directly and we'll do our best to help you.",
      icon: Icons.edit,
      category: "Orders",
    ),
    FAQItem(
      question: "Do you cater events?",
      answer:
          "Yes! We offer catering services for events of all sizes. Contact us at least 48 hours in advance. Custom menus and dietary accommodations available.",
      icon: Icons.celebration,
      category: "Catering",
    ),
    FAQItem(
      question: "What's your refund policy?",
      answer:
          "If you're not satisfied with your order, contact us within 24 hours and we'll provide a full refund or replacement meal. Customer satisfaction is our priority!",
      icon: Icons.policy,
      category: "Policy",
    ),
  ];

  String _selectedCategory = "All";
  final List<String> _categories = [
    "All",
    "Hours & Location",
    "Delivery",
    "Reservations",
    "Dietary",
    "Payment",
    "Rewards",
    "Orders",
    "Catering",
    "Policy",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: RiveAppTheme.getBackgroundGradient(context),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Glass AppBar
              _buildGlassAppBar(),

              // Help Header
              _buildHelpHeader(),

              // Category Filter
              _buildCategoryFilter(),

              // FAQ List
              Expanded(child: _buildFAQList()),

              // Contact Support Button
              _buildContactSupport(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGlassAppBar() {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            gradient: RiveAppTheme.getGlassGradient(context),
            border: Border(
              bottom: BorderSide(
                color: RiveAppTheme.glassBorder.withOpacity(0.3),
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: RiveAppTheme.glassWhite.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: RiveAppTheme.getTextColor(context),
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Help Center',
                      style: RiveAppTheme.getTitleStyle(
                        context,
                      ).copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Find answers to common questions',
                      style: RiveAppTheme.getCaptionStyle(context),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: RiveAppTheme.getButtonGradient(),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.help_outline,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHelpHeader() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: RiveAppTheme.getCardDecoration(context),
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: RiveAppTheme.getButtonGradient(),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Icon(
                    Icons.support_agent,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'How can we help you?',
                  style: RiveAppTheme.getTitleStyle(
                    context,
                  ).copyWith(fontSize: 20),
                ),
                const SizedBox(height: 8),
                Text(
                  'Browse our frequently asked questions or contact our support team for personalized assistance.',
                  style: RiveAppTheme.getCaptionStyle(context),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: _buildQuickAction(
                        icon: Icons.phone,
                        label: 'Call Us',
                        subtitle: '(555) 123-4567',
                        color: RiveAppTheme.freshGreen,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildQuickAction(
                        icon: Icons.email,
                        label: 'Email',
                        subtitle: 'help@restaurant.com',
                        color: RiveAppTheme.accentOrange,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuickAction({
    required IconData icon,
    required String label,
    required String subtitle,
    required Color color,
  }) {
    return GestureDetector(
      onTap: () => _showContactDialog(label),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3), width: 1),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 8),
            Text(
              label,
              style: RiveAppTheme.getBodyStyle(
                context,
              ).copyWith(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: RiveAppTheme.getCaptionStyle(
                context,
              ).copyWith(fontSize: 11),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryFilter() {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          final isSelected = _selectedCategory == category;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategory = category;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                gradient: isSelected ? RiveAppTheme.getButtonGradient() : null,
                color:
                    !isSelected
                        ? RiveAppTheme.glassWhite.withOpacity(0.1)
                        : null,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color:
                      isSelected
                          ? Colors.transparent
                          : RiveAppTheme.glassBorder.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  category,
                  style: TextStyle(
                    color:
                        isSelected
                            ? Colors.white
                            : RiveAppTheme.getTextColor(context),
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    fontFamily: "Inter",
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFAQList() {
    final filteredFAQs =
        _selectedCategory == "All"
            ? _faqItems
            : _faqItems
                .where((faq) => faq.category == _selectedCategory)
                .toList();

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: filteredFAQs.length,
      itemBuilder: (context, index) {
        return _buildFAQItem(filteredFAQs[index]);
      },
    );
  }

  Widget _buildFAQItem(FAQItem faq) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: RiveAppTheme.getCardDecoration(
              context,
              borderRadius: 15,
            ),
            child: ExpansionTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: RiveAppTheme.secondaryYellow.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  faq.icon,
                  color: RiveAppTheme.secondaryYellow,
                  size: 20,
                ),
              ),
              title: Text(
                faq.question,
                style: RiveAppTheme.getBodyStyle(
                  context,
                ).copyWith(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                faq.category,
                style: RiveAppTheme.getCaptionStyle(
                  context,
                ).copyWith(fontSize: 12),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: RiveAppTheme.glassWhite.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      faq.answer,
                      style: RiveAppTheme.getCaptionStyle(
                        context,
                      ).copyWith(fontSize: 14, height: 1.5),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactSupport() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: RiveAppTheme.getCardDecoration(
              context,
              borderRadius: 15,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: RiveAppTheme.getButtonGradient(),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(
                        Icons.headset_mic,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Still need help?',
                            style: RiveAppTheme.getBodyStyle(
                              context,
                            ).copyWith(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Our support team is available 24/7',
                            style: RiveAppTheme.getCaptionStyle(context),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _showContactDialog('Support'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: RiveAppTheme.getButtonGradient(),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: const Text(
                        'Contact Support',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Inter",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showContactDialog(String method) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Colors.transparent,
            content: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: RiveAppTheme.getCardDecoration(context),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          gradient: RiveAppTheme.getButtonGradient(),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          method == 'Call Us'
                              ? Icons.phone
                              : method == 'Email'
                              ? Icons.email
                              : Icons.headset_mic,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        method == 'Call Us'
                            ? 'Call Support'
                            : method == 'Email'
                            ? 'Email Support'
                            : 'Contact Support',
                        style: RiveAppTheme.getTitleStyle(context),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        method == 'Call Us'
                            ? 'Would you like to call our support team at (555) 123-4567?'
                            : method == 'Email'
                            ? 'Would you like to send an email to help@restaurant.com?'
                            : 'Choose how you\'d like to contact our support team.',
                        style: RiveAppTheme.getBodyStyle(context),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  color: RiveAppTheme.getTextColor(
                                    context,
                                  ).withOpacity(0.7),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Opening $method...'),
                                    backgroundColor: RiveAppTheme.primaryRed,
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  gradient: RiveAppTheme.getButtonGradient(),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  method == 'Call Us'
                                      ? 'Call'
                                      : method == 'Email'
                                      ? 'Email'
                                      : 'Contact',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;
  final IconData icon;
  final String category;

  FAQItem({
    required this.question,
    required this.answer,
    required this.icon,
    required this.category,
  });
}
