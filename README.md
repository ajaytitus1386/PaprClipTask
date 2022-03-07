# Short Reels App

An app made to view short clips conveniently

- [Short Reels App](#short-reels-app)
  - [:rocket: Getting Started](#rocket-getting-started)
  - [:ledger: Architecture](#ledger-architecture)
    - [:file_folder: Data Layer](#file_folder-data-layer)
    - [:briefcase: Domain Layer](#briefcase-domain-layer)
    - [:iphone: Presentation Layer](#iphone-presentation-layer)
  - [:mag_right: How it works](#mag_right-how-it-works)
    - [Handling the API call](#handling-the-api-call)
    - [What the User sees](#what-the-user-sees)

## :rocket: Getting Started

1.  Install Flutter by following the official instruction at [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)
    &nbsp;

2.  Clone this repo using the link in an empty directory

    ```shell
    git clone https://github.com/ajaytitus1386/PaprClipTask.git
    ```

3.  Go to the root of the project and install the dependencies
    ```shell
    flutter pub get
    ```
4.  Next, run the app on a connected device such as an Android phone via USB or an [Android Virtual Device](https://docs.flutter.dev/get-started/install/windows#set-up-your-android-device)
    ```shell
    flutter run
    ```
5.  You can also create an **apk build** using
    ```shell
    flutter build apk
    ```
    Then install it to a connected device.
    ```shell
    flutter install
    ```

## :ledger: Architecture

The architecture is sub-divided into three tiers : Data, Domain and Presentation

### :file_folder: Data Layer

This layer contains implementations for remote data calls and data models

- **api** : Remote data source to communicate with API endpoints
- **models** : Models of Data Objects and conversion logic to and from JSON
- **repo** : Contains the implementation of the repositories contracts in the domain layer.

### :briefcase: Domain Layer

- **entities** : The abstract class of the main data objects used in the business logic
- **repos** : Repository contracts of the intended methods to be implemented
- **usecases** : Intermediaries class where the business logic in the repos is executed.

### :iphone: Presentation Layer

Focuses on Flutter layout and the Widget Tree. Anything and everything to do with the UI is structured here

- **bloc** : contains the Events and States and a BLoC file to manage state based on triggered events
- **pages** : The individual views of the UI
- **widgets** : Reusuable and Extractable widget components
- **styling** : Constants for Colors, TextStyles and so on
- **animations** : contains animated widget wrappers

## :mag_right: How it works

### Handling the API call

This follows a flow between the three architecture layers. When the user lands on the main reel page, the **BLoC** triggers an event requesting the API data, which is associated with a particular method in the **Domain** repository, ensuring a particular entity model is maintained, and its implementation is defined in the **Data** layer.

### What the User sees

All this techno jumbo happens under the hood however. All that the user sees is a loader until the reel data is fetched and the video starts playing. The user can also interact with the player using a few **gestures** like:

    1. Double Tap to Like the Reel (or unlike it)
    2. Single Tap to Mute / Umute the video
    3. Tap and Hold to pause video playback until hold is released
    4. Swiping up or down to navigate between reels
