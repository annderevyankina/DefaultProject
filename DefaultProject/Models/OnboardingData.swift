//
//  OnboardingData.swift
//  DefaultProject
//
//  Created by Анна on 06.11.2024.
//

import Foundation
import SwiftUI

struct OnboardingData: Identifiable, Hashable {
    var id = UUID()
    var image: String
    var title: String
    var description: String
}
