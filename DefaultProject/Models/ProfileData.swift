//
//  ProfileData.swift
//  DefaultProject
//
//  Created by Анна on 13.11.2024.
//

import Foundation
import SwiftUI
 
struct UserProfile: Identifiable {
 var id = UUID()
 var firstName: String
 var lastName: String
 var email: String
 var avatar: UIImage?
} 
