//
//  EventList.swift
//  HappyGift
//
//  Created by apprenant152 on 13/11/2025.
//

import SwiftUI

struct EventList: View {
    @Environment(EventViewModel.self) private var eventVM
    
    @State var eventListVM = EventListViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.beige
                    .ignoresSafeArea()

                VStack {
                    Text("Mes événements")
                        .font(.custom("Syncopate-Bold", size: 20))
                        .padding()

                    ForEach(eventVM.eventsVM) { event in
                        let rotationPattern: [Double] = [0, -2.16, 2.16, 0]
                        let colorPattern: [Color] = [.rose, .rouge, .vert, .rose]
                        let index = eventVM.eventsVM.firstIndex(where: { $0.id == event.id }) ?? 0
                        let rotation = rotationPattern[index % rotationPattern.count]
                        let color = colorPattern[index % colorPattern.count]
                        
                        NavigationLink {
                            RecapEvent()
                        } label: {
                            EventCellView(
                                RectangleColor: color,
                                RectanglePosition: rotation,
                                dateEvent: "12.23.2025",
                                title: event.nomEvent
                            )
                            .padding(.bottom, -24)
                        }
                    }
                    Spacer()
                    
                    ButtonParticipantCellView(title: "Ajouter"){
                        eventListVM.joinEvent(typeEvent: eventListVM.isAddEvent)
                    }
                }
                .padding(.top, 16)
            }
        }
        .navigationBarHidden(true)
        .sheet(isPresented: $eventListVM.isAddEvent) {
            EventJoinView(eventListVM: $eventListVM)
        }
    }
}


#Preview {
    EventList()
        .environment(EventViewModel())
}
