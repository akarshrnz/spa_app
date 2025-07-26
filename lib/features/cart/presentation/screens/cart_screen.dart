import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:spa_booking_app/core/app_image.dart';
import 'package:spa_booking_app/core/theme/app_colors.dart';
import 'package:spa_booking_app/core/theme/app_text_styles.dart';
import 'package:spa_booking_app/core/common_widgets/gradient_button.dart';
import 'package:spa_booking_app/features/cart/presentation/screens/widgets/booking_confirmation_dialog.dart';
import 'package:spa_booking_app/core/common_widgets/gradients/GradientBoxBorder.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardBackground,
      appBar: _buildAppBar(context),
      body: Stack(
        children: [
          _buildCartContent(),
          _buildBottomBar(context),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return   PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Padding(
          padding: const EdgeInsets.only(top: 36.0, left: 16.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F4EF), // Soft white/cream bg
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.arrow_back_ios_new, size: 18, color: Colors.black),
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Cart',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      );
  }

  Widget _buildCartContent() {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
      children: [
        _buildServicesHeader(),
        ..._buildCartItems(),
        const SizedBox(height: 20),
        _buildOffersSection(),
        const SizedBox(height: 24),
        _buildPaymentSummary(),
      ],
    );
  }

  Widget _buildServicesHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Your Services Order',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: GradientText(
            "+ Add more",
            gradientType: GradientType.radial,
            radius: 2.5,
            colors: const [
              AppColors.secondaryGradient,
              AppColors.primaryGradient,
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> _buildCartItems() {
    const cartItems = [
      {
        'title': 'Swedish Massage',
        'price': '₹4,000',
        'duration': '60 Mins',
        'gender': 'For Male',
      },
      {
        'title': 'Deep Tissue Massage',
        'price': '₹6,200',
        'duration': '60 Mins',
        'gender': 'For Male',
      },
      {
        'title': 'Hot Stone Massage',
        'price': '₹6,200',
        'duration': '60 Mins',
        'gender': 'For Male',
      },
    ];

    return cartItems.map(_buildCartItem).toList();
  }

  Widget _buildCartItem(Map<String, String> item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFF0F0F0)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item['title'] ?? '',
            style: AppTextStyles.serviceTitle,
          ),
          const SizedBox(height: 4),
          Text(
            item['gender'] ?? '',
            style: AppTextStyles.cardSubText,
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${item['price']} • ${item['duration']}',
                style: AppTextStyles.priceText,
              ),
              _buildRemoveButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRemoveButton() {
    return InkWell(
      onTap: () {},
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
          borderRadius: BorderRadius.circular(8),
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

  Widget _buildOffersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Offers & Discounts',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        _buildCouponBox(),
      ],
    );
  }

  Widget _buildCouponBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF0F0F0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            AppImage.oggerLight,
            fit: BoxFit.cover,
            height: 28,
            width: 22,
          ),
          const SizedBox(width: 10),
          const Text(
            'Apply Coupon',
            style: TextStyle(
              fontSize: 15,
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
            color: AppColors.secondary,
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Payment Summary',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFF0F0F0)),
          ),
          child: Column(
            children: [
              _buildPriceRow('Selected Services', '₹12,500'),
              _buildDivider(),
              const SizedBox(height: 14),
              _buildPriceRow('Additional Fee', '₹50'),
              _buildPriceRow('Convenience Fee', '₹100'),
              _buildDivider(),
              const SizedBox(height: 14),
              _buildPriceRow(
                'Payable Amount',
                '₹12,650',
                isTotal: true,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPriceRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyles.cardSubText.copyWith(
              fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500,
              fontSize: isTotal ? 15 : 14,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500,
              fontSize: isTotal ? 15 : 14,
              color: isTotal ? AppColors.primary : AppColors.secondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.secondaryGradient,
            AppColors.primaryGradient,
          ],
        ),
      ),
      height: 0.5,
    );
  }

  Widget _buildBottomBar(BuildContext context) {
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
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Total  ',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            GradientText(
              '₹30,000',
              gradientType: GradientType.radial,
              radius: 2.5,
              colors: const [
                AppColors.secondaryGradient,
                AppColors.primaryGradient,
              ],
            ),
            const Spacer(),
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
              onTap: () => _showConfirmationDialog(context),
              title: "Pay",
            ),
          ],
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const BookingConfirmationDialog(),
    );
  }
}