# MY FLYN - Flutter Application

A Flutter application built based on the provided Figma design, implementing the GetX state management pattern.

## Project Structure

The project follows a clean architecture with separation of concerns:

```
my_flyn/
├── lib/
│   ├── app/
│   │   ├── controllers/       # Business logic and state management
│   │   ├── models/            # Data models
│   │   ├── routes/            # App routes and navigation
│   │   ├── services/          # Services for API calls, storage, etc.
│   │   ├── utils/             # Utility functions and helpers
│   │   ├── views/             # UI screens
│   │   └── widgets/           # Reusable UI components
│   └── main.dart              # Entry point
├── assets/
│   ├── fonts/                 # Custom fonts
│   └── images/                # Image assets
└── pubspec.yaml               # Project dependencies
```

## Implementation Details

### State Management

The application uses GetX for state management, following these principles:

- **View Layer**: UI screens that display data and handle user interactions
- **Controller Layer**: Business logic and state management using `Rx` variables
- **Reactive UI**: Using `Obx` to automatically update the UI when state changes

### Features Implemented

1. **Splash Screen**: Initial loading screen with app logo
2. **Home Screen**: Main dashboard with user information and campaign list
3. **Campaign Details**: Detailed view of a selected campaign
4. **Profile Screen**: User profile management
5. **Settings Screen**: App settings and configuration
6. **Permissions Screen**: Handling of device permissions

### Permission Handling

The application handles the following permissions:

- Camera permission
- Location permission
- Storage permission
- Notification permission

Using the `permission_handler` package, the app:
1. Checks current permission status
2. Requests permissions when needed
3. Updates UI based on permission status
4. Provides explanations for why each permission is needed

### UI Components

Custom widgets were created for reusability:

- **CustomButton**: Reusable button component with various styling options
- **CustomTextField**: Text input field with label, validation, and styling
- **CampaignCard**: Card component for displaying campaign information

### Navigation

The app uses GetX for navigation, with defined routes in `app_routes.dart` and page configurations in `app_pages.dart`.

## Design Decisions

1. **GetX State Management**: Chosen for its simplicity, performance, and separation of concerns
2. **Folder Structure**: Organized by feature and responsibility for better maintainability
3. **Reactive Programming**: Using Rx variables for reactive state management
4. **Permission Handling**: Comprehensive permission management with clear user explanations
5. **Reusable Components**: Created custom widgets to maintain consistent UI and reduce code duplication

## Assumptions

1. The app requires various permissions for full functionality
2. Mock data is used in place of actual API calls
3. The design follows the Figma mockups with some minor adaptations for better user experience
4. Korean text is used as shown in the Figma design

## Future Improvements

1. Implement actual API integration
2. Add user authentication
3. Implement caching for better offline experience
4. Add animations for smoother transitions
5. Implement comprehensive error handling
6. Add unit and widget tests

## Dependencies

- **get**: ^4.6.5 - For state management, dependency injection, and navigation
- **permission_handler**: ^10.2.0 - For handling device permissions
- **shared_preferences**: ^2.1.0 - For local storage
- **flutter_svg**: ^2.0.5 - For SVG support
- **cached_network_image**: ^3.2.3 - For image caching
- **intl**: ^0.18.0 - For internationalization