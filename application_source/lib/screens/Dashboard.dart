import 'package:flutter/material.dart';
import 'package:mp_security_systems/screens/Dashboards/SecurityDashboard.dart';

import 'Dashboards/ResidentDashboard.dart';

class Dashboard extends StatelessWidget {
  final bool isResident;
  Dashboard(this.isResident);

  @override
  Widget build(BuildContext context) {
    return (isResident == true ? ResidentDashboard() : SecurityDashboard());
  }
}
