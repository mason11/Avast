//
//  LoginOrSignUp.swift
//  ParseStarterProject-Swift
//
//  Created by Mason Killgore on 3/28/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import Foundation
import Parse


class LoginOrSignUp {
    
    var username:String?
    var email:String?
    var password:String?
    
    
    init(name:String,email:String,password:String){
        self.username = name;
        self.email = email;
        self.password = password;
        
        //Intializing the user in the Parse database 
        
        let user = PFUser()
        user.username = getName()
        user.email = getEmail()
        user.password = getPassword()
        user["points"] = 0 
        
        
        user.signUpInBackground { (success, error) in
            if error != nil {
                //There was an error need to display a message to the user 
                print("The user is signed UP!!");
                
            }
            else  {
                //There was no error and the user is signed up
            }
        }
    }
    
    
    
    
    
    //The second intializer for logging the user into the app 
    
    init(username:String,password:String) {
        self.username = username
        self.password = password
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if error != nil {
                
                //There was an error and I need to show the user the alert screen
                
            }
            else {
                
                //There was no error and the user is signed in succuesfully 
                print("The user has signed in");
            }
        }
        
        
    }
    
    
    
    
    //The return methods for the variables 
    
    func getName() -> String {
        return username!
    }
    
    func getEmail() -> String {
        return email!;
    }
    
    
    func getPassword() -> String {
        return password!;
    }
    
    //The set mehtods for the variables 
    
    func setName(name:String) {
        self.username = name;
    }
    
    
    func setEamil(email:String) {
        self.email = email;
    }
    
    
    func setPassword(password:String) {
        self.password = password;
    }
    

}
