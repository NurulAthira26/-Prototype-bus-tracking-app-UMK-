# Bus Tracking App Project UMK 

### Key Components of the Code

1. **Imports**:
   - `import 'package:flutter/material.dart';`: Imports Flutter's material design widgets.
   - `import 'package:geolocator/geolocator.dart';`: Imports the Geolocator package for obtaining the device's location.
   - `import 'dart:async';`: Imports Dart's async library for handling asynchronous programming.

2. **Main Function**:
   - `void main() { runApp(MyApp()); }`: The entry point of the application, which runs the `MyApp` widget.

3. **MyApp Class**:
   - Inherits from `StatelessWidget`, indicating it doesn't maintain any state.
   - Builds a `MaterialApp` with a `Scaffold` that contains the `LoginDemo` widget.

4. **LoginDemo Class**:
   - Inherits from `StatefulWidget`, indicating it maintains state (like user input).
   - Contains `TextEditingController` instances for email and password fields.
   - Builds the login UI, including text fields and buttons.

5. **Dashboard Class**:
   - Represents the main dashboard after a user logs in.
   - Contains buttons for navigating to other screens, such as a feedback page and a location screen.

6. **LocationScreen Class**:
   - Responsible for tracking and displaying the device's location.
   - Uses `Geolocator` to get the current position and allows user input for time, boarding points, and other trip-related information.

7. **StudentProfile Class**:
   - Displays the student's profile information.
   - Includes a `CircleAvatar` for the profile picture and text fields for user details.

8. **FeedbackPage Class**:
   - Allows users to submit feedback.
   - Maintains a list of feedback messages and displays them in a list format.

9. **FeedbackModel Class**:
   - A simple data model class that represents individual feedback entries, containing an ID, message, rating, and timestamp.

### Key Features
- **User Interface**: The application features a responsive UI with various widgets like `TextField`, `ElevatedButton`, and `ListView`.
- **State Management**: It utilizes Dart's state management features with `StatefulWidget` and `setState()`.
- **Location Services**: Integrates geolocation capabilities to track the user's location.
- **Navigation**: Uses `Navigator` for transitioning between different screens.
- **Feedback Handling**: Implements a simple feedback mechanism, allowing users to submit and view previous feedback.

### Summary
This code exemplifies the use of Dart and Flutter for building a mobile application with functionalities like user login, profile management, location tracking, and feedback submission. Flutter's rich set of widgets and Dart's asynchronous capabilities facilitate the development of complex and interactive UIs.


![login page bus tracking app](https://github.com/369HACK/bus-tracking-app/assets/93875055/07ffa7d6-ed0f-46ca-bc09-ca68f50cfdd4)
![dashboard bus tracking app](https://github.com/369HACK/bus-tracking-app/assets/93875055/4df25282-1167-4ae1-8e99-897e986026ab)
![profile bus tracking app](https://github.com/369HACK/bus-tracking-app/assets/93875055/7f458e0d-3ab2-4398-baa0-6b45771028b7)
![location bus tracking app](https://github.com/369HACK/bus-tracking-app/assets/93875055/8143e43a-2e00-4ff8-ae30-9bc1b597c1f0)
![button pop out information submitted](https://github.com/369HACK/bus-tracking-app/assets/93875055/cff0b944-35c8-4859-ad0b-f5a4d42fdefd)
![feedback bus tracking app](https://github.com/369HACK/bus-tracking-app/assets/93875055/2e9a93fa-7d25-4951-8fb3-69ae9f756754)
![button pop out thank you  feedback](https://github.com/369HACK/bus-tracking-app/assets/93875055/50d620b8-19e0-44dc-80a4-f8af07439771)
