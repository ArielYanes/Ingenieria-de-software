import 'package:flutter/material.dart';
import '../theme.dart';
import 'pantalla_dashboard.dart';

class Paso3RegistroExito extends StatelessWidget {
  const Paso3RegistroExito({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 16.0),
            child: Column(
              children: [
                _buildStepper(),
                const SizedBox(height: 32),
                Card(
                  color: AppColors.surface,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(color: Color(0xFF1E2128)),
                  ),
                  child: Container(
                    width: 500,
                    padding: const EdgeInsets.all(40),
                    child: _buildStep3(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStepper() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildStepIndicator(0, 'DATOS', false, true),
        _buildStepLine(true),
        _buildStepIndicator(1, 'VERIFICAR', false, true),
        _buildStepLine(true),
        _buildStepIndicator(2, 'LISTO', true, true),
      ],
    );
  }

  Widget _buildStepIndicator(int stepIndex, String title, bool isActive, bool isCompleted) {
    Color color = (isCompleted || isActive) ? AppColors.accent : AppColors.surfaceLight;
    Widget innerWidget;
    
    if (isCompleted && !isActive) {
      innerWidget = const Icon(Icons.check, size: 14, color: AppColors.background);
    } else if (isActive) {
      innerWidget = Text('${stepIndex + 1}', style: const TextStyle(color: AppColors.background, fontSize: 12, fontWeight: FontWeight.bold));
    } else {
      innerWidget = Text('${stepIndex + 1}', style: const TextStyle(color: AppColors.textTertiary, fontSize: 12));
    }

    return Column(
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (isCompleted || isActive) ? color : Colors.transparent,
            border: Border.all(color: color, width: 2),
          ),
          child: Center(child: innerWidget),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 10,
            letterSpacing: 1.5,
            color: isActive ? AppColors.accent : AppColors.textTertiary,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildStepLine(bool isCompleted) {
    return Container(
      width: 40,
      height: 2,
      margin: const EdgeInsets.only(bottom: 20, left: 8, right: 8),
      color: isCompleted ? AppColors.accent : AppColors.surfaceLight,
    );
  }

  Widget _buildStep3(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(Icons.link, color: Colors.black, size: 20),
            ),
            const SizedBox(width: 8),
            const Text(
              'IronLink',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: -0.5),
            ),
          ],
        ),
        const SizedBox(height: 32),
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.accent.withOpacity(0.1),
            border: Border.all(color: AppColors.accent, width: 2),
          ),
          child: const Center(
            child: Icon(Icons.check, color: AppColors.accent, size: 40),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          '¡Cuenta creada!',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 8),
        const Text(
          'Tu cuenta institucional IronLink ha sido activada exitosamente. Ya puedes\nacceder a tu aula virtual UGB.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, color: AppColors.textTertiary),
        ),
        const SizedBox(height: 32),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.surfaceLight,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              _buildDetailRow('NOMBRE', 'Walter Ramírez'),
              const Divider(color: Color(0xFF2A2D35), height: 32),
              _buildDetailRow('CARNET', 'UGB-2022-0341', valueColor: AppColors.accent),
              const Divider(color: Color(0xFF2A2D35), height: 32),
              _buildDetailRow('CORREO', 'walter.ramirez@ugb.edu.sv'),
              const Divider(color: Color(0xFF2A2D35), height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('ESTADO', style: TextStyle(color: AppColors.textTertiary, fontSize: 12, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      const Icon(Icons.circle, color: AppColors.accent, size: 8),
                      const SizedBox(width: 6),
                      const Text('Activo', style: TextStyle(color: AppColors.accent, fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const PantallaDashboard()),
              (route) => false,
            );
          },
          child: const Text('Ir a mi aula virtual →', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 32),
        _buildFooterTag(text: 'Registro exitoso • Universidad Gerardo Barrios • IronLink'),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value, {Color valueColor = Colors.white}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: AppColors.textTertiary, fontSize: 12, fontWeight: FontWeight.bold)),
        Text(value, style: TextStyle(color: valueColor, fontSize: 14)),
      ],
    );
  }

  Widget _buildFooterTag({String text = 'Registro exclusivo • Universidad Gerardo Barrios • Acceso institucional'}) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.surfaceLight,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.circle, color: AppColors.accentDark, size: 8),
            const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(color: AppColors.textTertiary.withOpacity(0.5), fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
