# QuizWiz

This repository contains a Flutter-based quiz app that allows users to answer questions, use a countdown timer, and enjoy a celebratory confetti animation. The app's UI is designed to be engaging and user-friendly.


## Overview

The Quiz App is built using Flutter, a popular UI toolkit for creating natively compiled applications across mobile, web, and desktop from a single codebase. It leverages various Flutter packages for state management, UI design, and animations.

## Features

1. Display questions and answers in an engaging UI.
2. Implement a countdown timer for each question.
3. Celebrate user performance with confetti animation.
4. Navigate between quiz screens and result screen.
5. View the total score and share it with friends.
6. Responsive UI design for different screen sizes.

## Dependencies
The app uses the following dependencies:

- provider for state management.
- quiver for asynchronous operations.
- confetti for the celebratory animation.
- flutter_animate for animations.
- google_fonts for custom fonts.
You can find more details about these dependencies in the pubspec.yaml file.

## Code Structure
The app's code is organized into several files:

- main.dart: The entry point of the app.
- homepage.dart: The home screen of the app with introductory content.
- qstn_ans_screen_container.dart: The screen containing quiz questions and answers.
- show_result.dart: The result screen displaying the user's score.
- provider.dart: Classes for managing state and user interactions.
- timerprovider.dart: Classes for managing the countdown timer.
- Other utility files and assets.
