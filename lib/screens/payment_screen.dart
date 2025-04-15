import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  final String name;
  final String address;
  final double totalPrice;

  PaymentScreen({
    required this.name,
    required this.address,
    required this.totalPrice,
  });

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _savePaymentDetails = false;
  String _selectedPaymentMethod = 'Credit Card';

  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _nameOnCardController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();

  final TextEditingController _addressLine1Controller = TextEditingController();
  final TextEditingController _addressLine2Controller = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text(
          'Payment Screen',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Payment Information',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                // Payment Method Dropdown
                DropdownButtonFormField<String>(
                  value: _selectedPaymentMethod,
                  decoration: _inputDecoration('Payment Method'),
                  items:
                      ['Credit Card', 'PayPal', 'Cash on Delivery']
                          .map(
                            (method) => DropdownMenuItem(
                              value: method,
                              child: Text(method),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedPaymentMethod = value!;
                    });
                  },
                ),
                const SizedBox(height: 10),

                // Card Details (Only for Credit Card)
                if (_selectedPaymentMethod == 'Credit Card') ...[
                  _buildTextField(_cardNumberController, 'Card Number'),
                  Row(
                    children: [
                      Expanded(
                        child: _buildTextField(_expiryController, 'MM / YY'),
                      ),
                      const SizedBox(width: 10),
                      Expanded(child: _buildTextField(_cvvController, 'CVV')),
                    ],
                  ),
                  _buildTextField(_nameOnCardController, 'Name on Card'),
                  _buildTextField(_postalCodeController, 'ZIP/Postal Code'),
                  const SizedBox(height: 20),
                ],

                // Billing Information Section
                const Text(
                  'Billing Information',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                _buildTextField(_addressLine1Controller, 'Address Line 1'),
                _buildTextField(
                  _addressLine2Controller,
                  'Address Line 2',
                  required: false,
                ),
                Row(
                  children: [
                    Expanded(child: _buildTextField(_cityController, 'City')),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildTextField(_zipController, 'ZIP/Postal Code'),
                    ),
                  ],
                ),
                _buildTextField(_emailController, 'Email'),
                _buildTextField(_phoneController, 'Phone'),

                // Save Payment Details Checkbox
                CheckboxListTile(
                  value: _savePaymentDetails,
                  title: const Text('Save payment details for future use'),
                  onChanged: (value) {
                    setState(() {
                      _savePaymentDetails = value!;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),

                const SizedBox(height: 20),

                // Terms & Conditions
                RichText(
                  text: const TextSpan(
                    text: 'By clicking the button below, you agree to our ',
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'privacy policy',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: ' and '),
                      TextSpan(
                        text: 'terms and conditions',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Place Order Button
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade900,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 30,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Order placed successfully!'),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Place Order',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Common Text Field Builder
  Widget _buildTextField(
    TextEditingController controller,
    String label, {
    bool required = true,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: _inputDecoration(label),
        validator: (value) {
          if (required && (value == null || value.isEmpty)) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  // Common Input Decoration
  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      filled: true,
      fillColor: Colors.grey.shade200,
    );
  }
}
