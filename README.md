# Bastion23 Monument Explorer

This Flutter app showcases different monuments of Bastion23 with an added augmented reality (AR) projection feature, providing an interactive and immersive experience.

## Features
- Displays various monuments of Bastion23.
- Augmented Reality (AR) projections using the camera.
- Firebase integration for authentication.
- Camera access for AR features.

## Installation

1. Clone the repository:

    ```bash
    git clone (https://github.com/fatimaBenazzou/bastion23)
    ```

2. Navigate to the project directory:

    ```bash
    cd bastion23
    ```

3. Install dependencies:

    ```bash
    flutter pub get
    ```

4. Set up Firebase for your project (follow [Firebase integration steps](https://firebase.flutter.dev/docs/overview)).

5. Run the app:

    ```bash
    flutter run
    ```

## Key Packages
- **camera**: For accessing the camera and AR projection.
- **firebase_auth**: Firebase authentication.
- **firebase_core**: Core Firebase integration.

## Usage
The app will automatically show a splash screen followed by an onboarding screen if the user is not authenticated. Once authenticated, users can explore the monuments and view them in AR.

