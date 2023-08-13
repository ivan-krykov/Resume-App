//
//  SkillCellCollectionViewCell.swift
//  Resume App
//
//  Created by stargaltion on 8/12/23.
//

import UIKit

final class SkillCell: UICollectionViewCell {
    static let identifier = String(describing: SkillCell.self)
    
    var onDeleteTapped: (() -> Void)?
    
    private let skillTextLabel = UILabel()
    private let deleteButton = UIButton()
    
    private var textTrailing: NSLayoutConstraint?
    private var textDeleteButtonTrailing: NSLayoutConstraint?
    private var cellWidth: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupLayout()
        setupStyle()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
        skillTextLabel.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(skillTextLabel)
        contentView.addSubview(deleteButton)
        
        textTrailing = skillTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
        textTrailing?.isActive = true
        
        textDeleteButtonTrailing = skillTextLabel.trailingAnchor.constraint(equalTo: deleteButton.leadingAnchor, constant: -10)
        
        cellWidth = contentView.widthAnchor.constraint(lessThanOrEqualToConstant: 200)
        cellWidth?.isActive = true
        
        NSLayoutConstraint.activate([
            skillTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            skillTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            skillTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),

            deleteButton.widthAnchor.constraint(equalToConstant: 16),
            deleteButton.widthAnchor.constraint(equalToConstant: 16),
            deleteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  -24)
        ])
    }
    
    private func setupStyle() {
        contentView.backgroundColor = UIColor(named: "cellBackgroundColor")
        contentView.layer.cornerRadius = 10
        
        skillTextLabel.textColor = .black
        skillTextLabel.font = .systemFont(ofSize: 16)
        skillTextLabel.adjustsFontSizeToFitWidth = true
        skillTextLabel.minimumScaleFactor = 0.8
        skillTextLabel.lineBreakMode = .byTruncatingTail
        
        deleteButton.tintColor = .black
        deleteButton.setImage((UIImage(systemName: "xmark")), for: .normal)
    }
    
    func configure(data: SkillModel, isEditMode: Bool, maxWidth: CGFloat) {
        contentView.layoutIfNeeded()
        
        skillTextLabel.text = data.skill
        skillTextLabel.invalidateIntrinsicContentSize()
        
        deleteButton.isHidden = !isEditMode
        
        textTrailing?.isActive = !isEditMode
        textDeleteButtonTrailing?.isActive = isEditMode
        
        cellWidth?.constant = maxWidth
    }
    
    private func setup() {
        deleteButton.addTarget(self, action: #selector(didTapDeleteButton), for: .touchUpInside)
    }
    
    @objc private func didTapDeleteButton() {
        onDeleteTapped?()
    }
}
