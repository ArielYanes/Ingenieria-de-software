import 'package:flutter/material.dart';
import '../theme.dart';
import 'paso3_recuperar_nueva_clave.dart';

class Paso2RecuperarCodigo extends StatelessWidget {
  const Paso2RecuperarCodigo({super.key});

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
                _buildSegmentedStepper(),
                const SizedBox(height: 32),
                Card(
                  color: AppColors.surface,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(color: Color(0xFF1E2128)),
                  ),
                  child: Container(
                    width: 450,
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

  Widget _buildSegmentedStepper() {
    return Container(
      width: 450,
      decoration: const BoxDecoration(color: AppColors.background),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildSegment(0, '1', 'VERIFICAR', false, true),
          const SizedBox(width: 8),
          _buildSegment(1, '2', 'CÓDIGO', true, false),
          const SizedBox(width: 8),
          _buildSegment(2, '3', 'NUEVA CLAVE', false, false),
        ],
      ),
    );
  }

  Widget _buildSegment(int stepIndex, String number, String text, bool isActive, bool isCompleted) {
    Color borderColor = isActive ? AppColors.accent.withOpacity(0.3) : const Color(0xFF1E2128);
    if (isCompleted) {
      borderColor = const Color(0xFF0F2D24);
    }

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: (isActive || isCompleted) ? AppColors.accent.withOpacity(0.05) : AppColors.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor),
        ),
        child: Column(
          children: [
            isCompleted
                ? const Icon(Icons.check, color: AppColors.accent, size: 16)
                : Text(
                    number,
                    style: TextStyle(
                      color: isActive ? AppColors.accent : AppColors.textTertiary,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
            const SizedBox(height: 4),
            Text(
              text,
              style: TextStyle(
                color: (isActive || isCompleted) ? AppColors.accent : AppColors.textTertiary,
                fontSize: 10,
                letterSpacing: 1,
                fontWeight: (isActive || isCompleted) ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep2(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.surfaceLight,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.password, color: AppColors.accent, size: 28),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Ingresa el código',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 8),
        RichText(
          text: const TextSpan(
            style: TextStyle(fontSize: 13, color: AppColors.textTertiary, height: 1.5),
            children: [
              TextSpan(text: 'Ingresa el código de seguridad de 6 dígitos enviado a '),
              TextSpan(text: 'w***@ugb.edu.sv', style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold)),
            ],
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
              MaterialPageRoute(builder: (context) => const Paso3RecuperarNuevaClave()),
            );
          },
          child: const Text('Verificar código →', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 16),
        
        Center(
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('← Volver', style: TextStyle(color: AppColors.textSecondary, fontSize: 13)),
          ),
        ),
        const SizedBox(height: 32),
        _buildFooterTag(),
      ],
    );
  }

  Widget _buildOtpBox(int index) {
    return Container(
      width: 50,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
      child: const Center(
        child: Text(
          '-',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.textTertiary,
          ),
        ),
      ),
    );
  }

  Widget _buildFooterTag() {
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
              'Acceso seguro • Universidad Gerardo Barrios • IronLink',
              style: TextStyle(color: AppColors.textTertiary.withOpacity(0.5), fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
