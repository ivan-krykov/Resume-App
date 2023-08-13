//
//  Service.swift
//  Resume App
//
//  Created by stargaltion on 8/12/23.
//

import Foundation

class Service: ServiceProtocol {
    
    private let userDefaults = UserDefaults.standard
    private let skillKey = "skill"
    
    private var defaultData: [SkillModel] = [
        SkillModel(skill: "Swift"),
        SkillModel(skill: "UIKit"),
        SkillModel(skill: "ARC"),
        SkillModel(skill: "REST APIs"),
        SkillModel(skill: "Git"),
        SkillModel(skill: "MVP"),
        SkillModel(skill: "MVC"),
        SkillModel(skill: "GoF")
    ]
    
    func fetchSkills() -> [SkillModel] {
        guard let data = userDefaults.object(forKey: skillKey) as? Data else {
            return defaultData
        }
        
        let skills = (try? JSONDecoder().decode([SkillModel].self, from: data)) ?? []
        return skills.isEmpty ? defaultData : skills
    }
    
    func saveSkills(_ skills: [SkillModel]) {
        guard let data = try? JSONEncoder().encode(skills) else {
            return
        }
        userDefaults.set(data, forKey: skillKey)
    }
}
