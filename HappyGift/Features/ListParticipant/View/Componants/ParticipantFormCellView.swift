//
//  ParticipantFormCellView.swift
//  HappyGift
//
//  Created by Sebastien Besse on 12/11/2025.
//

import SwiftUI

struct ParticipantFormCellView: View {
    
    @Binding var participantVM : ParticipantViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            VStack(alignment: .leading, spacing: 50){
                Text("Ajouter un participant")
                    .font(.custom("Syncopate-Bold", size: 15))
                    .foregroundStyle(Color("beige"))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top)
                
                participantForm
              
                ButtonParticipantCellView {
                    participantVM.addParticipant()
                    dismiss()
                    participantVM.reset()
                }
                
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("vert"))
    }
    
    func textfield(title: String, data: Binding<String>) -> some View{
        HStack(alignment: .center) {
            Text(title)
                .font(.custom("Syncopate-Bold", size: 12))
                .foregroundStyle(Color("beige"))
                .frame(width: 70, alignment: .leading)
            
            TextField("", text: data)
                .padding(.horizontal, 10)
                .frame(height: 40)
                .background(Color("beige"))
                .cornerRadius(10)
                .foregroundColor(Color("vertDark"))
                .font(.custom("Syncopate-Regular", size: 14))
        }
    }
    
    var participantForm: some View{
        VStack(spacing: 20){
            textfield(title: "name", data: $participantVM.name)
            textfield(title: "tel", data: $participantVM.tel)
            textfield(title: "email", data: $participantVM.email)
        }
        .padding()
      
    }
}

#Preview {
    ParticipantFormCellView(participantVM: .constant(.init()))
}
