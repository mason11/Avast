/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse

class ViewController: UIViewController,UITextFieldDelegate, FBSDKLoginButtonDelegate  {

    //Creating the facebook login button 
    let loginButton:FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        button.readPermissions = ["email"]
        return button
        
        
    }()
    
    
    
    //All the outlets for the signup and login view controller 
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var changeLabel: UILabel!
    
    
    var loginorSignUp:LoginOrSignUp?
    var login = false
    
    @IBAction func submitButtonWasPressed(_ sender: UIButton) {
        //The submit button was pressed make sure all the text fields are full and make sure that the email and username of the user is not already taken 
        if login == false  {
        
        if usernameTextField.text != "" || passwordTextField.text != "" || emailTextField.text != "" {
          //All of the textfields are filled out move on with the registration process 
            loginorSignUp = LoginOrSignUp(name: usernameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!)
            self.performSegue(withIdentifier: "toMain", sender: self)
        }
            
        else{
            //The user has not filled out the text fields present an alert to the user
            makeAlertController(title: "Error", messageToUser: "Please fill out all the required text fields!!");

             }
        }
        else {
            //The user is trying to login to the app 
            
            loginorSignUp = LoginOrSignUp(username: usernameTextField.text!, password: emailTextField.text!)
            self.performSegue(withIdentifier: "toMain", sender: self)
            
            
            
        }
            
    }
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        //The login in button was pressed we need to log the user in
        if login {
       passwordTextField.isHidden = false
        emailTextField.placeholder = "Email..."
        changeButton.setTitle("Login", for: UIControlState.normal)
        changeLabel.text = "Already have an account?"
        login = false
        }
            
        else
        {
            emailTextField.placeholder = "Password..."
            passwordTextField.isHidden = true
            changeButton.setTitle("Sign up", for: UIControlState.normal)
            changeLabel.text = "Need to sign up?";
            login = true
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          textField.resignFirstResponder()
            return true 
    }
    
    
    
    func makeAlertController(title:String,messageToUser:String) {
        let alert = UIAlertController(title: self.title, message:messageToUser, preferredStyle: UIAlertControllerStyle.alert)
        let alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(alertAction)
        present(alert,animated: true,completion: nil)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true 
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         
         view.addSubview(loginButton)
        loginButton.center = view.center
        
        //How to find out if the user has logged into facebook 
        loginButton.delegate = self
        
        //Checking to see if the user is already logged in through facebook 
        
        if let token = FBSDKAccessToken.current() {
            fetchProfile()
        }

        
    }
    
    
    
    func fetchProfile(){
        //Fetching the users profile in facebook 
        print("Profile Fetched");
        //Getting the email of the user
        let parameters = ["fields":"email, first_name, last_name, picture.type(large)"]
        FBSDKGraphRequest(graphPath: "me", parameters: parameters).start { (connection, result, error)
            in
            if error == nil {
                //There is a error: EXIT AUTOMATICALLY OUT OF THE BLOCK WHEN THERE IS AN ERROR 
               
                print(result)
                return
            }
            else {
                //There was an error show the user an error message 
                print(error)
            }
        }
    }
    
    
    
    
    
    //Facebook required methods for the user to log in 
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        //This method will get called when the user logs into the app
        print("Completed FACEBOOK Login");
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    
    func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
        return true
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
