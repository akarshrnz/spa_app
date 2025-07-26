import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return PreferredSize(
      preferredSize: Size.fromHeight(60.h),
      child: Padding(
        padding: EdgeInsets.only(top: 36.h, left: 16.w),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F4EF),
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8.r,
                      offset: Offset(0, 2.h),
                    ),
                  ],
                ),
                child: Icon(Icons.arrow_back_ios_new, size: 18.sp, color: Colors.black),
              ),
            ),
            SizedBox(width: 12.w),
            Text(
              'Cart',
              style: TextStyle(
                fontSize: 20.sp,
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
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 120.h),
      children: [
        _buildServicesHeader(),
        ..._buildCartItems(),
        SizedBox(height: 20.h),
        _buildOffersSection(),
        SizedBox(height: 24.h),
        _buildPaymentSummary(),
      ],
    );
  }

  Widget _buildServicesHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Your Services Order',
          style: TextStyle(
            fontSize: 16.sp,
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
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFF0F0F0)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item['title'] ?? '', style: AppTextStyles.serviceTitle),
          SizedBox(height: 4.h),
          Text(item['gender'] ?? '', style: AppTextStyles.cardSubText),
          SizedBox(height: 4.h),
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
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        alignment: Alignment.center,
        height: 32.h,
        width: 92.w,
        decoration: BoxDecoration(
          border: GradientBoxBorder(
            gradient: LinearGradient(
              colors: [AppColors.secondaryGradient, AppColors.primaryGradient],
            ),
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(8.r),
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
        Text(
          'Offers & Discounts',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10.h),
        _buildCouponBox(),
      ],
    );
  }

  Widget _buildCouponBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFF0F0F0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(AppImage.oggerLight, fit: BoxFit.cover, height: 28.h, width: 22.w),
          SizedBox(width: 10.w),
          Text(
            'Apply Coupon',
            style: TextStyle(
              fontSize: 15.sp,
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
          Icon(Icons.arrow_forward_ios_rounded, size: 16.sp, color: AppColors.secondary),
        ],
      ),
    );
  }

  Widget _buildPaymentSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Summary',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.h),
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 18.h),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: const Color(0xFFF0F0F0)),
          ),
          child: Column(
            children: [
              _buildPriceRow('Selected Services', '₹12,500'),
              _buildDivider(),
              SizedBox(height: 14.h),
              _buildPriceRow('Additional Fee', '₹50'),
              _buildPriceRow('Convenience Fee', '₹100'),
              _buildDivider(),
              SizedBox(height: 14.h),
              _buildPriceRow('Payable Amount', '₹12,650', isTotal: true),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPriceRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyles.cardSubText.copyWith(
              fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500,
              fontSize: isTotal ? 15.sp : 14.sp,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500,
              fontSize: isTotal ? 15.sp : 14.sp,
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
          colors: [AppColors.secondaryGradient, AppColors.primaryGradient],
        ),
      ),
      height: 0.5.h,
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Positioned(
      bottom: 10.h,
      left: 10.w,
      right: 10.w,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6.r,
              offset: Offset(0, 3.h),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Total  ',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
            GradientText(
              '₹30,000',
              gradientType: GradientType.radial,
              radius: 2.5,
              colors: const [AppColors.secondaryGradient, AppColors.primaryGradient],
            ),
            const Spacer(),
            GradientButton(
              height: 48.h,
              width: 150.w,
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                colors: [AppColors.secondaryGradient, AppColors.primaryGradient],
              ),
              radius: 16.r,
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
