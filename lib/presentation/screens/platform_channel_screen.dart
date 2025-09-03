import 'dart:io';

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
  final bool isAndroidOrIos = Platform.isAndroid || Platform.isIOS;

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
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!isAndroidOrIos)
              Text(
                "Função disponivel apenas para dispositivos Android ou IOS",
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: Colors.red[700]),
              ),
            if (isAndroidOrIos)
              Text(
                _version,
                style: GoogleFonts.dmSans(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 64,
                  fontWeight: FontWeight.w700,
                ),
              ),
            if (isAndroidOrIos)
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
