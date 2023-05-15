//
//  CustomTableViewCell.swift
//  homeWork1
//
//  Created by Chinara on 5/15/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    private let bgView = UIView()
    
    let title: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .systemCyan
        return label
    }()
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    let images = UIImageView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(bgView)
        bgView.addSubview(title)
        bgView.addSubview(descriptionLabel)
        bgView.addSubview(images)

        bgView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(100)
            
        }
        images.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(70)
        }
        title.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(images.snp.trailing).offset(10)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(3)
            make.leading.equalTo(images.snp.trailing).offset(10)
        }
    }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }




