//
//  EventList.swift
//  HappyGift
//
//  Created by apprenant152 on 13/11/2025.
//

import SwiftUI

struct EventList: View {
    @Environment(EventViewModel.self) private var eventVM
    @Bindable var eventViewModel : EventViewModel
    @Environment(NavigationViewModel.self) private var navVM
    
    var body: some View {

            ZStack {
                Color.beige
                    .ignoresSafeArea()

                VStack {
                    Text("Mes événements")
                        .font(.custom("Syncopate-Bold", size: 20))
                        .multilineTextAlignment(.center)
                        .padding()

                    ScrollView {
                        
                        if !eventVM.eventsSortedByDate.isEmpty {
                            ForEach(eventVM.eventsSortedByDate) { event in
                                let rotationPattern: [Double] = [0, -2.16, 2.16, 0]
                                let colorPattern: [Color] = [.rose, .rouge, .vert]
                                let index = eventVM.eventsSortedByDate.firstIndex(where: { $0.id == event.id }) ?? 0
                                let rotation = rotationPattern[index % rotationPattern.count]
                                let color = colorPattern[index % colorPattern.count]
                                
                                Button {
                                    navVM.path.append(AppRoute.detailEvent(event : event))
                                    
                                } label: {
                                    EventCellView(
                                        RectangleColor: color,
                                        RectanglePosition: rotation,
                                        dateEvent: event.dateEvent,
                                        title: event.nomEvent
                                    )
                                    .padding(.bottom, -24)
                                }
                            }
                        }else{
                            Spacer()
                            Text("Vous n'avez pas encore d'événements")
                                .multilineTextAlignment(.center)
                                .padding()
                        }

                        Spacer()
                    }
                    
                    ButtonParticipantCellView(title: "Ajouter"){
                        navVM.path.append(AppRoute.joinEvent)

                    }
                }
                .padding(.top, 16)
            }
    }
}


#Preview {
    EventList(eventViewModel: EventViewModel())
        .environment(EventViewModel())
        .environment(NavigationViewModel())
}
