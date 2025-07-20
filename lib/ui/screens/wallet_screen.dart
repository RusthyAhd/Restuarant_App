import 'package:flutter/material.dart';
import '../theme.dart';
import '../components/restaurant_icons.dart';
import 'dart:ui';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  double _walletBalance = 125.50;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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

              // Wallet Card
              _buildWalletCard(),

              // Quick Actions
              _buildQuickActions(),

              // Tabs and Content
              _buildTabsAndContent(),
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
                      'My Wallet',
                      style: RiveAppTheme.getTitleStyle(
                        context,
                      ).copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Manage your dining credits',
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
                child: Icon(
                  Icons.account_balance_wallet,
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

  Widget _buildWalletCard() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  RiveAppTheme.secondaryYellow.withOpacity(0.3),
                  RiveAppTheme.accentOrange.withOpacity(0.2),
                ],
              ),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: RiveAppTheme.glassBorder.withOpacity(0.5),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: RiveAppTheme.getShadow(context),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        Icons.account_balance_wallet,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Dining Credits',
                          style: RiveAppTheme.getCaptionStyle(context).copyWith(
                            color: RiveAppTheme.getTextColor(
                              context,
                            ).withOpacity(0.8),
                          ),
                        ),
                        Text(
                          'Restaurant Wallet',
                          style: RiveAppTheme.getBodyStyle(
                            context,
                          ).copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Text(
                  'Available Balance',
                  style: RiveAppTheme.getCaptionStyle(context).copyWith(
                    color: RiveAppTheme.getTextColor(context).withOpacity(0.7),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$$_walletBalance',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: RiveAppTheme.getTextColor(context),
                    fontFamily: "Poppins",
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: RiveAppTheme.freshGreen.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: RiveAppTheme.freshGreen.withOpacity(0.5),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.trending_up,
                            color: RiveAppTheme.freshGreen,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '+\$25 this month',
                            style: TextStyle(
                              color: RiveAppTheme.freshGreen,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              fontFamily: "Inter",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Last updated: Today',
                      style: RiveAppTheme.getCaptionStyle(
                        context,
                      ).copyWith(fontSize: 12),
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

  Widget _buildQuickActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: _buildActionButton(
              icon: Icons.add,
              label: 'Add Money',
              color: RiveAppTheme.freshGreen,
              onTap: () => _showAddMoneyDialog(),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildActionButton(
              icon: Icons.send,
              label: 'Transfer',
              color: RiveAppTheme.accentOrange,
              onTap: () => _showTransferDialog(),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildActionButton(
              icon: Icons.payment,
              label: 'Pay Bill',
              color: RiveAppTheme.primaryRed,
              onTap: () => _showPayBillDialog(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            decoration: RiveAppTheme.getCardDecoration(
              context,
              borderRadius: 15,
            ),
            child: Column(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: RiveAppTheme.getCaptionStyle(
                    context,
                  ).copyWith(fontWeight: FontWeight.w600, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabsAndContent() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: RiveAppTheme.glassWhite.withOpacity(0.1),
                borderRadius: BorderRadius.circular(25),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  gradient: RiveAppTheme.getButtonGradient(),
                  borderRadius: BorderRadius.circular(25),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                labelColor: Colors.white,
                unselectedLabelColor: RiveAppTheme.getTextColor(
                  context,
                ).withOpacity(0.7),
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: "Inter",
                ),
                tabs: const [
                  Tab(text: 'Transactions'),
                  Tab(text: 'Rewards'),
                  Tab(text: 'Cards'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildTransactionsTab(),
                  _buildRewardsTab(),
                  _buildCardsTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionsTab() {
    final transactions = _getSampleTransactions();

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: RiveAppTheme.getCardDecoration(
                  context,
                  borderRadius: 15,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color:
                            transaction.isIncoming
                                ? RiveAppTheme.freshGreen.withOpacity(0.2)
                                : RiveAppTheme.primaryRed.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        transaction.isIncoming
                            ? Icons.arrow_downward
                            : Icons.arrow_upward,
                        color:
                            transaction.isIncoming
                                ? RiveAppTheme.freshGreen
                                : RiveAppTheme.primaryRed,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transaction.title,
                            style: RiveAppTheme.getBodyStyle(
                              context,
                            ).copyWith(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            transaction.description,
                            style: RiveAppTheme.getCaptionStyle(context),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${transaction.isIncoming ? '+' : '-'}\$${transaction.amount}',
                          style: RiveAppTheme.getBodyStyle(context).copyWith(
                            color:
                                transaction.isIncoming
                                    ? RiveAppTheme.freshGreen
                                    : RiveAppTheme.primaryRed,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          transaction.time,
                          style: RiveAppTheme.getCaptionStyle(
                            context,
                          ).copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildRewardsTab() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: RiveAppTheme.getCardDecoration(context),
                child: Column(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        gradient: RiveAppTheme.getButtonGradient(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.stars,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Loyalty Points',
                      style: RiveAppTheme.getTitleStyle(context),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '2,450 Points',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: RiveAppTheme.secondaryYellow,
                        fontFamily: "Poppins",
                      ),
                    ),
                    const SizedBox(height: 16),
                    LinearProgressIndicator(
                      value: 0.7,
                      backgroundColor: RiveAppTheme.glassWhite.withOpacity(0.3),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        RiveAppTheme.secondaryYellow,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '550 points to next reward',
                      style: RiveAppTheme.getCaptionStyle(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text('Available Rewards', style: RiveAppTheme.getTitleStyle(context)),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: [
                _buildRewardItem(
                  title: 'Free Appetizer',
                  points: '500 Points',
                  icon: RestaurantIcons.salad,
                  color: RiveAppTheme.freshGreen,
                ),
                _buildRewardItem(
                  title: '10% Off Next Order',
                  points: '1000 Points',
                  icon: RestaurantIcons.discount,
                  color: RiveAppTheme.accentOrange,
                ),
                _buildRewardItem(
                  title: 'Free Dessert',
                  points: '750 Points',
                  icon: RestaurantIcons.dessert,
                  color: RiveAppTheme.warmBrown,
                ),
                _buildRewardItem(
                  title: 'VIP Table Reservation',
                  points: '2000 Points',
                  icon: RestaurantIcons.reservation,
                  color: RiveAppTheme.primaryRed,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRewardItem({
    required String title,
    required String points,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: RiveAppTheme.getCardDecoration(
              context,
              borderRadius: 15,
            ),
            child: Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: RiveAppTheme.getBodyStyle(
                          context,
                        ).copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        points,
                        style: RiveAppTheme.getCaptionStyle(context),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    gradient: RiveAppTheme.getButtonGradient(),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Redeem',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      fontFamily: "Inter",
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

  Widget _buildCardsTab() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Payment Methods', style: RiveAppTheme.getTitleStyle(context)),
          const SizedBox(height: 20),
          _buildPaymentCard(
            cardNumber: '**** **** **** 1234',
            cardType: 'Visa',
            isDefault: true,
          ),
          const SizedBox(height: 16),
          _buildPaymentCard(
            cardNumber: '**** **** **** 5678',
            cardType: 'Mastercard',
            isDefault: false,
          ),
          const SizedBox(height: 20),
          Center(
            child: GestureDetector(
              onTap: () => _showAddCardDialog(),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: RiveAppTheme.glassBorder.withOpacity(0.5),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: RiveAppTheme.getTextColor(context)),
                    const SizedBox(width: 8),
                    Text(
                      'Add New Card',
                      style: RiveAppTheme.getBodyStyle(
                        context,
                      ).copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentCard({
    required String cardNumber,
    required String cardType,
    required bool isDefault,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: RiveAppTheme.getCardDecoration(context, borderRadius: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    cardType == 'Visa' ? Icons.credit_card : Icons.credit_card,
                    color: RiveAppTheme.secondaryYellow,
                    size: 24,
                  ),
                  const Spacer(),
                  if (isDefault)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: RiveAppTheme.freshGreen.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Default',
                        style: TextStyle(
                          color: RiveAppTheme.freshGreen,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Inter",
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                cardNumber,
                style: RiveAppTheme.getBodyStyle(context).copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(cardType, style: RiveAppTheme.getCaptionStyle(context)),
                  const Spacer(),
                  Text(
                    'Expires 12/25',
                    style: RiveAppTheme.getCaptionStyle(context),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAddMoneyDialog() {
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
                      Text(
                        'Add Money',
                        style: RiveAppTheme.getTitleStyle(context),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Feature coming soon!',
                        style: RiveAppTheme.getBodyStyle(context),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            gradient: RiveAppTheme.getButtonGradient(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            'OK',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }

  void _showTransferDialog() {
    _showAddMoneyDialog(); // Same dialog for now
  }

  void _showPayBillDialog() {
    _showAddMoneyDialog(); // Same dialog for now
  }

  void _showAddCardDialog() {
    _showAddMoneyDialog(); // Same dialog for now
  }

  List<Transaction> _getSampleTransactions() {
    return [
      Transaction(
        title: 'Order Payment',
        description: 'Pizza Margherita & Drinks',
        amount: 25.99,
        time: '2 hours ago',
        isIncoming: false,
      ),
      Transaction(
        title: 'Wallet Top-up',
        description: 'Added via Credit Card',
        amount: 50.00,
        time: '1 day ago',
        isIncoming: true,
      ),
      Transaction(
        title: 'Order Payment',
        description: 'Caesar Salad',
        amount: 12.50,
        time: '3 days ago',
        isIncoming: false,
      ),
      Transaction(
        title: 'Cashback Reward',
        description: 'Monthly bonus',
        amount: 5.00,
        time: '1 week ago',
        isIncoming: true,
      ),
      Transaction(
        title: 'Order Payment',
        description: 'Grilled Salmon Dinner',
        amount: 28.99,
        time: '1 week ago',
        isIncoming: false,
      ),
    ];
  }
}

class Transaction {
  final String title;
  final String description;
  final double amount;
  final String time;
  final bool isIncoming;

  Transaction({
    required this.title,
    required this.description,
    required this.amount,
    required this.time,
    required this.isIncoming,
  });
}
