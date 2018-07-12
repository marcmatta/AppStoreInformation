//
//  ViewController.swift
//  AppStoreInformation
//
//  Created by marcmatta@gmail.com on 07/12/2018.
//  Copyright (c) 2018 marcmatta@gmail.com. All rights reserved.
//

import UIKit
import AppStoreInformation
let appId = "310633997" // Whatsapp

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var appInformation: AppInformation?  {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        AppStoreInformation.shared(appId: appId).get {[weak self] (result) in
            self?.appInformation = result
        }
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appInformation?.releaseHistory?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReleaseCell", for: indexPath) as! ReleaseCell
        let release = appInformation!.releaseHistory![indexPath.row]
        
        cell.setVersion(value: release.version)
        cell.setNotes(value: release.notes)
        cell.setDate(value: release.date)
        
        return cell
    }
}


class ReleaseCell: UITableViewCell {
    private static let formatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter
    }()
    
    @IBOutlet weak var labelVersion: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelNotes: UILabel!
    
    func setVersion(value: String) {
        self.labelVersion.text = value
    }
    
    func setNotes(value: String) {
        self.labelNotes.text = value
    }
    
    func setDate(value: Date) {
        self.labelDate.text = ReleaseCell.formatter.string(from: value)
    }
}
