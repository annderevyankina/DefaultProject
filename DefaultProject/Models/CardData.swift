//
//  CardData.swift
//  DefaultProject
//
//  Created by Анна on 13.11.2024.
//

import Foundation
import SwiftUI

struct Card: Identifiable, Hashable {
 var id = UUID()
 var title: String
 var description: String
 var tags: [String]
}
