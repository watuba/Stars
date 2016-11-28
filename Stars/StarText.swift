//
//  StarText.swift
//  Stars
//
//  Created by Ben Haun on 11/28/16.
//  Copyright © 2016 Ben Haun. All rights reserved.
//

import UIKit

class StarText: UITextView {

    override func awakeFromNib() {
        self.layer.cornerRadius = 2.0
        self.layer.borderColor  = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
    }

}
