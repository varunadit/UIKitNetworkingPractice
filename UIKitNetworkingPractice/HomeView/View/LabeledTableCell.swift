//
//  LabeledTableCell.swift
//  UIKitNetworkingPractice
//
//  Created by Varun Adit on 1/9/24.
//

import UIKit

class LabeledTableCell: UITableViewCell {
    
    var label: UILabel = UILabel()
    
    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, str: String) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureLabel(str)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//        
//    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    func configureLabel(_ str: String) {
        self.label.text = str
        self.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            label.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

    

}
