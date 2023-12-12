import 'package:bastion23/Screens/library_detail.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            // Text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello ,',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  'Abdelghafour',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            // Small Image
            Padding(
              padding:
                  const EdgeInsets.only(left: 8.0), // Adjust spacing as needed
              child: Image.asset(
                'assets/icons/goodbye.png', // Replace with the path to your small image
              ),
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            // Add any action when the image is tapped
          },
          icon: Stack(
            children: [
              // Background Image
              Positioned.fill(
                child: Image.asset(
                  'assets/images/back_profil.png', // Replace with your background image
                  //fit: BoxFit.cover,
                ),
              ),
              // CircleAvatar (Foreground Image)
              Container(
                width: 70,
                height: 70,
                child: CircleAvatar(
                  // backgroundImage: AssetImage('assets/images/bab.png'), // Replace with your foreground image
                  radius: 70,
                ),
              ),
            ],
          ),
        ),

        /*leading: IconButton(
          icon: Container(
            width: 70, // Adjust the width as needed
            height: 70, // Adjust the height as needed
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/bab.png'), // Replace with your image
              radius: 70, // Adjust the radius as needed
            ),
          ),
          onPressed: () {
            // Add any action when the image is tapped
          },
        ),*/

        actions: [
          // Small Icon with Image
          IconButton(
            icon: Icon(
              //AssetImage('assets/your_icon_image.png'), // Replace with the path to your icon image
              Icons.notifications,
            ),
            onPressed: () {
              // Add any action when the icon is tapped
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Wrap the content with SingleChildScrollView
        child: Container(
          margin: EdgeInsets.only(left: 15.0),
          //color: Colors.blue,
          // Your main content goes here
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 20),

              // First line with an image
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Text(
                      "MY LIBRARY",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Image.asset(
                      'assets/icons/icon_arrow.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 130.0),
                    child: Image.asset(
                      'assets/icons/Progress_Bar.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Second line with  images
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Horizontal scrolling row with four images
                    GestureDetector(
                      onTap: () {
                        // Handle navigation to another page when the first image is tapped
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LibraryDetailScreen()));
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/Story_card1.png',
                            fit: BoxFit.cover,
                          ),
                          Container(
                              margin: EdgeInsets.only(right: 70.0),
                              child: Text(
                                "Why Bastion23 ?",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall, // Add text under the first image
                              )),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Handle navigation to another page when the second image is tapped
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LibraryDetailScreen()));
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/Story_card2.png',
                            fit: BoxFit.cover,
                          ),
                          Container(
                              margin: EdgeInsets.only(right: 90.0),
                              child: Text(
                                "HISTORY ",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall, // Add text under the first image
                              )), // Add text under the second image
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Handle navigation to another page when the third image is tapped
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LibraryDetailScreen()));
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/Story_card1.png',
                            fit: BoxFit.cover,
                          ),
                          Text("Image 3"), // Add text under the third image
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Handle navigation to another page when the fourth image is tapped
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LibraryDetailScreen()));
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/Story_card1.png',
                            fit: BoxFit.cover,
                          ),
                          Text("Image 4"), // Add text under the fourth image
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        "REWARDS",
                        style: Theme.of(context).textTheme.headlineMedium,
                      )
                    ],
                  ),

                  // Image 1
                  Row(children: [
                    Image.asset(
                      'assets/images/Investor1.png',
                      fit: BoxFit.cover,
                    ),
                  ]),
                  SizedBox(height: 10), // Add spacing between images

                  // Image 2
                  Image.asset(
                    'assets/images/Investor2.png',
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 10), // Add spacing between images

                  // Image 3
                  Image.asset(
                    'assets/images/Investor3.png',
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 10), // Add spacing between images

                  // Image 4
                  Image.asset(
                    'assets/images/Investor4.png',
                    fit: BoxFit.cover,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        // Add any bottom appbar customization you need
        child: Container(
          height: 60, // Adjust the height as needed
          child: Center(
            child: Image.asset(
              'assets/images/Rectangle_bottom.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
//   Widget build(BuildContext context) {
//     return
//      Column(
//       children: [
//         // Library
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             InkWell(
//               onTap: () {},
//               child: Row(
//                 children: [
//                   Text("My Library"),
//                   Icon(Icons.arrow_forward_ios_rounded),
//                 ],
//               ),
//             ),
//             // hadek te3 pourcentage
//           ],
//         ),
// // chapters
//         Chapters()

//         //Rewards

//         // Music
//       ],
//     );
//   }
// }
