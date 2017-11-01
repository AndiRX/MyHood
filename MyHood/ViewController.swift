//
//  ViewController.swift
//  MyHood
//
//  Created by Petr on 29.10.17.
//  Copyright © 2017 Andi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

@IBOutlet weak var tableView: UITableView!
    
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
            DataService.instance.deletePosts()
//        DataService.instance.loadPosts()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.onPostsLoaded(_:)), name: NSNotification.Name.init(rawValue: "postsLoaded"), object: nil)
        
     
                tableView.reloadData()
        
     }
    
    func tableView(_ tableView:
        UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let post = DataService.instance.loadedPosts[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell {
            cell.configureCell(post)
            return cell
        }
        
        return PostCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return DataService.instance.loadedPosts.count
    }

    func onPostsLoaded(_ notif: AnyObject) {
        tableView.reloadData()
    }
    
}
