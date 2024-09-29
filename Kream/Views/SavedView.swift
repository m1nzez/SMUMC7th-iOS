//
//  SavedView.swift
//  Kream
//
//  Created by 김민지 on 9/29/24.
//

import UIKit
import SnapKit

class SavedView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var savedLabel: UILabel = {
        let label = UILabel()
        label.text = "Saved"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private func addComponents() {
        self.addSubview(savedLabel)
        
        savedLabel.snp.makeConstraints {
            $0.top.lessThanOrEqualToSuperview().offset(61)
            $0.leading.lessThanOrEqualToSuperview().offset(10)
        }
    }
}
