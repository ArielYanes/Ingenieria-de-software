import 'package:flutter/material.dart';
import '../theme.dart';

class TarjetaClasePequena extends StatelessWidget {
  final String title;
  final String code;
  final String prof;
  final int students;
  final bool isActive;
  final Color dotColor;

  const TarjetaClasePequena({
    super.key,
    required this.title,
    required this.code,
    required this.prof,
    required this.students,
    required this.isActive,
    required this.dotColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isActive ? AppColors.accent.withOpacity(0.3) : const Color(0xFF1E2128)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.circle, color: dotColor, size: 8),
              const SizedBox(width: 8),
              Expanded(child: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis)),
            ],
          ),
          const SizedBox(height: 8),
          Text('$code • $prof', style: const TextStyle(color: AppColors.textTertiary, fontSize: 11)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.people_alt_outlined, color: AppColors.textTertiary, size: 14),
                  const SizedBox(width: 4),
                  Text('$students estudiantes', style: const TextStyle(color: AppColors.textTertiary, fontSize: 11)),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: isActive ? AppColors.accent.withOpacity(0.1) : const Color(0xFF1E2128),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  isActive ? 'Activa' : 'Inactiva',
                  style: TextStyle(color: isActive ? AppColors.accent : AppColors.textTertiary, fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
