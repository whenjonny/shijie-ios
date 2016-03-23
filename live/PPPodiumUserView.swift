//
//  PPPodiumUserView.swift
//  live
//
//  Created by TUPAI-Huangwei on 3/23/16.
//  Copyright © 2016 Pires.Inc. All rights reserved.
//

import UIKit

class PPPodiumUserView: UIView {
    
    @IBOutlet weak var avatarImageView: PPRoundImageView!
    
    @IBOutlet weak var crownImageView: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    var user: PPUserModel
    
    var rank: Int{
        didSet{
            avatarImageView.layer.borderColor = rankColorDict[rank]
            avatarImageView.layer.borderWidth = 3.0
//            self.setNeedsDisplay()
            
//            
            crownImageView.image = rankCrownDict[rank]
        }
    }
    
    override init(frame: CGRect){
        user = PPUserModel(avatarImageUrl: "nil", username: "nil", coinsContributed: 0, ranking: 0)
        rank = 0
        super.init(frame: frame)
        setupSubviews()
    }
    
    convenience init(){
        self.init(frame: CGRect.zero)
    }
    
    convenience init(user: PPUserModel, rank: Int){
        self.init(frame: CGRect.zero)
        self.user = user
        self.rank = rank
    }
    
    required init?(coder aDecoder: NSCoder) {
        user = PPUserModel(avatarImageUrl: "nil", username: "nil", coinsContributed: 0, ranking: 0)
        rank = 0
        super.init(coder: aDecoder)
        setupSubviews()
    }
    
    func setupSubviews(){
        let nib    = UINib(nibName: "PPPodiumUserView",
            bundle: nil)
        let view   = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        view.frame = self.bounds
        self.addSubview(view)
        
        
    }
    
    private var rankColorDict:Dictionary<Int,CGColor>{
        return [
            1: UIColor(hex: 0xF8E200).CGColor,
            2: UIColor(hex: 0xFFA403).CGColor,
            3: UIColor(hex: 0xD0D0D0).CGColor]
    }
    
    private var rankCrownDict:Dictionary<Int, UIImage>{
        return [
            1: UIImage(named: "ic_no1")!,
            2: UIImage(named: "ic_no2")!,
            3: UIImage(named: "ic_no3")!
        ]
    }
}