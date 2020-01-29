//
//  PeopleCell.swift
//  ProgrammaticUserCells
//
//  Created by Tsering Lama on 1/29/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

class PeopleCell: UICollectionViewCell {
    
    var user: User!
    
    @IBOutlet weak var peopleImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func configureCell(user: User) {
        
        nameLabel.text = user.name.first
        
        ImageCLient.getImage(urlString: user.picture.large) { [unowned self ](result) in
            switch result {
            case .failure(_):
                print("error")
            case .success(let image):
                DispatchQueue.main.async {
                    self.peopleImage.image = image
                }
            }
        }
    }
}
