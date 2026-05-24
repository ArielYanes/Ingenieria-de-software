import 'package:flutter/material.dart';
import '../theme.dart';

class TarjetaClaseGrande extends StatelessWidget {
  final String title;
  final String subtitle;
  final int students;
  final int classesGiven;
  final bool isActive;
  final IconData icon;
  final Color themeColor;
  final String? alertText;

  const TarjetaClaseGrande({
    super.key,
    required this.title,
    required this.subtitle,
    required this.students,
    required this.classesGiven,
    required this.isActive,
    required this.icon,
    required this.themeColor,
    this.alertText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0x332A9D8F)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 4,
            decoration: BoxDecoration(
              color: themeColor,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: themeColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(icon, color: themeColor, size: 24),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: isActive ? AppColors.accent.withOpacity(0.1) : const Color(0x332A9D8F),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            if (isActive) const Icon(Icons.circle, color: AppColors.accent, size: 8),
                            if (isActive) const SizedBox(width: 4),
                            Text(
                              isActive ? 'Activa' : 'Inactiva',
                              style: TextStyle(color: isActive ? AppColors.accent : AppColors.textTertiary, fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (alertText != null) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.warning.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.bolt, color: AppColors.warning, size: 14),
                          const SizedBox(width: 4),
                          Text(alertText!, style: const TextStyle(color: AppColors.warning, fontSize: 11, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                  Text(title, style: const TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Text(subtitle, style: const TextStyle(color: AppColors.textTertiary, fontSize: 12), maxLines: 1, overflow: TextOverflow.ellipsis),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('$students', style: TextStyle(color: themeColor, fontSize: 18, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 2),
                              const Text('ESTUDIANTES', style: TextStyle(color: AppColors.textTertiary, fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 1)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('$classesGiven', style: TextStyle(color: themeColor, fontSize: 18, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 2),
                              const Text('CLASES DADAS', style: TextStyle(color: AppColors.textTertiary, fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 1)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: isActive
                            ? ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.cast_for_education, size: 16),
                                label: const Text('Unirse ahora', style: TextStyle(fontWeight: FontWeight.bold)),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                ),
                              )
                            : OutlinedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.folder_open, size: 16, color: AppColors.textSecondary),
                                label: const Text('Ver material', style: TextStyle(color: AppColors.textSecondary, fontWeight: FontWeight.bold)),
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                  side: const BorderSide(color: Color(0x332A9D8F)),
                                ),
                              ),
                      ),
                      const SizedBox(width: 12),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                          side: const BorderSide(color: Color(0x332A9D8F)),
                        ),
                        child: const Text('Ver más', style: TextStyle(color: AppColors.textSecondary)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


