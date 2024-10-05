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

        return label
    }()
    
    public lazy var savedNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "전체 8개"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    // TableView에 customCell 등록
    public lazy var savedTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SavedCell.self, forCellReuseIdentifier: SavedCell.identifier)
        tableView.separatorStyle = .singleLine
        
        return tableView
    }()
    
    private func addComponents() {
        self.addSubview(savedLabel)
        self.addSubview(savedNumberLabel)
        self.addSubview(savedTableView)
        
        savedLabel.snp.makeConstraints {
            $0.top.lessThanOrEqualToSuperview().offset(61)
            $0.leading.lessThanOrEqualToSuperview().offset(10)
        }
        
        savedNumberLabel.snp.makeConstraints {
            $0.top.equalTo(savedLabel.snp.bottom).offset(16)
            $0.leading.lessThanOrEqualToSuperview().offset(13)
        }
        
        savedTableView.snp.makeConstraints {
            $0.top.equalTo(savedNumberLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide.snp.top)
        }
    }
}
