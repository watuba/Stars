//
//  GalaxyVC.swift
//  Stars
//
//  Created by Ben Haun on 11/21/16.
//  Copyright © 2016 Ben Haun. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class GalaxyVC: UIViewController {

    var dbRef: FIRDatabaseReference!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        dbRef = FIRDatabase.database().reference().child("stars")

        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        let height = bounds.size.height
        let numberOfStars = Int(height/4)
        
        //var stars: [UITextView] = []
        
        for i in 0...numberOfStars-1 {
            
            let star = UITextView()
            star.isEditable = false
            star.isSelectable = false
            
            
            let randX = Int(arc4random_uniform(UInt32(width)))
            let randY = Int(arc4random_uniform(UInt32(height)))
            let randWidth = Int(arc4random_uniform(3)+1)
            let randHeight = Int(arc4random_uniform(3)+1)
            
            let starColor = Int(arc4random_uniform(8))
            let starAlpha = CGFloat(Int(arc4random_uniform(7)+3))*0.1
            
            switch starColor {
            case 1:
                star.backgroundColor = UIColor.init(red: 155/255, green: 176/255, blue: 1, alpha: starAlpha)
                
            case 2:
                star.backgroundColor = UIColor.init(red: 170/255, green: 191/255, blue: 255/255, alpha: starAlpha)
                
            case 3:
                star.backgroundColor = UIColor.init(red: 202/256, green: 215/255, blue: 255/255, alpha: starAlpha)
                
            case 4:
                star.backgroundColor = UIColor.init(red: 248/256, green: 247/255, blue: 255/255, alpha: starAlpha)
                
            case 5:
                star.backgroundColor = UIColor.init(red: 255/256, green: 244/255, blue: 234/255, alpha: starAlpha)
                
            case 6:
                star.backgroundColor = UIColor.init(red: 255/256, green: 210/255, blue: 161/255, alpha: starAlpha)
                
            case 7:
                star.backgroundColor = UIColor.init(red: 255/256, green: 204/255, blue: 111/255, alpha: starAlpha)

            default:
                star.backgroundColor = UIColor.init(red: 73/255, green: 220/255, blue: 1, alpha: starAlpha)
            }
            
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
            star.addGestureRecognizer(tapGesture)
            
            star.frame = CGRect(x: randX, y: randY, width: randWidth, height: randHeight)
            star.tag = i
            star.text = "This is a really good share.  Thanks for listening!"
            
            //stars[i] = star
            self.view.addSubview(star)
            
        }
    }
    
    
    @IBAction func loginAndSignUp(_ sender: Any) {
        let userAlert = UIAlertController(title: "Login/Sign Up", message: "Enter your email and password to create a journal.  We'll never spam you!", preferredStyle: .alert)
        print("Do you see it?")

        userAlert.addTextField { (textField:UITextField) in
            textField.placeholder = "Email"
        }
        userAlert.addTextField { (textField:UITextField) in
            textField.isSecureTextEntry = true
            textField.placeholder = "Password"
        }
        
        userAlert.addAction(UIAlertAction(title: "Sign In", style: .default, handler: { (action: UIAlertAction) in
            //let userNameTextField = userAlert.textFields!.first()!
            let emailTextField = userAlert.textFields!.first!
            let passwordTextField = userAlert.textFields!.last!
            
            FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
                if error != nil {
                    print(error?.localizedDescription)
                    let errorAlert = UIAlertController(title: "Error", message: "\(error?.localizedDescription)", preferredStyle: .alert)
                    errorAlert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action: UIAlertAction) in
                    }))
                    self.present(errorAlert, animated: true, completion: nil)
                }
            })
        }))
        
        userAlert.addAction(UIAlertAction(title: "Sign Up", style: .default, handler: { (action: UIAlertAction) in
            let emailTextField = userAlert.textFields!.first!
            let passwordTextField = userAlert.textFields!.last!
            
            FIRAuth.auth()?.createUser(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
                if error != nil {
                    print(error?.localizedDescription)
                    let errorAlert = UIAlertController(title: "Error", message: "\(error?.localizedDescription)", preferredStyle: .alert)
                    errorAlert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action: UIAlertAction) in
                    }))
                    self.present(errorAlert, animated: true, completion: nil)
                }
            })
        }))
        
        userAlert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action: UIAlertAction) in
            
        }))
        
        self.present(userAlert, animated: true, completion: nil)
    }
    
    
    func handleTap(sender: UITapGestureRecognizer) {
        print("tap")
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        let height = bounds.size.height
        
        let randX = Int(arc4random_uniform(UInt32(width)))
        let randY = Int(arc4random_uniform(UInt32(height)))
        let randWidth = Int(arc4random_uniform(3))
        let randHeight = Int(arc4random_uniform(3))
        
        if let star = sender.view as? UITextView {
            print("\(star.tag)")
            
            if star.frame.height > 3 {
                UITextView.animate(withDuration: 0.25, delay: 0.0, options: [.curveEaseInOut], animations: {
                    star.frame = CGRect(x: randX, y: randY, width: randWidth, height: randHeight)
                    star.alpha = 1.0
                }, completion: nil)
                
            } else {
                UITextView.animate(withDuration: 0.4, delay: 0.0, options: [.curveEaseInOut], animations: {
                    star.frame = CGRect(x: 20, y: height/2 - height/6, width: width - 40, height: height/3)
                    star.alpha = 0.7
                }, completion: nil)
                
            }
            print("\(star.frame.height)")
        }
    }



}

/*
@IBOutlet weak var myView: UIView!

override func viewDidLoad() {
    super.viewDidLoad()
    
    // 1. create a gesture recognizer (tap gesture)
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
    
    // 2. add the gesture recognizer to a view
    myView.addGestureRecognizer(tapGesture)
}

// 3. this method is called when a tap is recognized
func handleTap(sender: UITapGestureRecognizer) {
    print("tap")
}
}
*/
