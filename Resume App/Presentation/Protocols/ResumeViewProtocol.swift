//
//  ResumeViewProtocol.swift
//  Resume App
//
//  Created by stargaltion on 8/12/23.
//

import Foundation
import UIKit

protocol ResumeViewProtocol: UIView {
    func didLoad()
    func reloadData()
    func buttonChange(image: UIImage?)
    func deleteItemsInCollectionView(indexPath: IndexPath)
    var collectionForCell: UICollectionView { get }
}
