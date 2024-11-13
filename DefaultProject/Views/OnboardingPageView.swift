//
//  OnboardingView.swift
//  DefaultProject
//
//  Created by Анна on 06.11.2024.
//

import SwiftUI

struct OnboardingPageView: View {
    var data: OnboardingData

    var body: some View {
        VStack {
            Image(data.image)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .padding(.top, 50)
            
            Text(data.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)
                .multilineTextAlignment(.center)
            
            Text(data.description)
                .font(.body)
                .padding(.top, 10)
                .multilineTextAlignment(.center)
                .padding([.leading, .trailing], 20)
            
            Spacer()
        }
        .padding()
    }
}
