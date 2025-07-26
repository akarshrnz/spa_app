import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:spa_booking_app/core/app_image.dart';
import 'package:spa_booking_app/core/theme/app_colors.dart';
import 'package:spa_booking_app/core/theme/app_text_styles.dart';
import 'package:spa_booking_app/features/home/presentation/screens/cart_screen.dart';
import 'package:spa_booking_app/features/home/presentation/screens/gradients/GradientBoxBorder.dart';
import 'package:spa_booking_app/features/home/presentation/screens/gradients/gradeint_circle.dart';
import 'package:spa_booking_app/features/home/presentation/screens/widgets/dotted_line.dart';
import 'package:spa_booking_app/features/home/presentation/screens/widgets/gradient_button.dart';


class SpaDetailScreen extends StatefulWidget {
  const SpaDetailScreen({super.key});

  @override
  State<SpaDetailScreen> createState() => _SpaDetailScreenState();
}

class _SpaDetailScreenState extends State<SpaDetailScreen> {
  final List<String> filters = [
    'All',
    'Home-visit',
    'Walk-in',
    'Male',
    'Female',
  ];
  
  String selectedFilter = 'All';
  final Set<String> selectedServices = {'Swedish Massage'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardBackground,
      body: Stack(
        children: [
          _buildTopBanner(context),
          _buildMainContent(context),
          _buildBackButton(),
          _buildBottomBar(),
        ],
      ),
    );
  }

  Widget _buildTopBanner(BuildContext context) {
    return Positioned.fill(
      top: 0,
      bottom: MediaQuery.of(context).size.height * 0.65,
      child: Image.asset(
        AppImage.spaImage,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Positioned.fill(
      top: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 80),
              children: [
                _buildSpaInfoCard(),
                const SizedBox(height: 12),
                _buildChips(),
                const SizedBox(height: 20),
                _buildServiceSection(
                  'Massage Therapy',
                  [
                    _buildServiceTile(
                      title: 'Swedish Massage',
                      price: '₹4,000',
                      duration: '60 Mins',
                      type: 'Walkin',
                      image: AppImage.humanLogo,
                    ),
                    _buildServiceTile(
                      title: 'Deep Tissue Massage',
                      price: '₹6,200',
                      duration: '60 Mins',
                      type: 'Walkin',
                      image: AppImage.femaleLogo,
                    ),
                    _buildServiceTile(
                      title: 'Hot Stone Massage',
                      price: '₹8,500',
                      duration: '60 Mins',
                      type: 'Homevisit',
                      image: AppImage.maleLogo,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _buildServiceSection('Hair Cut Wash & Style', []),
                _buildServiceSection('Nail Bar', []),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackButton() {
    return Positioned(
      top: 40,
      left: 16,
      child: Container(
      
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient:  LinearGradient(
                begin: Alignment.centerLeft,
                colors: [
                  AppColors.secondaryGradient.withOpacity(.3),
                  AppColors.secondaryGradient.withOpacity(.3),
                 // AppColors.primaryGradient.withOpacity(.8),
                ],
              )),
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,color: Colors.black,),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Positioned(
      bottom: 10,
      left: 10,
      right: 10,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
          )],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${selectedServices.length} Services added',
              style: AppTextStyles.cardSubText.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            GradientButton(
              height: 48,
              width: 150,
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                colors: [
                  AppColors.secondaryGradient,
                  AppColors.primaryGradient,
                ],
              ),
              radius: 16,
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const CartScreen()),
                );
              },
              title: "Check out",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpaInfoCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSpaHeader(),
          const SizedBox(height: 10),
          _buildDivider(),
          const SizedBox(height: 10),
          _buildOfferCard(),
        ],
      ),
    );
  }

  Widget _buildSpaHeader() {
    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: Colors.red,
          child: Text(
            'H',
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Oasis Spa Haven',
              style: AppTextStyles.cardTitle,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Image.asset(AppImage.shopColor, width: 20, height: 20),
                Text(' Madhapur', style: AppTextStyles.cardSubText),
                const SizedBox(width: 12),
                Image.asset(AppImage.roundLocationIconColor, width: 20, height: 20),
                Text(' 3.5 km', style: AppTextStyles.cardSubText),
                const SizedBox(width: 12),
                Image.asset(AppImage.star, width: 20, height: 20),
                Text(' 4.5', style: AppTextStyles.cardSubText),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return DottedLine(
      space: 5,
      color: AppColors.primaryGradient.withOpacity(.5),
    );
  }

  Widget _buildOfferCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.cardBackground,
        border: Border.all(width: 2, color: const Color(0xFFF0F0F0)),
      ),
      child: Row(
        children: [
          Image.asset(AppImage.offer, width: 32, height: 30),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Use code DSaloon',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const Text(
                'Get ₹500 off on orders above 100/-',
                style: AppTextStyles.cardSubText,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChips() {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final chip = filters[index];
          final isSelected = chip == selectedFilter;
          return GestureDetector(
            onTap: () => setState(() => selectedFilter = chip),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                border: isSelected
                    ? null
                    : const GradientBoxBorder(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.secondaryGradient,
                            AppColors.primaryGradient,
                          ],
                        ),
                        width: 1,
                      ),
                gradient: isSelected
                    ? const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.center,
                        colors: [
                          AppColors.secondaryGradient,
                          AppColors.primaryGradient,
                        ],
                      )
                    : null,
                borderRadius: BorderRadius.circular(16),
              ),
              child: isSelected
                  ? Text(
                      chip,
                      style: TextStyle(
                        color: isSelected ? Colors.white : AppColors.chipText,
                      ),
                    )
                  : GradientText(
                      chip,
                      gradientType: GradientType.radial,
                      radius: 2.5,
                      colors: const [
                        AppColors.secondaryGradient,
                        AppColors.primaryGradient,
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildServiceSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.serviceCard,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              Text(title, style: AppTextStyles.sectionTitle),
              const Spacer(),
              const Icon(
                Icons.keyboard_arrow_up_rounded,
                color: AppColors.primaryGradient,
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        ...children,
      ],
    );
  }

  Widget _buildServiceTile({
    required String title,
    required String price,
    required String duration,
    required String type,
    required String image,
  }) {
    final isSelected = selectedServices.contains(title);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.serviceCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildServiceHeader(title, image),
                const SizedBox(height: 10),
                _buildServiceFooter(price, duration, type, isSelected, title),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceHeader(String title, String image) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTextStyles.serviceTitle),
            const SizedBox(height: 4),
            Text(
              'Experience relaxation and stress relief...',
              style: AppTextStyles.serviceDescription,
            ),
          ],
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            height: 28,
            width: 22,
          ),
        ),
      ],
    );
  }

  Widget _buildServiceFooter(
    String price,
    String duration,
    String type,
    bool isSelected,
    String title,
  ) {
    return Row(
      children: [
        Text(price, style: AppTextStyles.priceText),
        _buildGradientCircle(),
        Text(duration, style: AppTextStyles.cardSubText),
        _buildGradientCircle(),
        Text(type, style: AppTextStyles.cardSubText),
        const Spacer(),
        isSelected ? _buildRemoveButton(title) : _buildAddButton(title),
      ],
    );
  }

  Widget _buildGradientCircle() {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: GradientCircle(
        size: 5,
        radius: 2.5,
        colors: const [
          AppColors.secondaryGradient,
          AppColors.primaryGradient,
        ],
      ),
    );
  }

  Widget _buildRemoveButton(String title) {
    return InkWell(
      onTap: () {
        selectedServices.remove(title);
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        alignment: Alignment.center,
        height: 32,
        width: 92,
        decoration: BoxDecoration(
          border: const GradientBoxBorder(
            gradient: LinearGradient(
              colors: [
                AppColors.secondaryGradient,
                AppColors.primaryGradient,
              ],
            ),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: GradientText(
          "Remove",
          gradientType: GradientType.radial,
          radius: 2.5,
          colors: const [
            AppColors.secondaryGradient,
            AppColors.primaryGradient,
          ],
        ),
      ),
    );
  }

  Widget _buildAddButton(String title) {
    return GradientButton(
      height: 32,
      width: 92,
      gradient: const LinearGradient(
        begin: Alignment.centerLeft,
        colors: [
          AppColors.secondaryGradient,
          AppColors.primaryGradient,
        ],
      ),
      radius: 16,
      onTap: () {
        selectedServices.add(title);
        setState(() {});
      },
      title: "Add",
    );
  }
}