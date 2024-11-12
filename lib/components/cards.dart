import 'package:flutter/material.dart';


Widget myCard() {
  return  Padding(
    padding: const EdgeInsets.all(16.0),
    child: Center(
      child: Container(
        width: 350, // Set the desired width
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Placeholder Image
                Container(
                  width: 100,
                  height: 75,
                  color: Colors.grey[300], // Placeholder color
                  child: Icon(Icons.video_library, size: 40, color: Colors.grey),
                ),
                SizedBox(width: 16), // Space between image and text
                // Column for title and author
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Video Title',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4), // Space between title and subtitle
                      Text(
                        'Author:',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Author Name',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          // Linear Progress Indicator for video watched percentage
                          Container(
                            width: 100, // Set a fixed width for the progress indicator
                            child: LinearProgressIndicator(
                              value: 0.5, // Example value (50%)
                              backgroundColor: Colors.grey[300],
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  ) ;
}


Widget myCard2(){
  return  Padding(
    padding: const EdgeInsets.all(16.0),
    child: Center(
      child: Container(
        width: 300, // Set the desired width
        height: 300, // Fixed height
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Placeholder Image
                Container(
                  height: 120,
                  width: 270,
                  color: Colors.grey[300], // Placeholder color
                  child: Icon(Icons.video_library, size: 60, color: Colors.grey),
                ),
                SizedBox(height: 12), // Space between image and title
                Text(
                  'Video Title',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8), // Space between title and author name
                Text(
                  'Author Name',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8), // Space between author name and rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Star Rating
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < 4 ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: 20,
                        );
                      }),
                    ),
                    // Prize Label

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}