# Health Tracker

A comprehensive Flutter application for tracking your daily health metrics including sleep, exercise, and water intake. Built with Firebase for real-time data synchronization and persistent storage.

## Features

### 🏠 Home Dashboard
- **Today's Summary**: View your daily health metrics at a glance
- **Quick Actions**: Easy access to add sleep, exercise, and water data
- **Recent Activity**: See your latest health entries

### 😴 Sleep Tracking
- Track hours and minutes of sleep
- Add optional notes for sleep quality
- View sleep history with detailed entries
- Delete or modify previous sleep records

### 💪 Exercise Tracking
- Log different types of exercise (Running, Walking, Cycling, Swimming, Yoga, Gym, etc.)
- Track duration in minutes
- Optional calorie tracking
- Add notes for workout details
- Complete exercise history management

### 💧 Water Intake Tracking
- Quick add buttons for common amounts (250ml, 500ml, 750ml, 1000ml)
- Custom water amount entry
- Daily water intake summary
- Track water consumption history

### 🔥 Firebase Integration
- Real-time data synchronization
- Anonymous user authentication
- Persistent data storage
- Cross-device data access

## Screenshots

The app features a clean, modern interface with:
- Green-themed Material Design 3 UI
- Intuitive navigation
- Responsive layout for different screen sizes
- Beautiful data visualization

## Getting Started

### Prerequisites
- Flutter SDK (3.29.2 or higher)
- Android Studio / VS Code
- Android SDK with NDK 26.3.11579264 or higher
- Firebase project setup

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd health_tracker_new
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Firebase Setup**
   - Create a new Firebase project
   - Enable Authentication (Anonymous)
   - Enable Firestore Database
   - Download `firebase_options.dart` and place it in the `lib/` directory

4. **Run the app**
   ```bash
   flutter run
   ```

### Firebase Configuration

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project
3. Enable Authentication with Anonymous sign-in
4. Create a Firestore database
5. Download the `firebase_options.dart` file
6. Place it in the `lib/` directory

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── firebase_options.dart     # Firebase configuration
├── models/
│   └── health_data.dart     # Data models
├── screens/
│   ├── home_screen.dart     # Main dashboard
│   ├── sleep_screen.dart    # Sleep tracking
│   ├── exercise_screen.dart # Exercise tracking
│   └── water_screen.dart    # Water tracking
└── services/
    └── firebase_service.dart # Firebase operations
```

## Dependencies

- **flutter**: Core Flutter framework
- **firebase_core**: Firebase initialization
- **firebase_auth**: User authentication
- **cloud_firestore**: Database operations
- **provider**: State management
- **intl**: Date formatting

## Usage

### Adding Sleep Data
1. Tap "Add Sleep" on the home screen
2. Select the date
3. Enter hours and minutes
4. Add optional notes
5. Tap "Save Sleep Data"

### Adding Exercise Data
1. Tap "Add Exercise" on the home screen
2. Select the date
3. Choose exercise type from dropdown
4. Enter duration in minutes
5. Add optional calories and notes
6. Tap "Save Exercise Data"

### Adding Water Intake
1. Use quick add buttons for common amounts
2. Or tap "Custom Amount" for specific amounts
3. Select date and enter amount
4. Tap "Add Water"

## Development

### Running in Debug Mode
```bash
flutter run
```

### Running in Release Mode (Faster)
```bash
flutter run --release
```

### Hot Reload
Once the app is running, press `r` in the terminal for hot reload.

### Building for Production
```bash
flutter build apk --release
```

## Troubleshooting

### NDK Version Issues
If you encounter NDK version conflicts:
1. Update to NDK 27.0.12077973 in `android/app/build.gradle.kts`
2. Or use the current NDK 26.3.11579264 (backward compatible)

### Firebase Connection Issues
1. Ensure `firebase_options.dart` is properly configured
2. Check Firebase project settings
3. Verify internet connection

### Build Performance
- Use `flutter run --release` for faster builds
- Clean build cache with `flutter clean` if needed
- Ensure sufficient disk space for build artifacts

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support and questions:
- Create an issue in the repository
- Check the Firebase documentation
- Review Flutter documentation

---

**Health Tracker** - Your personal health companion built with Flutter and Firebase.
