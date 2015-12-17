//
//  AppDelegate.swift
//  HandoffIntro
//
//  Created by William Wong on 09/12/2015.
//  Copyright © 2015 Fleetmatics. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func application(application: UIApplication,
        continueUserActivity userActivity: NSUserActivity,
        restorationHandler: ([AnyObject]?) -> Void) -> Bool {
            
        //in this method, pass the user activity object to the application's root view controller
        //by return true, tell the application that we have successfully receievd and processed the Handoff user activity.
        self.window?.rootViewController?.restoreUserActivityState(userActivity)
        return true
    }
    
    //before the download of UserActivity, you can return a boolean value to tell the handoff API
    //whether or not you want to continue receiving the user activity.
    //in some case, this may be useful as you can disbale a particular type of NSUserActivity
    //when certain conditions are met.
    func application(application: UIApplication, willContinueUserActivityWithType userActivityType: String) -> Bool {
        return true
    }
    
    
    //error handling for hand-off
    func application(application: UIApplication, didFailToContinueUserActivityWithType userActivityType: String, error: NSError) {
        //detect the error message for error handling
        //put up an alert 
    }

}

