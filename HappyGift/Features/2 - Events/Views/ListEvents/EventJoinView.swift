//
//  EventJoinView.swift
//  HappyGift
//
//  Created by apprenant152 on 13/11/2025.
//

import SwiftUI

struct EventJoinView: View {
    //    @Binding var eventListVM : EventListViewModel
    @Environment(EventViewModel.self) private var eventVM
    @Environment(UserViewModel.self) private var userVM
    @Environment(SnowfallVM.self) private var snowfallVM
    @Environment(\.dismiss) var dismiss
    @Environment(NavigationViewModel.self) private var navigationVM
    
    @State var showAlertEmptyCode: Bool = false
    
    var body: some View {
        
        @Bindable var eventVM = eventVM
        
        
        ZStack{
            Color.beige.ignoresSafeArea()
            
            ScrollView{
                
                VStack{
                    
                    Text("Mon événement ")
                        .font(.custom("Syncopate-Bold", size: 20))
                        .padding()
                    
                    Spacer()
                        .frame(height : 50)
                    ZStack{
                        Image("bonnetNoel")
                            .resizable()
                            .frame(width: 214, height: 380)
                        SnowfallView(size: 450)
                    }
                    
                    VStack(spacing: 12){
                        
                        Text("Code santa")
                            .font(.system( size: 16, weight: .bold))
                            .frame(width: 120)
                            .multilineTextAlignment(.center)
                        
                        TextField("", text: $eventVM.codeEvent)
                            .padding(.horizontal, 10)
                            .frame(width: 140, height: 40)
                            .background(.white.opacity(0.8))
                            .cornerRadius(10)
                            .font(.custom("Syncopate-Bold", size: 20))
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    
                    Spacer()
                        .frame(height: 50)
                    
                    ButtonParticipantCellView(title: "Rejoindre", function: {
                        if !eventVM.codeEvent.isEmpty{
                            Task {
                                navigationVM.isLoading = true
                                defer {navigationVM.isLoading = false}
                                await eventVM.joinEvent(email: userVM.email, code: eventVM.codeEvent)
                                eventVM.codeEvent = ""
                            }
                        }else{
                            showAlertEmptyCode = true
                        }
                    }, size: 274)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
    
        }
        .sheet(isPresented: $eventVM.showValidationJoinModal) {
            EventValidJoinCellView()
                .presentationDetents([.fraction(0.5)])
                .presentationDragIndicator(.visible)
        }
        .alert(isPresented: $showAlertEmptyCode) {
            Alert(title: Text("Veuillez saisir un code."))
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

#Preview {
    EventJoinView()
        .environment(EventViewModel())
        .environment(SnowfallVM())
        .environment(UserViewModel())
        .environment(NavigationViewModel())
}
