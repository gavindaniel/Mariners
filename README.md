# Mariners

This is an unofficial app for the Seattle Mariners baseball club. This app is intented to be an all-in-one app for keeping up-to-date on everything Mariners.

## Getting Started

Start by downloading the repository as a zip file. Then open the file `Mariners.xcodeproj` to load the project. Plug in the device you wish to load the app on to and set the build device in XCode to that device. Then run the project using `⌘ + R`

## How It Works

### News / Articles

Uses a python script and Beautiful Soup to parse HTML data and create a JSON object to store/update documents in a Firestore database.

### Scores & Standings

Uses Google Cloud to schedule and run python scripts to call Sportradar RESTful APIs periodically to get live and historical data and store/update documents in a Firestore database. 