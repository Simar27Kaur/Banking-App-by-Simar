AI was used minimally in the project, mainly to help simplify the navigation logic (without generating any code, just a small portion, around 5-10%) and to create the README file.

# Mobile Banking App

## Overview
This is a simple mobile banking application developed using Flutter. It allows users to:
- View a welcome screen with the bank logo and today's date.
- Navigate to see a list of accounts.
- View transaction details for each account.
- Navigate back from Transactions to Account List and then from Account List to the Welcome page.

## Installation
1. Clone this repository:
   ```sh
   git clone <repository_url>
   ```
2. Navigate to the project directory:
   ```sh
   cd banking_app
   ```
3. Run the application:
   ```sh
   flutter run
   ```

## Project Structure
```
- lib/
  - main.dart  # Main application file (Modified)
  - screens/
    - welcome_screen.dart
    - account_list_screen.dart
    - transaction_screen.dart
```

## Changes Made in main.dart
- Implemented navigation between screens.
- Used JSON data to populate accounts and transactions.
- Implemented a simple UI with ListView and Buttons for navigation.

## Dependencies
- No external dependencies used. Flutter SDK is required.

## License
This project is for educational purposes only.

