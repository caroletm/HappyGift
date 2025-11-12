//
//  Countdown.swift
//  HappyGift
//
//  Created by Apprenant125 on 12/11/2025.
//

import SwiftUI

struct Countdown : View {
    var body: some View {
        VStack {
            //les élements au dessus de la neige
            HStack {
                Text("Prochain Évènement")
                    .font(.custom("Syncopate-Bold", size: 12))
                    .padding(.leading, 30)
                    .padding(.bottom)
                Spacer()
            }

            
            HStack (spacing: 15) {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 60, height: 60)
                    .foregroundStyle(.white)
                
                VStack {
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(.grisDark)
                    
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(.grisDark)
                }

                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 60, height: 60)
                    .foregroundStyle(.white)

                
                VStack {
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(.grisDark)

                    
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(.grisDark)
                }

                
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 60, height: 60)
                    .foregroundStyle(.white)

            }

            
        }
    }
}

#Preview {
    Countdown()
}


