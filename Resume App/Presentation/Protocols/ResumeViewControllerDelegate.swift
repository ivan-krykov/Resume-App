//
//  ResumeViewControllerDelegate.swift
//  Resume App
//
//  Created by stargaltion on 8/12/23.
//

import Foundation
import UIKit

protocol ResumeViewControllerDelegate: AnyObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func editDidTap()
}
