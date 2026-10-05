import 'package:flutter/material.dart';

import '../../app_theme.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _subjectController = TextEditingController();

  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Thank you! Your message has been submitted.'),
      ),
    );

    _nameController.clear();
    _emailController.clear();
    _subjectController.clear();
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              const Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.darkNavy,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Have a question? We would love to hear from you.',
                style: TextStyle(fontSize: 15, color: Color(0xFF737D8C)),
              ),

              const SizedBox(height: 30),

              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth < 750) {
                    return Column(
                      children: [
                        _contactInformation(),
                        const SizedBox(height: 20),
                        _contactForm(),
                      ],
                    );
                  }

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 4, child: _contactInformation()),
                      const SizedBox(width: 20),
                      Expanded(flex: 6, child: _contactForm()),
                    ],
                  );
                },
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }


  Widget _contactInformation() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: AppTheme.darkNavy,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.support_agent_rounded, color: Colors.white, size: 38),

          SizedBox(height: 18),

          Text(
            'Get in touch',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),

          SizedBox(height: 8),

          Text(
            'Our team is available to help you with questions about GT-InStock.',
            style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.5),
          ),

          SizedBox(height: 28),

          _ContactItem(
            icon: Icons.email_outlined,
            title: 'Email',
            value: 'support@onecloud.com',
          ),

          SizedBox(height: 20),

          _ContactItem(
            icon: Icons.phone_outlined,
            title: 'Phone',
            value: '+91 90000 12345',
          ),

          SizedBox(height: 20),

          _ContactItem(
            icon: Icons.location_on_outlined,
            title: 'Office',
            value: 'Hyderabad, Telangana, India',
          ),
        ],
      ),
    );
  }


  Widget _contactForm() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE7EBF0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Send us a message',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w700,
                color: AppTheme.darkNavy,
              ),
            ),

            const SizedBox(height: 20),

            TextFormField(
              controller: _nameController,
              decoration: _inputDecoration('Name', Icons.person_outline),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your name';
                }

                return null;
              },
            ),

            const SizedBox(height: 15),

            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: _inputDecoration('Email', Icons.email_outlined),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your email';
                }

                if (!value.contains('@')) {
                  return 'Please enter a valid email';
                }

                return null;
              },
            ),

            const SizedBox(height: 15),

            TextFormField(
              controller: _subjectController,
              decoration: _inputDecoration('Subject', Icons.subject_outlined),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a subject';
                }

                return null;
              },
            ),

            const SizedBox(height: 15),

            TextFormField(
              controller: _messageController,
              maxLines: 5,
              decoration: _inputDecoration('Message', Icons.message_outlined),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your message';
                }

                return null;
              },
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: _sendMessage,
                icon: const Icon(Icons.send_outlined),
                label: const Text(
                  'Send Message',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryBlue,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Color(0xFFDDE2E8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppTheme.primaryBlue, width: 1.5),
      ),
    );
  }
}


class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _ContactItem({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.white70, size: 21),

        const SizedBox(width: 13),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white60, fontSize: 11),
              ),

              const SizedBox(height: 3),

              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
