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
        
        //var stars: [UITextView] = []
        
        for i in 0...numberOfStars-1 {
            
            let star = UITextView()
            star.isEditable = false
            star.isSelectable = false
            //star.backgroundColor = UIColor.blue
            
            let randX = Int(arc4random_uniform(UInt32(width)))
            let randY = Int(arc4random_uniform(UInt32(height)))
            let randWidth = Int(arc4random_uniform(3))
            let randHeight = Int(arc4random_uniform(3))
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
            star.addGestureRecognizer(tapGesture)
            
            star.frame = CGRect(x: randX, y: randY, width: randWidth, height: randHeight)
            star.tag = i
            
            //stars[i] = star
            self.view.addSubview(star)
            
        }
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
                star.frame = CGRect(x: randX, y: randY, width: randWidth, height: randHeight)
            } else {
                star.frame = CGRect(x: 20, y: 20, width: width - 40, height: height - 40)
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
