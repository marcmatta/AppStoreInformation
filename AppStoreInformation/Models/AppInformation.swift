//
//  AppInformation.swift
//  AppStoreInformation
//
//  Created by marc matta on 7/11/18.
//  Copyright © 2018 marx. All rights reserved.
//

import Foundation
@objc public class AppInformation: NSObject {
    public let releaseHistory: [AppRelease]?
    
    init(_ releaseHistory: [AppRelease]? = nil) {
        self.releaseHistory = releaseHistory
    }
}
