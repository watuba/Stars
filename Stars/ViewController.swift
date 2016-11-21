//
//  ViewController.swift
//  Stars
//
//  Created by Ben Haun on 11/21/16.
//  Copyright © 2016 Ben Haun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        let height = bounds.size.height
        let numberOfStars = Int(height/2.5)
        
        for i in 1...numberOfStars {
            
            let star = UITextView()
            //star.backgroundColor = UIColor.blue
            
            let randX = Int(arc4random_uniform(UInt32(width)))
            let randY = Int(arc4random_uniform(UInt32(height)))
            let randWidth = Int(arc4random_uniform(3))
            let randHeight = Int(arc4random_uniform(3))
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
            star.addGestureRecognizer(tapGesture)
            
            star.frame = CGRect(x: randX, y: randY, width: randWidth, height: randHeight)
            
            self.view.addSubview(star)
            
        }
    }
    
    func handleTap(sender: UITapGestureRecognizer) {
        print("tap")
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
