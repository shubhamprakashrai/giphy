
# GiphyApp

A Flutter project for browsing, searching, and managing favorite GIFs using the Giphy API.

## Features

- **Trending GIFs on Home Page**: Displays the most popular GIFs trending on Giphy.
- **GIF Search**: Allows users to search for GIFs by entering text in the search bar.
- **Favorite GIFs**: Users can add GIFs to their favorites and remove them when no longer needed.
- **User Authentication**:
    - **Login**: Secure user login functionality.
    - **Signup**: User registration to create a new account.
    - **Forget Password**: Allows users to reset their password.
    - **Logout**: Allows users to log out of their account.
- **GIF Author Details**:
    - Shows the author of each GIF.
    - Provides an option to view the author's Instagram profile via a clickable link if available.

## Screens and Flow

### 1. **Home Page**
- Displays a grid of trending GIFs fetched from the Giphy API.
- Each GIF shows basic details like the author's username.
- A user can click on a GIF to view more details, including the author's information.
- Users can favourite any GIF by tapping the favorite icon.

### 2. **Search Functionality**
- A search bar on the home page allows users to search for GIFs based on keywords.
- Users can view results in a grid format similar to trending GIFs.

### 3. **Favorites**
- Users can manage their favorite GIFs.
- Favorited GIFs are displayed in a separate section where users can remove them if desired.

### 4. **User Authentication**
- **Login**: Secure user login using Firebase.
- **Signup**: Allows new users to register.
- **Forgot Password**: Sends a password reset email to the user.
- **Logout**: Logs the user out of the app and redirects them to the login screen.

### 5. **GIF Author Details**
- Each GIF includes the author’s details, such as the username and social media profiles.
- Users can click on the Instagram link (if provided) to view the author's profile on Instagram.

## Dependencies

The following dependencies are used in this project:

### Flutter SDK Version:
- Dart SDK: `>=3.3.3 <4.0.0`
- Flutter SDK: `>=3.1.0`

### Core Packages:

- **get**: State management, navigation, and dependency injection.
- **http**: For making network requests.
- **logger**: For logging information during development.
- **lottie**: For adding animations (e.g., loading animations).
- **firebase_core**: Core library to initialize Firebase.
- **firebase_auth**: For Firebase Authentication functionality.
- **firebase_messaging**: For Firebase push notifications.
- **cloud_firestore**: For accessing Firestore (NoSQL database by Firebase).
- **intl**: For localization support.
- **flutter_localizations**: Built-in Flutter localization support.
- **async**: Dart's `async` functionality.
- **hive_flutter**: Local storage using Hive (NoSQL database).
- **path_provider**: For file system path access.
- **shimmer**: For shimmering animations (e.g., loading placeholder).
- **cached_network_image**: For efficient loading and caching of network images.
- **animated_text_kit**: For text animations in the app.
- **url_launcher**: To open URLs in an external browser.

# Android App
 - [Check your sent emails on Gmail](https://mail.google.com/mail/u/0/?tab=rm&ogbl#sent/QgrcJHsNnjvrfRfxlcZfwJfRxXNfWLSdXCq?projector=1)

