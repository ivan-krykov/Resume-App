//
//  AddCell.swift
//  Resume App
//
//  Created by stargaltion on 8/13/23.
//

import UIKit
import Foundation

final class AddCell: UICollectionViewCell {
    
    static let identifier = String(describing: AddCell.self)
    
    var onAddTapped: (()-> Void)?
    
    private let addSkillButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupLayout()
        setupStyle()
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
        addSkillButton.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(addSkillButton)
        
        NSLayoutConstraint.activate([
            addSkillButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            addSkillButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            addSkillButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            addSkillButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
            ])
    }
    
    private func setupStyle() {
        
        contentView.backgroundColor = UIColor(named: "cellBackgroundColor")
        contentView.layer.cornerRadius = 12
        addSkillButton.tintColor = .black
        addSkillButton.setImage(UIImage(systemName: "plus"), for: .normal)
    }
    
    private func setUp() {
        addSkillButton.addTarget(self, action: #selector(didTap), for: .touchUpInside)
    }
    
    @objc private func didTap() {
        onAddTapped?()
    }
}
