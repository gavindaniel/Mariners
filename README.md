# Mariners

This is an unofficial app for the Seattle Mariners baseball club. This app is intented to be an all-in-one app for keeping up-to-date on everything Mariners.

## Getting Started

Start by downloading the repository as a zip file. Then open the file `Mariners.xcodeproj` to load the project. Plug in the device you wish to load the app on to and set the build device in XCode to that device. Then run the project using `⌘ + R`

## How It Works

### News / Articles

Uses a python script to parse the HTML from the ESPN page for the Mariners and builds an array of URLs for game recaps. The script then iterates through the array and parses the HTML in each game recap article to collect the necessary info to build the articles in the App. As the script runs and parses the HTML it is wrtiting a JSON file to be sent to the app (for now it just builds a local file that I load into `Resources` folder).