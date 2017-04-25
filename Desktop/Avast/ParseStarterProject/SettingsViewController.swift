//
//  SettingsViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Mason Killgore on 3/27/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit
import Parse

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    
    
    
    
    //This is where the logout button for the app will be 

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //This is the main method that will get called when the app loads 
        print("On the settings view controller");
        usernameLabel.text = PFUser.current()?.username
        
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        //usernameLabel.text = PFUser.current()?.username
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        //The user has pressed the logout button log the user out and return to the main screen 
        
        PFUser.logOut()
       
    }
    
    

}
