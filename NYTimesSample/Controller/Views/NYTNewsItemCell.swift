//
//  NYTNewsItemCell.swift
//  NYTimesSample
//
//  Created by Fatih Köse on 15.02.2019.
//  Copyright © 2019 Fatih Köse. All rights reserved.
//

import UIKit

class NYTNewsItemCell: UITableViewCell, Reusable {

    var newsModel : Result!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var imgViewIco: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
         imgView.layer.cornerRadius = 25
         imgView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func update(_ model : Result){
        self.newsModel = model
        lblTitle.text = model.title
        lblAuthor.text = model.byline
        lblDate.text = model.publishedDate
        
        let imgUrl = model.media[0].mediaMetadata.filter { (md) -> Bool in
            md.format == Format.standardThumbnail
        }.first
        
        if let _ = imgUrl{
            imgView?.downloaded(from: model.media[0].mediaMetadata[1].url)
        }else{
            imgView.image = UIImage.init(named: "placeholder")
        }
        
    }
    
}
