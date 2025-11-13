//
//  EventJoinView.swift
//  HappyGift
//
//  Created by apprenant152 on 13/11/2025.
//

import SwiftUI

struct EventJoinView: View {
    @Binding var eventListVM : EventListViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            SnowfallView(size: 250)
            VStack{
                Text("Mon événement ")
                    .font(.custom("Syncopate-Bold", size: 20))
                    .padding()
                
                Spacer()
                Image("bonnetNoël")
                    .resizable()
                    .frame(width: 214, height: 380)
                VStack(spacing: 12){
                    
                    Text("Code santa")
                        .font(.custom("Syncopate-Bold", size: 13))
                        .frame(width: 120)
                        .multilineTextAlignment(.center)
                    
                    TextField("", text: $eventListVM.codeEvent)
                        .padding(.horizontal, 10)
                        .frame(width: 140, height: 40)
                        .background(.white.opacity(0.8))
                        .cornerRadius(10)
                        .font(.custom("Syncopate-Bold", size: 20))
                        .multilineTextAlignment(.center)
                }
                .padding()
                
                
                
                Spacer()
                
                ButtonParticipantCellView(title: "Rejoindre", function:{
                    eventListVM.joinEvent(typeEvent: eventListVM.isJoinEvent)
                    dismiss()
                }, size: 274)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(.beige)
        }
        
    }
}

#Preview {
    EventJoinView(eventListVM: .constant(.init()))
}
