Example Apps
------------

WWDC example apps - https://github.com/wwdc/2014

Language Differences
--------------------

Experience of Objective C or Swift as main language

Main difference between the two of these?
* Variables - var label: String
* Constants - let label: String
* Optionals  - var volume: Int?
* String Interpolation and Expressions
* Functions as first class types - funct desc() -> String {}
* Emums passed as value, can have methods
* Tuples
* Pattern matching as part of a switch statement
* Creation of a class without an interface
* Classes (ref), Structs (value)
* Properties and Computed Properties
* Generics

http://mobileoop.com/the-comparison-between-swift-and-objective-c-programming-language

brObjective C Interaction

Frameworks
----------

Cocoa Framework - object oriented API for the OSX operating system
* Foundation
* Application
* Core Data

iOS Frameworks
--------------

https://developer.apple.com/library/ios/documentation/Miscellaneous/Conceptual/iPhoneOSTechOverview/iPhoneOSFrameworks/iPhoneOSFrameworks.html

There are a number of layers to the iOS architecture:
* 1. Cocoa - appearance of the app and key technologies
* 2. Media - mainly graphics, video and look and feel
* 3. Core Services - fundamental system services for apps.  Peer to peer, iCloud, Block Objects, FileSharing, Grand Central Dispatch, SQLite, Cloudkit, Core Data, Core Foundation, Core Location, Core Media
* 4. Core OS - low level features, e.g. Accelerate, Bluetooth, Authentication, Security, System

Each of these are split into high level features and frameworks.

1. Cocoa Touch - gestures, animations, control elements
* EventKit Framework
* GameKit Framework
* HealthKit Framework
* Homekit Framework
* MapKit Framework
* UIKit Framework (PDF generation, printing, multitasking, app management)

Cocoa also provides the following high level features:
* App extensions for contributing to the user interface
* Storyboards
* Apple Push
* Gesture Recognition

3. Core Services
* Core Data Framework - management of the data model, NSFetchedResultsController, SQLite, undo/redo, validation
* Foundation Framework - collections, arrays, sets, bundles, string manipulation, threads and run loops, port and sockets

Storyboard, Autolayout not great.

Memory Management
-----------------

* Manual Retain-Release
* Automatic Reference Counting

http://blog.teamtreehouse.com/ios-memory-management-part-1

Data Structures
---------------

Dependency Injection
--------------------

* Typhoon - http://typhoonframework.org/
* Objection - https://github.com/atomicobject/objection
* 
Packaging
---------

Cocoapods
