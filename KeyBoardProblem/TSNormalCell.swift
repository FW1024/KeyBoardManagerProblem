//
//  TSNormalCell.swift
//  KeyBoardProblem
//
//  Created by Blake on 2023/11/9.
//

import UIKit

class TSNormalCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupViews() {
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.textField)
        
        self.titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
            make.top.equalToSuperview().offset(8)
        }
        
        self.textField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
            make.bottom.equalToSuperview().offset(-8)
            make.height.equalTo(50)
            make.top.equalTo(self.titleLabel.snp.bottom).offset(8)
        }
    }
    
    
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Normal Cell"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        textField.textColor = UIColor.black
        textField.placeholder = "Enter Text"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.red.cgColor
        return textField
    }()

}
