//
//  PostCell.swift
//  MyHood
//
//  Created by Petr on 29.10.17.
//  Copyright © 2017 Andi. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func configureCell(_ post: Post) {
        titleLbl.text = post.title
        descLbl.text = post.postDesc
        postImg.image = DataService.instance.imageForPath(post.imagePath)
        print("configureCell imagePath = \(post.imagePath)")
    }
    
}
