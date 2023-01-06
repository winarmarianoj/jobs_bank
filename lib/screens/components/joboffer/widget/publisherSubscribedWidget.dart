import 'package:flutter/material.dart';
import 'package:jobs_bank/models/JobOffer.dart';
import 'package:jobs_bank/screens/publisher/subscribed.dart';
import 'package:jobs_bank/widgets/button/bounceButton.dart';

class PublisherSubscribedWidget extends StatelessWidget {
  const PublisherSubscribedWidget({
    Key? key,
    required this.jobOffer,
  }) : super(key: key);

  final JobOffer jobOffer;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BounceButton(
        buttonSize: ButtonSize.superSmall,
          type: ButtonType.subscriptos,
          label: 'Ver Subscriptos',
          iconRight: Icons.subscriptions,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Subscribed(                        
                  jobOffer: jobOffer,
                ),
              ),
            );
          },
      ),
    );
  }
}