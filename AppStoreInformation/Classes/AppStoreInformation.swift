//
//  facilitator.swift
//  releasehistory
//
//  Created by marc matta on 7/11/18.
//  Copyright © 2018 marx. All rights reserved.
//

import Foundation

@objc public class AppStoreInformation: NSObject {
    private var appId: String
    private init(appId: String) {
        self.appId = appId
    }
    
    private static var instances: [String: AppStoreInformation] = [:]
    @objc public class func shared(appId: String) -> AppStoreInformation{
        if let instance = instances[appId] {
            return instance
        }
        
        let instance = AppStoreInformation(appId: appId)
        instances[appId] = instance
        return instance
    }
    
    private var task : URLSessionDataTask?
    
    @objc public func get(completion: @escaping (AppInformation) -> Void) {
        if task == nil, let url = URL(string: "https://itunes.apple.com/us/app/subops/id\(appId)") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("143445-2,32", forHTTPHeaderField: "X-Apple-Store-Front")
            request.setValue("MZStore", forHTTPHeaderField: "apple-originating-system")
            
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
            task = session.dataTask(with: request) {[weak self] (data, response, error) in
                guard error == nil, let responseData = data else { return }
                
                if let value = String(data: responseData, encoding: String.Encoding.utf8),
                    let releaseHistory = self?.info(from : value) {
                    completion(releaseHistory)
                }
                
                self?.task = nil
            }
            task?.resume()
        }
    }
    
    private func info(from html: String) -> AppInformation {
        return AppInformation(releaseHistory(from: html))
    }
 
    private func releaseHistory(from html: String) -> [AppRelease]? {
        let serverData = html.takeFrom(find: "its.serverData=")?.takeTill(find: "</script>")
        if let data = serverData?.data(using: .utf8),
            let json = try? JSONSerialization.jsonObject(with: data, options: []) as! [String: Any],
            let pageData = json["pageData"] as? [String: Any],
            let softwarePageData = pageData["softwarePageData"] as? [String: Any],
            let versionHistory = softwarePageData["versionHistory"] as? [[String: Any]] {
            return AppRelease.parse(json: versionHistory)
        }
        
        return nil
    }
}
