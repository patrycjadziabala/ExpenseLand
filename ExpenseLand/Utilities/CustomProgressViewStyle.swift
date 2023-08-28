//
//  CustomProgressViewStyle.swift
//  ExpenseLand
//
//  Created by Patka on 25/08/2023.
//

import Foundation
import SwiftUI


struct CustomProgressViewStyle: ProgressViewStyle {
    
    var color: String
    var colorString: String
    var height: Double = 20.0
    var labelFontStyle: Font = .body
    //    let gradient:
    
    init(color: String, colorString: String) {
        self.color = color
        self.colorString = colorString
    }
    
    func makeBody(configuration: Configuration) -> some View {
        
        let progress = configuration.fractionCompleted ?? 0.0
        
        let uiColor = UIColor(named: colorString)
        
        let gradient = Gradient(colors: [Color(uiColor: uiColor ?? UIColor.gray), Color(uiColor: uiColor?.darker() ?? UIColor.red)])
        
        let linearGradient = LinearGradient(gradient: gradient, startPoint: .leading, endPoint: .trailing)
        
        GeometryReader { geometry in
            
            VStack(alignment: .leading) {
                
                configuration.label
                    .font(labelFontStyle)
                
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color(uiColor: .systemGray5))
                    .frame(height: height)
                    .frame(width: geometry.size.width)
                    .overlay(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 10.0)
                            .fill(linearGradient)
                            .frame(width: geometry.size.width * progress)
                            .overlay {
                                if let currentValueLabel = configuration.currentValueLabel {
                                    
                                    currentValueLabel
                                        .font(.headline)
                                        .foregroundColor(.white)
                                }
                            }
                    }
            }
        }
    }
}
