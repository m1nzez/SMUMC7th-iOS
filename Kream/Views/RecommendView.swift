//
//  RecommendView.swift
//  Kream
//
//  Created by 김민지 on 10/7/24.
//

import UIKit
import SnapKit

class RecommendView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var adsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "HomeAds")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private func addComponents() {
        self.addSubview(adsImageView)
        
        adsImageView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.lessThanOrEqualTo(336)
        }
    }
    
}
