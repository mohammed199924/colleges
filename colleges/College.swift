//
//  College.swift
//  colleges
//
//  Created by mohammed alhazmi on 7/6/15.
//  Copyright © 2015 mohammed alhazmi. All rights reserved.
//

import UIKit

class College: NSObject {
    var name = ""
    var location = ""
    var student = 0
    var image = UIImage()
    var website = ""
    convenience init(name: String, location: String, website: String, student: Int, image: UIImage) {
        self.init()
        self.name = name
        self.location = location
        self.student = student
        self.image = image
        self.website = website
    }
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}
