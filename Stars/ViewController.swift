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
