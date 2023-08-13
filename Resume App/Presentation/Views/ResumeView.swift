//
//  ResumeView.swift
//  Resume App
//
//  Created by stargaltion on 8/12/23.
//

import UIKit

final class ResumeView: UIView {
    
    weak var delegate: ResumeViewControllerDelegate?
    let hardCodeConstants = HardCodeText()

    private let scrollView = UIScrollView()
    private let scrollContainerView = UIView()
    private let topFillerView = UIView()
    private let topViewContainer = UIView()
    private let titleLabel = UILabel()
    private let photoImageView = UIImageView()
    private let editButton = UIButton()
    private let nameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let locationLabel = UILabel()
    private let shortDescriptionLabel = UILabel()
    private let fullDescription = UILabel()
    private let mySkillsLabel = UILabel()

    private let photoSize = 150.0

    private let alignedFlowLayout = LeftAlignedCollectionViewFlowLayout()
    lazy var collectionView = DynamicHeightCollectionView(frame: .zero, collectionViewLayout: alignedFlowLayout)

    private func setUpLayout() {
        let scrollContentGuide = scrollView.contentLayoutGuide

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.translatesAutoresizingMaskIntoConstraints = false
        topViewContainer.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        shortDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        fullDescription.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        mySkillsLabel.translatesAutoresizingMaskIntoConstraints = false
        editButton.translatesAutoresizingMaskIntoConstraints = false
        topFillerView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(topFillerView)
        addSubview(scrollView)
        scrollView.addSubview(scrollContainerView)
        scrollContainerView.addSubview(topViewContainer)
        scrollContainerView.addSubview(shortDescriptionLabel)
        scrollContainerView.addSubview(fullDescription)
        scrollContainerView.addSubview(collectionView)
        scrollContainerView.addSubview(mySkillsLabel)
        scrollContainerView.addSubview(editButton)
        topViewContainer.addSubview(titleLabel)
        topViewContainer.addSubview(photoImageView)
        topViewContainer.addSubview(nameLabel)
        topViewContainer.addSubview(descriptionLabel)
        topViewContainer.addSubview(locationLabel)

        NSLayoutConstraint.activate([

            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),

            topFillerView.topAnchor.constraint(equalTo: topAnchor),
            topFillerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topFillerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topFillerView.bottomAnchor.constraint(greaterThanOrEqualTo: scrollContainerView.topAnchor),

            scrollContainerView.leadingAnchor.constraint(equalTo: scrollContentGuide.leadingAnchor),
            scrollContainerView.trailingAnchor.constraint(equalTo: scrollContentGuide.trailingAnchor),
            scrollContainerView.topAnchor.constraint(equalTo: scrollContentGuide.topAnchor),
            scrollContainerView.bottomAnchor.constraint(equalTo: scrollContentGuide.bottomAnchor),

            scrollContainerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollContainerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollContainerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            topViewContainer.topAnchor.constraint(equalTo: scrollContainerView.topAnchor),
            topViewContainer.bottomAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 19),
            topViewContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            topViewContainer.trailingAnchor.constraint(equalTo: trailingAnchor),

            titleLabel.topAnchor.constraint(equalTo: topViewContainer.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: topViewContainer.centerXAnchor),

            photoImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 35),
            photoImageView.leadingAnchor.constraint(equalTo: topViewContainer.leadingAnchor, constant: 120),
            photoImageView.trailingAnchor.constraint(equalTo: topViewContainer.trailingAnchor, constant: -120),
            photoImageView.heightAnchor.constraint(equalToConstant: photoSize),

            nameLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: topViewContainer.leadingAnchor, constant: 100),
            nameLabel.trailingAnchor.constraint(equalTo: topViewContainer.trailingAnchor, constant: -100),

            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: topViewContainer.leadingAnchor, constant: 30),
            descriptionLabel.trailingAnchor.constraint(equalTo: topViewContainer.trailingAnchor, constant: -30),

            locationLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5),
            locationLabel.leadingAnchor.constraint(equalTo: topViewContainer.leadingAnchor, constant: 30),
            locationLabel.trailingAnchor.constraint(equalTo: topViewContainer.trailingAnchor, constant: -30),

            mySkillsLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 40),
            mySkillsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            editButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            editButton.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 40),

            collectionView.topAnchor.constraint(equalTo: mySkillsLabel.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            shortDescriptionLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 24),
            shortDescriptionLabel.leadingAnchor.constraint(equalTo: scrollContainerView.leadingAnchor, constant: 16),

            fullDescription.topAnchor.constraint(equalTo: shortDescriptionLabel.bottomAnchor, constant: 8),
            fullDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            fullDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            fullDescription.bottomAnchor.constraint(equalTo: scrollContainerView.bottomAnchor)

        ])
    }
    
    private func setUpStyle() {
        let image = UIImage(named: "location")
        let attachment = NSTextAttachment()
        let attributedString = NSMutableAttributedString(string: hardCodeConstants.location)
        
        backgroundColor = .white
        
        topViewContainer.backgroundColor = UIColor(named: "topViewBackground")
        
        scrollView.frame = bounds
        scrollView.clipsToBounds = true
        scrollView.contentInsetAdjustmentBehavior = .always
        
        titleLabel.text = "Профиль"
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        titleLabel.textAlignment = .center
        
        photoImageView.image = UIImage(named: "photo")
        photoImageView.clipsToBounds = true
        photoImageView.layer.cornerRadius = photoSize/2
        
        nameLabel.text = hardCodeConstants.name
        nameLabel.numberOfLines = 0
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.font = .systemFont(ofSize: 24, weight: .bold)
        nameLabel.textAlignment = .center
        
        descriptionLabel.text = hardCodeConstants.shortExperience
        descriptionLabel.textColor = UIColor(named: "textColorDescription")
        descriptionLabel.numberOfLines = 0
        descriptionLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.textAlignment = .center
        
        attachment.image = image
        attributedString.insert(NSAttributedString(attachment: attachment), at: 0)
        locationLabel.attributedText = attributedString
        locationLabel.textColor = UIColor(named: "textColorDescription")
        locationLabel.numberOfLines = 1
        locationLabel.font = .systemFont(ofSize: 14, weight: .regular)
        locationLabel.textAlignment = .center
        
        shortDescriptionLabel.text = "Обо мне"
        shortDescriptionLabel.textAlignment = .left
        shortDescriptionLabel.font = .systemFont(ofSize: 16, weight: .medium)
        
        fullDescription.text = hardCodeConstants.fullDescription
        fullDescription.textAlignment = .left
        fullDescription.numberOfLines = 0
        fullDescription.font = .systemFont(ofSize: 14, weight: .regular)
        
        collectionView.dataSource = delegate
        collectionView.register(SkillCell.self, forCellWithReuseIdentifier: SkillCell.identifier)
        collectionView.register(AddCell.self, forCellWithReuseIdentifier: AddCell.identifier)
        
        alignedFlowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        mySkillsLabel.text = "Мои навыки"
        mySkillsLabel.font = .systemFont(ofSize: 16, weight: .medium)
        
        scrollView.isScrollEnabled = true
        editButton.setImage(UIImage(named: "edit"), for: .normal)
    }
    
    private func setUp() {
        editButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
    }
    
    @objc func editButtonTapped() {
        delegate?.editDidTap()
    }
}

extension ResumeView: ResumeViewProtocol {
    
    var collectionForCell: UICollectionView {
        collectionView
    }
    
    func deleteItemsInCollectionView(indexPath: IndexPath) {
        collectionView.deleteItems(at: [indexPath])
    }
    
    func buttonChange(image: UIImage?) {
        editButton.setImage(image, for: .normal)
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
    
    func didLoad() {
        setUpStyle()
        setUpLayout()
        setUp()
    }
}
