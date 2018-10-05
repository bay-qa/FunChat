//
//  AvatarCell.swift
//  FunChatik
//
//  Created by Igor on 7/12/18.
//  Copyright © 2018 Igor. All rights reserved.
//

import UIKit

enum AvatarType {
    case dark
    case light
}

class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImg: UIImageView!
    
    //sends a massege to each object recreated from a nib archive, but only after allobjects in the archib=ve have been loaded and initialized.
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpView()
    }
    
    //set image to avatar cell using index
    func configureCell(index: Int, type: AvatarType) {
        if type == AvatarType.dark {
            avatarImg.image = UIImage(named: "dark\(index)")
            self.layer.backgroundColor = UIColor.lightGray.cgColor
        } else {
            avatarImg.image = UIImage(named: "light\(index)")
            self.layer.backgroundColor = UIColor.gray.cgColor
        }
    }
    
    //set up view to our avatars
    func setUpView() {
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
}
