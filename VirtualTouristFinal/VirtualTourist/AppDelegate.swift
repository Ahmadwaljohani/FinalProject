//
//  AppDelegate.swift
//  VirtualTourist
//
//  Created by Ahmad on 24/07/2019.
//  Copyright © 2019 ahmad. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        DataController.instance.loadData()
        
        return true
    }
    func saveContext(){
        try? DataController.instance.viewContext.save()
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        saveContext()
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        saveContext()
    }
    
}







