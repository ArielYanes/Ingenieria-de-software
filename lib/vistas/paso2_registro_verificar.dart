import 'package:flutter/material.dart';
import '../theme.dart';
import 'paso3_registro_exito.dart';

class Paso2RegistroVerificar extends StatelessWidget {
  const Paso2RegistroVerificar({super.key});

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
                    child: _buildStep2(context),
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
        _buildStepIndicator(1, 'VERIFICAR', true, true),
        _buildStepLine(false),
        _buildStepIndicator(2, 'LISTO', false, false),
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

  Widget _buildStep2(BuildContext context) {
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
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: AppColors.surfaceLight,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(Icons.email_outlined, color: AppColors.textSecondary, size: 32),
        ),
        const SizedBox(height: 24),
        const Text(
          'Verifica tu correo',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 8),
        RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            style: TextStyle(fontSize: 14, color: AppColors.textTertiary),
            children: [
              TextSpan(text: 'Ingresa el código de 6 dígitos que enviamos a '),
              TextSpan(text: 'w***@ugb.edu.sv', style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold)),
              TextSpan(text: ' para\nactivar tu cuenta.'),
            ],
          ),
        ),
        const SizedBox(height: 32),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF0F1A24),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFF162B3D)),
          ),
          child: const Text(
            'El código fue enviado a tu correo @ugb.edu.sv. Revisa también tu carpeta de spam. El código expira en 10 minutos.',
            style: TextStyle(color: Colors.lightBlueAccent, fontSize: 12),
          ),
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(6, (index) => _buildOtpBox(index)),
        ),
        const SizedBox(height: 16),
        const Text(
          '¿No recibiste el código? Reenviar (0:42)',
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.textTertiary, fontSize: 12),
        ),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Paso3RegistroExito()),
            );
          },
          child: const Text('Verificar y crear cuenta →', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: AppColors.surfaceLight),
            ),
          ),
          child: const Text('← Volver y editar datos', style: TextStyle(color: AppColors.textSecondary)),
        ),
        const SizedBox(height: 32),
        _buildFooterTag(),
      ],
    );
  }

  Widget _buildOtpBox(int index) {
    String content = '';
    if (index == 0) content = '4';
    if (index == 1) content = '8';
    if (index == 2) content = '2';

    return Container(
      width: 50,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(8),
        border: content.isNotEmpty ? Border.all(color: AppColors.accent, width: 1) : null,
      ),
      child: Center(
        child: Text(
          content.isEmpty ? '-' : content,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: content.isNotEmpty ? AppColors.accent : AppColors.textTertiary,
          ),
        ),
      ),
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
