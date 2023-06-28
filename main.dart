import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}
// log in page
class MyApp extends StatelessWidget {
  //final GlobalKey<NavigatorState> loginNavigatorKey = GlobalKey<NavigatorState>();
  //final GlobalKey<NavigatorState> dashboardNavigatorKey = GlobalKey<NavigatorState>();
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyApp',
      home: Scaffold(
        backgroundColor: Colors.white30,

        body: LoginDemo(),
      ),
    );
  }
}

class LoginDemo extends StatefulWidget {
  const LoginDemo({Key? key}) : super(key: key);

  @override
  State<LoginDemo> createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                  width: 200,
                  height: 150,
                  child: Image.asset('Bus_Trackking_App.jpg'),
                ),
              ),
            ),
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: email,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter valid email id as abc@gmail.com',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                top: 15,
                bottom: 0,
              ),
              child: TextField(
                controller: password,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter secure password',
                ),
              ),
            ),
            const SizedBox(height: 35),
            TextButton(
              onPressed: () {
                // TODO: Forgot Password SCREEN GOES HERE
              },
              child: const Text(
                'Forgot Password',
                style: TextStyle(color: Colors.redAccent, fontSize: 15),
              ),
            ),
            const SizedBox(height: 35),
            Container(
              height: 50,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()),);
                },
                style: ElevatedButton.styleFrom(primary: Colors.black),
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // TODO: Create Account SCREEN GOES HERE
              },
              child: const Text(
                'New User? Create Account',
                style: TextStyle(color: Colors.redAccent, fontSize: 15),
              ),
            ),

          ],
        ),
      ),
    );
  }
}


class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Tracking System'),
        actions: [
          IconButton(
            icon: Icon(Icons.feedback),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedbackPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.question_answer),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go Track'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LocationScreen()),
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Handle home menu item tap
              },
            ),
            ListTile(
              leading: Icon(Icons.menu),
              title: Text('Menu'),
              onTap: () {
                // Handle menu menu item tap
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Favorite'),
              onTap: () {
                // Handle favorite menu item tap
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentProfile(
                      name: 'Airaa Syahira',
                      matricnumber: 's21b0041',
                      course: 'Bachelor of Information Technology',
                      email: 's21b0041@siswa.umk.edu.my',
                      phone: '018-2962044',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: null, // Remove the bottom navigation bar from the scaffold
    );
  }
}



































//location
class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Position? _currentPosition;
  StreamSubscription<Position>? _positionStreamSubscription;
  TextEditingController _locationController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _boardingPointsController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _seatController = TextEditingController();
  TextEditingController _dropOffPlaceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initLocationTracking();
  }

  @override
  void dispose() {
    _positionStreamSubscription?.cancel();
    super.dispose();
  }

  void _initLocationTracking() async {
    try {
      _positionStreamSubscription = Geolocator.getPositionStream().listen(
            (Position position) {
          setState(() {
            _currentPosition = position;
          });
        },
        onError: (error) {
          print('Error: $error');
        },
      );
    } catch (e) {
      print('Error: $e');
    }
  }

  void _submitInformation() {
    // Get the values from the text fields
    String location = _locationController.text;
    String time = _timeController.text;
    String boardingPoints = _boardingPointsController.text;
    String date = _dateController.text;
    String seat = _seatController.text;
    String dropOffPlace = _dropOffPlaceController.text;

    // Display the submitted information in an AlertDialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Submitted Information'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Latitude: ${_currentPosition!.latitude}'),
            Text('Longitude: ${_currentPosition!.longitude}'),
            SizedBox(height: 16),

            Text('Time: $time'),
            Text('Boarding Points: $boardingPoints'),
            Text('Date: $date'),
            Text('Seat: $seat'),
            Text('Drop-off Place: $dropOffPlace'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
            child: Text('Close'),
          ),
        ],
      ),
    );
  }




  //information student enter
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
      ),
      body: Center(
        child: _currentPosition != null
            ? ListView(
          padding: EdgeInsets.all(16),
          children: [
            Text(
              'Latitude: ${_currentPosition!.latitude}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Longitude: ${_currentPosition!.longitude}',
              style: TextStyle(fontSize: 20),
            ),

            SizedBox(height: 16),
            TextField(
              controller: _timeController,
              decoration: InputDecoration(
                labelText: 'Enter Time',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _boardingPointsController,
              decoration: InputDecoration(
                labelText: 'Enter Boarding Points',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                labelText: 'Enter Date',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _seatController,
              decoration: InputDecoration(
                labelText: 'Enter Seat',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _dropOffPlaceController,
              decoration: InputDecoration(
                labelText: 'Enter Drop-off Place',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitInformation,
              child: Text('Submit'),
            ),
          ],
        )
            : CircularProgressIndicator(),
      ),
    );
  }
}


//profile
class StudentProfile extends StatelessWidget {
  final String name;
  final String matricnumber;
  final String course;
  final String email;
  final String phone;

  StudentProfile({
    required this.name,
    required this.matricnumber,
    required this.course,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('image_airaa.jpg'),
            ),
            SizedBox(height: 16.0),
            Text(
              name,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Matric Number: $matricnumber',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Email: $email',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Phone: $phone',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the Home page (Dashboard)
                Navigator.pop(context);
              },
              child: Text('Back to Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}



class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  String feedback = '';
  List<FeedbackModel> feedbackList = [
    FeedbackModel(
      id: 1,
      message: 'Great app!',
      rating: 5,
      timestamp: DateTime(2023, 6, 25).toString(),
    ),
    FeedbackModel(
      id: 2,
      message: 'Needs improvement.',
      rating: 3,
      timestamp: DateTime(2023, 6, 24).toString(),
    ),
  ];

  void submitFeedback() {
    // Implement the logic to submit the feedback to your backend or store it locally
    // You can also perform any validation or processing of the feedback data here
    print('Feedback submitted: $feedback');
    // Add the new feedback to the feedback list
    feedbackList.add(FeedbackModel(
      id: feedbackList.length + 1,
      message: feedback,
      rating: 0, // Set the rating value as per your implementation
      timestamp: DateTime.now().toString(),
    ));
    setState(() {
      // Trigger a rebuild of the UI to show the updated feedback list
      feedback = '';
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          content: Text('Your information has been submitted. Thank you for your feedback!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Please provide your feedback on the bus service:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            TextField(
              maxLines: 4,
              onChanged: (value) {
                setState(() {
                  feedback = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Feedback',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: submitFeedback,
              child: Text('Submit Feedback'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Previous Feedback:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: feedbackList.length,
                itemBuilder: (context, index) {
                  final feedback = feedbackList[index];
                  return ListTile(
                    title: Text(feedback.message),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Rating: ${feedback.rating}'),
                        Text('Timestamp: ${feedback.timestamp}'),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeedbackModel {
  final int id;
  final String message;
  final int rating;
  final String timestamp;

  FeedbackModel({
    required this.id,
    required this.message,
    required this.rating,
    required this.timestamp,
  });
}
