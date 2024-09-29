//
//  SavedCell.swift
//  Kream
//
//  Created by 김민지 on 9/29/24.
//

import UIKit
import SnapKit

class SavedCell: UITableViewCell {
    static let identifier = "SavedCell"

      override func awakeFromNib() {
          super.awakeFromNib()
          // Initialization code
      }

      override func setSelected(_ selected: Bool, animated: Bool) {
          super.setSelected(selected, animated: animated)

          // Configure the view for the selected state
      }
      
      override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
          super.init(style: style, reuseIdentifier: reuseIdentifier)
          self.addComponents()
      }
      
      override func prepareForReuse() {
          super.prepareForReuse()
          self.savedImageView.image = nil
          self.savedNameLabel.text = nil
          self.savedInfoLabel.text = nil
          self.savedPriceLabel.text = nil
      }
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
      
    // 각 셀에 대한 component 설정
      private lazy var savedImageView: UIImageView = {
          let imageView = UIImageView()
          
          return imageView
      }()
      
    private lazy var savedNameLabel: UILabel = {
          let label = UILabel()
          
          return label
      }()
    
    private lazy var savedInfoLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private lazy var savedPriceLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    

    private func addComponents() {
        self.addSubview(savedImageView)
        self.addSubview(savedNameLabel)
        self.addSubview(savedInfoLabel)
        self.addSubview(savedPriceLabel)

        
        savedImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(13)
            $0.left.equalToSuperview().offset(13)
            $0.bottom.equalToSuperview().offset(-14)
            $0.width.height.lessThanOrEqualTo(72)
        }
        
        savedNameLabel.snp.makeConstraints{
            $0.top.equalTo(savedImageView)
            $0.leading.equalTo(savedImageView.snp.trailing).offset(13)
        }
        
        savedInfoLabel.snp.makeConstraints{
            $0.top.equalTo(savedNameLabel.snp.bottom)
            $0.leading.equalTo(savedNameLabel)
        }
    }
    
    public func configure(model: SavedModel) {
        self.savedImageView.image = UIImage(named: model.savedImage)
        self.savedNameLabel.text = model.savedName
        self.savedInfoLabel.text = model.savedInfo
        self.savedPriceLabel.text = model.savedPrice
    }
}
