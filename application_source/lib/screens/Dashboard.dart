import 'package:flutter/material.dart';
import 'package:mp_security_systems/screens/Dashboards/SecurityDashboard.dart';
import 'package:mp_security_systems/screens/Dashboards/ResidentDashboard.dart';

// import 'Dashboards/ResidentDashboard.dart';

class Dashboard extends StatelessWidget {
  final bool isResident;
  final String flatNo;
  Dashboard(this.isResident, this.flatNo);

  @override
  Widget build(BuildContext context) {
    return (isResident == true
        ? ResidentDashboard(flatNo)
        : SecurityDashboard());
  }
}
