//
//  Parsable.swift
//  AppStoreInformation
//
//  Created by marc matta on 7/11/18.
//  Copyright © 2018 marx. All rights reserved.
//

import Foundation
internal protocol Parsable {
    init(json: [String: Any])
}

internal protocol ParsableArray: Parsable {
    static func parse(json: [[String: Any]]) -> [Self]
}

internal extension ParsableArray {
    static func parse(json: [[String: Any]]) -> [Self]{
        return json.map {Self(json: $0)}
    }
}
