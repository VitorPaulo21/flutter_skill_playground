import 'package:app/data/services/platform_service.dart';
import 'package:app/locator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlatformChannelsScreen extends StatefulWidget {
  const PlatformChannelsScreen({super.key});

  @override
  State<PlatformChannelsScreen> createState() => _PlatformChannelsScreenState();
}

class _PlatformChannelsScreenState extends State<PlatformChannelsScreen> {
  String _version = 'Unknown';

  @override
  void initState() {
    super.initState();
    _getVersion();
  }

  Future<void> _getVersion() async {
    final service = sl<PlatformService>();
    final version = await service.getPlatformVersion();
    setState(() => _version = version);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Platform Channels Screen')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _version,
              style: GoogleFonts.dmSans(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 64,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "Operational System",
              style: GoogleFonts.roboto(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
