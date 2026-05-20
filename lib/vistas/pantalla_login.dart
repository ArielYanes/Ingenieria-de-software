import 'package:flutter/material.dart';
import 'pantalla_dashboard.dart';
import 'paso1_registro_datos.dart';
import 'paso1_recuperar_verificar.dart';
import '../theme.dart';

class PantallaLogin extends StatefulWidget {
  const PantallaLogin({super.key});

  @override
  State<PantallaLogin> createState() => _PantallaLoginState();
}

class _PantallaLoginState extends State<PantallaLogin> {
  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            // Desktop / Tablet Landscape
            return Row(
              children: [
                Expanded(flex: 5, child: _buildLeftPanel()),
                Expanded(flex: 4, child: _buildRightPanel()),
              ],
            );
          } else {
            // Mobile / Tablet Portrait
            return Stack(
              children: [
                _buildLeftPanel(opacity: 0.2), // Background
                Center(
                  child: SingleChildScrollView(
                    child: Card(
                      color: AppColors.background.withOpacity(0.9),
                      elevation: 8,
                      margin: const EdgeInsets.all(16),
                      child: _buildRightPanel(),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildLeftPanel({double opacity = 1.0}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0D1015),
        gradient: RadialGradient(
          center: const Alignment(-0.5, -0.5),
          radius: 1.5,
          colors: [
            const Color(0xFF00FA9A).withOpacity(0.05 * opacity),
            const Color(0xFF0D1015).withOpacity(opacity),
          ],
        ),
      ),
      padding: const EdgeInsets.all(64.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.link, color: Colors.black, size: 24),
              ),
              const SizedBox(width: 12),
              const Text(
                'IronLink',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 64),
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                height: 1.2,
                color: Colors.white,
              ),
              children: [
                TextSpan(text: 'Conecta con\ntu '),
                TextSpan(
                  text: 'aula virtual\n',
                  style: TextStyle(color: AppColors.accent),
                ),
                TextSpan(text: 'de forma segura.'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Plataforma educativa de la Universidad Gerardo Barrios.\nAcceso institucional con túnel VPN cifrado y clases en\ntiempo real.',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 48),
          _buildBullet('Túnel VPN AES-256', 'conexión encriptada siempre activa'),
          const SizedBox(height: 16),
          _buildBullet('Videoclases en vivo', 'con chat y participación en tiempo real'),
          const SizedBox(height: 16),
          _buildBullet('Acceso institucional', 'exclusivo para estudiantes UGB'),
        ],
      ),
    );
  }

  Widget _buildBullet(String title, String desc) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 6.0, right: 12.0),
          child: Icon(Icons.circle, color: AppColors.accent, size: 8),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 14, color: AppColors.textTertiary),
              children: [
                TextSpan(
                  text: '$title — ',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                TextSpan(text: desc),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRightPanel() {
    return Container(
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 32.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Iniciar sesión',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Accede con tus credenciales institucionales UGB',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textTertiary,
                ),
              ),
              const SizedBox(height: 48),

              // Carnet
              const Text(
                'CARNET INSTITUCIONAL',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textTertiary, letterSpacing: 1),
              ),
              const SizedBox(height: 8),
              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'SMSS042024',
                  hintStyle: TextStyle(color: AppColors.textTertiary),
                  prefixIcon: Icon(Icons.credit_card, color: AppColors.textTertiary, size: 20),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Ingresa tu carnet universitario UGB',
                style: TextStyle(fontSize: 12, color: AppColors.textTertiary),
              ),
              const SizedBox(height: 24),

              // Contraseña
              const Text(
                'CONTRASEÑA',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textTertiary, letterSpacing: 1),
              ),
              const SizedBox(height: 8),
              TextField(
                style: const TextStyle(color: Colors.white),
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  hintText: '••••••••',
                  hintStyle: const TextStyle(color: AppColors.textTertiary),
                  prefixIcon: const Icon(Icons.key, color: AppColors.textTertiary, size: 20),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.textTertiary,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Recuérdamelo
              Row(
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Checkbox(
                      value: _rememberMe,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value ?? false;
                        });
                      },
                      activeColor: AppColors.accent,
                      checkColor: Colors.black,
                      side: const BorderSide(color: AppColors.textTertiary),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Recuérdamelo',
                    style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Botones
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const PantallaDashboard()),
                  );
                },
                child: const Text('Ingresar al aula →', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Paso1RegistroDatos()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent, // Misma apariencia visual
                ),
                child: const Text('Regístrate', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 24),

              // Olvidaste contraseña
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('olvidaste tu contraseña? ', style: TextStyle(color: AppColors.textTertiary, fontSize: 13)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Paso1RecuperarVerificar()),
                      );
                    },
                    child: const Text('recupérala aquí', style: TextStyle(color: Colors.lightBlueAccent, fontSize: 13, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              
              const SizedBox(height: 48),

              // Footer tag
              Center(
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
                        'Autenticación exclusiva · Universidad Gerardo Barrios',
                        style: TextStyle(color: AppColors.textTertiary.withOpacity(0.5), fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
