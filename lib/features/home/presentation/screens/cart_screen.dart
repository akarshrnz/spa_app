import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:spa_booking_app/core/app_image.dart';
import 'package:spa_booking_app/core/theme/app_colors.dart';
import 'package:spa_booking_app/core/theme/app_text_styles.dart';
import 'package:spa_booking_app/core/theme/app_theme.dart';
import 'package:spa_booking_app/features/home/presentation/screens/widgets/gradient_button.dart';
import 'package:spa_booking_app/features/home/presentation/screens/widgets/booking_confirmation_dialog.dart';
import 'package:spa_booking_app/features/home/presentation/screens/gradients/GradientBoxBorder.dart';

class CartScreen
    extends
        StatelessWidget {
  const CartScreen({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    final cartItems = [
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

    const selectedTotal = '₹12,500';
    const payableAmount = '₹12,650';

    return Scaffold(
      backgroundColor: AppColors.cardBackground,

      appBar: AppBar(
        backgroundColor: AppColors.cardBackground,
        surfaceTintColor: AppColors.cardBackground,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.primary,
          ),
          onPressed: () => Navigator.pop(
            context,
          ),
        ),
        title: const Text(
          "Cart",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.fromLTRB(
              16,
              16,
              16,
              120,
            ),
            children: [
              Row(
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
                      colors: [
                        AppColors.secondaryGradient,
                        AppColors.primaryGradient,
                      ],
                    ),
                  ),
                ],
              ),
              ...cartItems
                  .map(
                    (
                      item,
                    ) => _buildCartItem(
                      item,
                    ),
                  )
                  .toList(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Offers & Discounts',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              _buildCouponBox(),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Payment Summary',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 18,
                ),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                  border: Border.all(
                    color: Color(
                      0xFFF0F0F0,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    _buildPriceRow(
                      'Selected Services',
                      selectedTotal,
                    ),
                   
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.secondaryGradient,
                            AppColors.primaryGradient,
                          ],
                        ),
                      ),
                      height: .5,
                      width: MediaQuery.of(
                        context,
                      ).size.width,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    _buildPriceRow(
                      'Additional Fee',
                      '₹50',
                    ),
                    _buildPriceRow(
                      'Convenience Fee',
                      '₹100',
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.secondaryGradient,
                            AppColors.primaryGradient,
                          ],
                        ),
                      ),
                      height: .5,
                      width: MediaQuery.of(
                        context,
                      ).size.width,
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    _buildPriceRow(
                      'Payable Amount',
                      payableAmount,
                      isTotal: true,
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Bottom Bar
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(
                  16,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(
                      0,
                      3,
                    ),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Total  ',
                    style: AppTextStyles.cardSubText.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GradientText(
                    '₹30,000',

                    gradientType: GradientType.radial,
                    radius: 2.5,
                    colors: [
                      AppColors.secondaryGradient,
                      AppColors.primaryGradient,
                    ],
                  ),
                  Spacer(),
                  GradientButton(
                    height: 48,
                    width: 150,
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      colors: [
                        AppColors.secondaryGradient,
                        AppColors.primaryGradient,
                      ],
                    ),
                    radius: 16,

                    onTap: () {
                      showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => const BookingConfirmationDialog(),
  );
                    },
                    title: "Pay",
                  ),
                ],
              ),
            ),
          ),
       
        ],
      ),
    );
  }

  Widget _buildCartItem(
    Map<
      String,
      String
    >
    item,
  ) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 16,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(
              0xFFF0F0F0,
            ),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item['title'] ??
                '',
            style: AppTextStyles.serviceTitle,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            item['gender'] ??
                '',
            style: AppTextStyles.cardSubText,
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${item['price']} • ${item['duration']}',
                style: AppTextStyles.priceText,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
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

                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                  ),
                  child: GradientText(
                    "Remove",

                    gradientType: GradientType.radial,
                    radius: 2.5,
                    colors: [
                      AppColors.secondaryGradient,
                      AppColors.primaryGradient,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCouponBox() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(
          12,
        ),
        border: Border.all(
          color: Color(
            0xFFF0F0F0,
          ),
        ),
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
          SizedBox(
            width: 10,
          ),
          Text(
            'Apply Coupon',
            style: TextStyle(
              fontSize: 15,
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
            color: AppColors.secondary,
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(
    String label,
    String value, {
    bool isTotal = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyles.cardSubText.copyWith(
              fontWeight: isTotal
                  ? FontWeight.w700
                  : FontWeight.w500,
              fontSize: isTotal
                  ? 15
                  : 14,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isTotal
                  ? FontWeight.w700
                  : FontWeight.w500,
              fontSize: isTotal
                  ? 15
                  : 14,
              color: isTotal
                  ? AppColors.primary
                  : AppColors.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
