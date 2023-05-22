import 'package:aaptronix/view/dash_board_screen/widget/setting_pop_menu.dart';
import 'package:aaptronix/view/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardList extends StatelessWidget {
  const DashboardList(
      {super.key,
      required this.label,
      this.navigateTo,
      this.privacy = false,
      this.terms = false,
      this.refresh});
  final String label;
  final navigateTo;
  final privacy;
  final terms;
  final refresh;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 5),
      child: InkWell(
        child: Container(
          height: 65,
          decoration: BoxDecoration(
            color: cardClr,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              label,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        onTap: () async {
          if (privacy) {
            showDialog(
                context: context,
                builder: (builder) {
                  return settingmenupopup(mdFilename: 'privacy_policy.md');
                });
          } else if (terms) {
            showDialog(
                context: context,
                builder: (builder) {
                  return settingmenupopup(
                      mdFilename: 'terms_and_conditions.md');
                });
          } else {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => navigateTo,
              ),
            );
            if (result == 'refresh') {
              refresh();
            }
          }
        },
      ),
    );
  }
}