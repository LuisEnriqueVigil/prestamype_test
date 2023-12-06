import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_prestapyme/src/domain/controllers/quoter_controller.dart';
import 'package:test_prestapyme/src/ui/common/style/colors.dart';
import 'package:test_prestapyme/src/ui/dollarQuoter/widgets/head_quoter_change.dart';
import 'package:test_prestapyme/src/ui/dollarQuoter/widgets/quoter_change.dart';

class DollarQuoterPage extends StatelessWidget {
  final Size size; 

  const DollarQuoterPage({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    final QuoterController quoterController = Provider.of<QuoterController>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              SizedBox(
                height: size.height*0.10,
              ),
              const HeadQuoterChange(),
              const SizedBox(height: 20.0),
              QuoterChange(size: size, quoterController: quoterController)
            ],
          ),
        ),
      ),
    );
  }
}
