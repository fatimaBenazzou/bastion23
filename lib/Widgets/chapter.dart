import 'package:flutter/material.dart';

class Chapter extends StatelessWidget {
  const Chapter({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    // Column(
      // children: [
        // first part
        Card(
          margin: const EdgeInsets.all(16),
          child: Expanded(
            child: Column(
              children: [
                // Partie Photo
                Container(
                  height:
                      150, // Ajustez la hauteur de la partie photo selon vos besoins
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/bab.png'), // Remplacez le chemin par votre image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Partie Titre + Barre de progression
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Titre de la Card',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      LinearProgressIndicator(
                        value:
                            0.5, // Ajustez la valeur de la barre de progression selon vos besoins
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        // ),
        //second
        // const Text('Why Named Bastion 23?'),
        // const Text('Palais 18'),
      // ],
    );
  }
}
