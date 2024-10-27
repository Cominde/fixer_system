import 'package:flutter/material.dart';
import 'package:flutterflow_ui_pro/flutterflow_ui_pro.dart';

class YearPickerFormField extends StatefulWidget {
  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onChanged;

  const YearPickerFormField({super.key, 
    required this.firstDate,
    required this.lastDate,
    required this.selectedDate,
    required this.onChanged,
  });

  @override
  _YearPickerFormFieldState createState() => _YearPickerFormFieldState();
}

class _YearPickerFormFieldState extends State<YearPickerFormField> {
  final TextEditingController _controller = TextEditingController();
  bool _isExpanded = false; // To control dropdown visibility
  late int selectedYear;

  @override
  void initState() {
    super.initState();
    selectedYear = widget.selectedDate.year;
    _controller.text = selectedYear.toString();
  }

  // Function to toggle the dropdown
  void _toggleDropdown() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  // Function to handle year selection
  void _selectYear(int year) {
    setState(() {
      selectedYear = year;
      _controller.text = year.toString();
      _isExpanded = false; // Close dropdown after selecting
    });
    widget.onChanged(DateTime(year));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: _toggleDropdown,
          child: AbsorbPointer(
            child: TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Model',
                suffixIcon: Icon(_isExpanded
                    ? Icons.arrow_drop_up
                    : Icons.arrow_drop_down),
                labelStyle: FlutterFlowTheme
                    .of(context)
                    .bodySmall
                    .override(
                  fontFamily: 'Outfit',
                  color: const Color(0xFFF68B1E),
                ),
                hintStyle:
                FlutterFlowTheme
                    .of(context)
                    .bodySmall,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme
                        .of(context)
                        .alternate,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xFFF68B1E),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                /*filled: true,*/
                /*fillColor: Colors.white,*/
                contentPadding:
                const EdgeInsetsDirectional.fromSTEB(
                    16, 24, 0, 24),
              ),
            ),
          ),
        ),
        if (_isExpanded)
          Container(
            height: 120, // Adjust height for the scrollable dropdown
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: ListView.builder(
              itemCount: widget.lastDate.year - widget.firstDate.year + 1,
              itemBuilder: (context, index) {
                int year = widget.firstDate.year + index;
                return ListTile(
                  title: Text(year.toString(),
                      style: TextStyle(
                          color: selectedYear == year
                              ? Colors.blue
                              : Colors.black)),
                  onTap: () => _selectYear(year),
                );
              },
            ),
          ),
      ],
    );
  }
}