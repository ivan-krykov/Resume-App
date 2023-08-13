//
//  Assembly.swift
//  Resume App
//
//  Created by stargaltion on 8/13/23.
//

import Foundation
import UIKit

struct Assembly {
    func createViewController() -> UIViewController {
        let resumeView = ResumeView()
        let service = Service()
        
        let controller = ResumeViewController(resumeView: resumeView, service: service)
        
        resumeView.delegate = controller
        
        return controller
    }
}
