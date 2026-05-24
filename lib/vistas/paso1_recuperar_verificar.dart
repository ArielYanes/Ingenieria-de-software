import 'package:flutter/material.dart';
import '../theme.dart';
import 'paso2_recuperar_codigo.dart';

class Paso1RecuperarVerificar extends StatelessWidget {
  const Paso1RecuperarVerificar({super.key});

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
                      child: const Icon(Icons.link, color: Colors.white, size: 20),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'IronLink',
                      style: TextStyle(color: AppColors.textPrimary, fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: -0.5),
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
                    side: const BorderSide(color: Color(0x332A9D8F)),
                  ),
                  child: Container(
                    width: 450,
                    padding: const EdgeInsets.all(40),
                    child: _buildStep1(context),
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
          _buildSegment(0, '1', 'VERIFICAR', true, false),
          const SizedBox(width: 8),
          _buildSegment(1, '2', 'CÓDIGO', false, false),
          const SizedBox(width: 8),
          _buildSegment(2, '3', 'NUEVA CLAVE', false, false),
        ],
      ),
    );
  }

  Widget _buildSegment(int stepIndex, String number, String text, bool isActive, bool isCompleted) {
    Color borderColor = isActive ? AppColors.accent.withOpacity(0.3) : const Color(0x332A9D8F);
    if (isCompleted) {
      borderColor = const Color(0x332A9D8F);
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

  Widget _buildStep1(BuildContext context) {
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
            child: const Icon(Icons.lock, color: Colors.amber, size: 28),
          ),
        ),
        const SizedBox(height: 24),
        
        const Text(
          'Recuperar contraseña',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
        ),
        const SizedBox(height: 8),
        const Text(
          'Ingresa tu carnet y correo institucional para iniciar el proceso de recuperación.',
          style: TextStyle(fontSize: 13, color: AppColors.textTertiary, height: 1.5),
        ),
        const SizedBox(height: 32),

        _buildTextField('CARNET INSTITUCIONAL', 'UGB-2022-0341', Icons.credit_card, subtext: 'Ingresa tu carnet universitario UGB'),
        const SizedBox(height: 16),
        _buildTextField('CORREO INSTITUCIONAL', 'walter.ramirez@ugb.edu.sv', Icons.email_outlined, subtext: 'Enviaremos un código de verificación a este correo'),
        const SizedBox(height: 32),

        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0x332A9D8F)),
          ),
          child: RichText(
            text: const TextSpan(
              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 12, height: 1.5),
              children: [
                TextSpan(text: 'El código de verificación será enviado al correo institucional registrado en '),
                TextSpan(text: '@ugb.edu.sv', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: '. Si no tienes acceso, contacta soporte técnico.'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 32),

        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Paso2RecuperarCodigo()),
            );
          },
          child: const Text('Enviar código de verificación →', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 16),

        Center(
          child: TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('← Volver al inicio de sesión', style: TextStyle(color: AppColors.accent, fontSize: 13)),
          ),
        ),
        const SizedBox(height: 32),
        
        _buildFooterTag(),
      ],
    );
  }

  Widget _buildTextField(String label, String hint, IconData icon, {String? subtext}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textTertiary, letterSpacing: 1),
        ),
        const SizedBox(height: 8),
        TextField(
          style: const TextStyle(color: AppColors.textPrimary, fontSize: 14),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: AppColors.textTertiary),
            prefixIcon: Icon(icon, color: AppColors.textTertiary, size: 20),
          ),
        ),
        if (subtext != null) ...[
          const SizedBox(height: 6),
          Text(subtext, style: const TextStyle(fontSize: 11, color: AppColors.textTertiary)),
        ]
      ],
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


