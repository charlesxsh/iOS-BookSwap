//
//  SignInViewController.swift
//  BookSwap
//
//  Created by Charles Xia on 1/23/16.
//  Copyright © 2016 Charles. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, loginDelegate, UITextFieldDelegate {

    
    @IBOutlet weak var txFieldUserName: UITextField!
    @IBOutlet weak var txFieldPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let img:UIImage = UIImage(named: "wallpaper")!
        let imgView:UIImageView = UIImageView(frame: self.view.frame)
        imgView.contentMode = .ScaleToFill
        imgView.image = img
        self.view.addSubview(imgView)
        self.view.sendSubviewToBack(imgView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissVC(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func signIn(usrname:String, passwd:String){
//        BSUser.logInWithUsernameInBackground(usrname, password: passwd) { (user, error) -> Void in
//            self.dismissViewControllerAnimated(true, completion: nil)
//        }
        BSUser.signIn(Email: usrname, Password: passwd) { (error) -> Void in
            guard error == nil else {
                print("sdf")
                debugPrint(error)
                return
            }
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func loginIn(usrname: String, passwd: String) {
        signIn(usrname, passwd: passwd)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destVC = segue.destinationViewController as! SignUpViewController
        destVC.logindelegate = self
    }
    
    @IBAction func btnSignin(sender:UIButton){
        BSUser.signIn(Email: txFieldUserName.text!, Password: txFieldPassword.text!) { (error) -> Void in
            guard error == nil else {
                debugPrint(error)
                return
            }
            self.dismissViewControllerAnimated(true, completion: nil)
        }
//        PFUser.logInWithUsernameInBackground(txFieldUserName.text!, password: txFieldPassword.text!) { (user, error) -> Void in
//            self.dismissViewControllerAnimated(true, completion: nil)
//        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func hideKeyboard(sender: UIGestureRecognizer){
        self.view.endEditing(true)
    }

}
