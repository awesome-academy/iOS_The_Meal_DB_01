//
//  Resource.swift
//  HealthCareViewer
//
//  Created by MACOS on 10/19/18.
//  Copyright © 2018 MACOS. All rights reserved.
//

import UIKit

public class Resource {
    class var sharedInstance : Resource {
        struct Static {
            static let instance : Resource = Resource()
        }
        return Static.instance
    }
}
