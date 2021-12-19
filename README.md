# Overview

A peer to peer networking app built with [Flutter](https://docs.flutter.dev/) frontend and [Firebase](https://firebase.google.com/docs) backend.

- Connect with users to track gambling wins and losses.
- Clean, modern, user-friendly UI

## Getting Started

Follow these instructions to get you started with the p2p app.

## Pre-requisites
What do I need to start working on the p2p app?

### Windows
<details>
	<summary>Git</summary>

We use Git to manage our codebase. Download the latest version of Git [here.](https://gitforwindows.org/)
</details>

<details>
	<summary>Flutter</summary>

This is the native frontend framework used to code our project. Download the latest version of Flutter [here.](https://docs.flutter.dev/get-started/install/windows)
</details>

<details>
	<summary>Android Studio</summary>

To build and test the app you can:
1. Run on Android Studio.  
	a. [Download](https://developer.android.com/studio) Android Studio.  
	b. Download the AVD (Android Virtual Device) inside Android Studio. Go [here](https://developer.android.com/studio/run/managing-avds) for an in-depth guide.
</details>

## Installation & Running
**Getting your development environment running...**
1. Click the green code button on the home page of this repository.
2. Copy the HTTPS URL provided.
3. Open a command prompt and navigate to your desired directory.
3. Clone the repository onto your local machine by executing the command:
```
git clone [URL]
```
4. In the same command prompt, execute the command:
```
flutter doctor
```
    - This command will show you a list of all of the needed dependecies to run the Flutter project.
    - The "doctor" will show you if you have satisfied all of the requirements and if not, will provide instructions on how to install the needed dependencies.
    - This command will also download the [Dart SDK](https://dart.dev/get-dart) which is the language used to code a Flutter project.
5. Open an instance of Android Studio.
6. Click on `More Actions` dropdown and open the AVD Manager.
7. Click on the `Create Virtual Device` button. 
8. Select your desired virtual device and configure it to your desired specifications.
9. Once your device is saved, click the green play button located under the `Actions` tab.
    - This will run an instance of your virtual device.
10. In the same command prompt as Step 4, execute the command:
```
flutter devices
```
    - This command will show you a list of all devices capable of running the Flutter project.
    - You should see your virtual device listed.
11. In the same command prompt, execute the command:
```
flutter run
```
    - After about a minute of loading, the Flutter project will run on your virtual device!