//
//  String+Extensions.swift
//  AppStoreInformation
//
//  Created by marc matta on 7/11/18.
//  Copyright © 2018 marx. All rights reserved.
//

import Foundation
internal extension String {
    
    func takeTill(find: String) -> String? {
        if let range = self.range(of: find) {
            return String(self[..<range.lowerBound])
        }
        
        return nil
    }
    
    func takeFrom(find: String) -> String? {
        if let range = self.range(of: find) {
            return String(self[range.upperBound...])
        }
        
        return nil
    }
}
