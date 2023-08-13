//
//  ServiceProtocol.swift
//  Resume App
//
//  Created by stargaltion on 8/12/23.
//

import Foundation

protocol ServiceProtocol {
    func fetchSkills() -> [SkillModel]
    func saveSkills(_ skills: [SkillModel])
}
