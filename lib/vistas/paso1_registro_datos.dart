import 'package:flutter/material.dart';
import '../theme.dart';
import 'paso2_registro_verificar.dart';

class Paso1RegistroDatos extends StatefulWidget {
  const Paso1RegistroDatos({super.key});

  @override
  State<Paso1RegistroDatos> createState() => _Paso1RegistroDatosState();
}

class _Paso1RegistroDatosState extends State<Paso1RegistroDatos> {
  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  bool _acceptedTerms = false;

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
                    child: _buildStep1(),
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
        _buildStepIndicator(0, 'DATOS', true, true),
        _buildStepLine(false),
        _buildStepIndicator(1, 'VERIFICAR', false, false),
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

  Widget _buildStep1() {
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
        const Text(
          'Crear cuenta',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 8),
        const Text(
          'Registro institucional • Universidad Gerardo Barrios',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13, color: AppColors.textTertiary),
        ),
        const SizedBox(height: 32),

        Row(
          children: [
            Expanded(child: _buildTextField('NOMBRES', 'Walter', Icons.person_outline)),
            const SizedBox(width: 16),
            Expanded(child: _buildTextField('APELLIDOS', 'Ramírez', Icons.person_outline)),
          ],
        ),
        const SizedBox(height: 16),
        _buildTextField('CARNET INSTITUCIONAL', 'SMSS042024', Icons.credit_card, subtext: 'Ingresa tu carnet universitario UGB'),
        const SizedBox(height: 16),
        _buildTextField('CORREO INSTITUCIONAL', 'walter.ramirez@ugb.edu.sv', Icons.email_outlined),
        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: _buildPasswordField('CONTRASEÑA', _obscurePassword, () {
                setState(() => _obscurePassword = !_obscurePassword);
              }),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildPasswordField('CONFIRMAR CONTRASEÑA', _obscureConfirm, () {
                setState(() => _obscureConfirm = !_obscureConfirm);
              }),
            ),
          ],
        ),
        const SizedBox(height: 32),

        Row(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                value: _acceptedTerms,
                onChanged: (val) => setState(() => _acceptedTerms = val ?? false),
                activeColor: AppColors.accent,
                checkColor: Colors.black,
                side: const BorderSide(color: AppColors.textTertiary),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(color: AppColors.textTertiary, fontSize: 11),
                  children: [
                    TextSpan(text: 'Acepto los '),
                    TextSpan(text: 'Términos de uso', style: TextStyle(color: AppColors.accent)),
                    TextSpan(text: ' y la '),
                    TextSpan(text: 'Política de privacidad', style: TextStyle(color: AppColors.accent)),
                    TextSpan(text: ' de IronLink • Universidad Gerardo Barrios'),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),

        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Paso2RegistroVerificar()),
            );
          },
          child: const Text('Crear cuenta →', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('¿Ya tienes cuenta? ', style: TextStyle(color: AppColors.textTertiary, fontSize: 13)),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Text('Inicia sesión aquí', style: TextStyle(color: AppColors.accent, fontSize: 13)),
            ),
          ],
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
          style: const TextStyle(color: Colors.white, fontSize: 14),
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

  Widget _buildPasswordField(String label, bool obscure, VoidCallback toggleObscure) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textTertiary, letterSpacing: 1),
        ),
        const SizedBox(height: 8),
        TextField(
          style: const TextStyle(color: Colors.white, fontSize: 14),
          obscureText: obscure,
          decoration: InputDecoration(
            hintText: '••••••••',
            hintStyle: const TextStyle(color: AppColors.textTertiary),
            prefixIcon: const Icon(Icons.key, color: AppColors.textTertiary, size: 20),
            suffixIcon: IconButton(
              icon: Icon(
                obscure ? Icons.visibility_off : Icons.visibility,
                color: AppColors.textTertiary,
                size: 20,
              ),
              onPressed: toggleObscure,
            ),
          ),
        ),
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
