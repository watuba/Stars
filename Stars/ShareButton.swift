//
//  ShareButton.swift
//  Stars
//
//  Created by Ben Haun on 11/28/16.
//  Copyright © 2016 Ben Haun. All rights reserved.
//

import UIKit

class ShareButton: UIButton {

    override func awakeFromNib() {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 5.0
    }
}
