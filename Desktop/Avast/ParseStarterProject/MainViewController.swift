//
//  MainViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Mason Killgore on 3/27/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit
import CoreLocation

class MainViewController: UIViewController,CLLocationManagerDelegate {

    //This will be in minutes
    var timeDriven:Int?
    //This will be in miles
    var distanceDriven:Int?
    //This will be in miles per hour
    var averageSpeed:Int?
    
    
    var trackingLocation = false
    var timer = Timer()
    var counter = 0;
    
    
    @IBOutlet weak var mainButton: UIButton!
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var BackgroundLabel: UILabel!
    
    
    
    
    @IBAction func startGainingPointsButtonPressed(_ sender: UIButton) {
        
        if trackingLocation == true {
        
        //The user has pressed the button and now the app should start tracking points based on the users speed, distance, and time 
        print("The start gaining points button has been pressed");
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        //Starting the timer after the user presses the start driving button 
        
        
        //timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(MainViewController.stopWatch), userInfo: nil, repeats: true)
            
            mainButton.setTitle("Stop Gaining Points", for: UIControlState.normal)
            trackingLocation = false
        }
        else {
    
            mainButton.setTitle("Start Gaining Points", for: UIControlState.normal)
            trackingLocation = true
            print("The stop gaining points button has been pressed");
            
        }
        
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //This is the first method that will get called when this view controller loads 
        print("On the main view controller")
        
        //Getting the users location in the app 
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest

        BackgroundLabel.layer.cornerRadius = 30.0
        BackgroundLabel.clipsToBounds = true
        trackingLocation = true
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

     //A function that calculates the users points after they have finished driving 
    func calculatePoints(time:Int,Distance:Int) -> Int? {
        
        
        
        //Return the total points the user has earned at the end of the trip
        return 0
    }
    
    //This is how we actually get the location that the user is at 
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //Every time the app is running this method will get called 
        print(locations)
        
    }
    
    
    
    //Creating a stop watch to see how long the user is driving for 
    
    func stopWatch() {
        //Every time this function is called I need to add one second to the counter
        counter = counter + 1;
        print("The timer is at \(counter) seconds.");
        
        
        
        
        
    }
    
    

}
