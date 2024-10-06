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
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.numberOfLines = 1
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var savedInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 9)
        label.numberOfLines = 2
        label.textAlignment = .left
        label.textColor = UIColor.gray
        
        return label
    }()
    
    private lazy var savedPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .right
        
        return label
    }()
    
    private lazy var savedButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "bookmark.fill")
        button.setImage(image, for: .normal)
        button.tintColor = .black

        return button
    }()
    
    private func addComponents() {
        self.addSubview(savedImageView)
        self.addSubview(savedNameLabel)
        self.addSubview(savedInfoLabel)
        self.addSubview(savedPriceLabel)
        self.addSubview(savedButton)

        
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
            $0.width.equalTo(153)
        }
        
        savedPriceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(67)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        savedButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
            $0.trailing.equalToSuperview().offset(-17)
            $0.width.equalTo(18)
            $0.height.equalTo(18)
        }
    }
    
    // 모델에 따라 셀을 구성하는 함수
    public func configure(model: SavedModel) {
        self.savedImageView.image = UIImage(named: model.savedImage)
        self.savedNameLabel.text = model.savedName
        self.savedInfoLabel.text = model.savedInfo
        self.savedPriceLabel.text = model.savedPrice
        
        // savedInfoLabel에 lineHeight 적용
        let paragrahStyle = NSMutableParagraphStyle()
        paragrahStyle.minimumLineHeight = 14.4
        
        let attributedString = NSAttributedString(string: model.savedInfo , attributes: [.paragraphStyle: paragrahStyle])
        
        self.savedInfoLabel.attributedText = attributedString
    }
}
