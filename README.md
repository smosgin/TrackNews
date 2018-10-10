# TrackNews

This simple iOS app is designed to fetch recent news articles in the privacy sector and display a series of them as clickable links. The app is designed as a take home project for TrackOff, and should work on all iOS devices running iOS 8.0+. 

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

This app uses Cocoapods as dependencies, and will fail to compile without them. Instructions for installing the base CocoaPods program can be found here: [Getting Started](https://guides.cocoapods.org/using/getting-started.html#getting-started).

### Installing

Once CocoaPods is installed, you can clone the repo and navigate to the root directory of the project. From there, you should be able to run the following command to install the project's dependencies. 

```
pod install
```

As per the instructions in a successful pod install, shut down all instances of XCode and open the xcworkspace file that was created in the root directory of the repository. You may need to build the project a couple of times until there is no error for the missing dependencies.

## Running the app

Click your desired simulator or connected device in the dropdown next to the stop button in XCode, and then click the Run button.

## Built With

* [SwiftyJSON](https://cocoapods.org/pods/SwiftyJSON) - Library for parsing JSON
* [SDWebImage](https://cocoapods.org/pods/SDWebImage) - Library for displaying a web image

## Further Considerations

Some possible improvements to the project include, but are not limited to:

1. Clean up the UI with AutoLayout
2. Add a refresh mechanism that the user can trigger for new articles
3. Search features
4. Utilize a better method for non-SSL links
	1. Whitelist certain domains
	2. Don't display non-SSL news links
5. Follow design standards more closely by abstracting networking calls into a separate class
6. Research better ways to implement the API Key within the code
7. Display networking progress in a user friendly manner (like a progress indicator)
8. Add color to the UI
9. Allow the user to have more navigation functionality within the webview when they click on the link



<!-- ## Versioning -->

<!-- I use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags).  -->

## Authors

* **Seth Mosgin** - *Initial work* - [smosgin](https://github.com/smosgin)

<!-- See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project. -->

<!-- ## License -->

<!-- This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details -->

## Acknowledgments

* News Links provided by [News API](https://https://newsapi.org/)
* Thank you to George at TrackOff for providing this fun project idea
