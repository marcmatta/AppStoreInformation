//
//  AppRelease.swift
//  AppStoreInformation
//
//  Created by marc matta on 7/11/18.
//  Copyright © 2018 marx. All rights reserved.
//

import Foundation

@objc public final class AppRelease : NSObject, ParsableArray{
    static let formatter : DateFormatter = {
        var formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter
    }()
    
    public var notes: String = ""
    private var dateString: String = ""
    public var version: String = ""
    public var date: Date {
        return AppRelease.formatter.date(from: dateString)!
    }
    
    required public init(json: [String : Any]) {
        self.notes = json["releaseNotes"] as? String ?? ""
        self.version = json["versionString"] as? String ?? ""
        self.dateString = json["releaseDate"] as? String ?? ""
    }
}
