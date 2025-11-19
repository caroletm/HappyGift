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
    
//    @State var eventListVM = EventListViewModel()
    
    var body: some View {
        
//        @Bindable var eventVM = EventViewModel()

            ZStack {
                Color.beige
                    .ignoresSafeArea()

                VStack {
                    Text("Mes événements")
                        .font(.custom("Syncopate-Bold", size: 20))
                        .multilineTextAlignment(.center)
                        .padding()

                    ScrollView {
                        ForEach(eventVM.eventsVM) { event in
                            let rotationPattern: [Double] = [0, -2.16, 2.16, 0]
                            let colorPattern: [Color] = [.rose, .rouge, .vert, .rose]
                            let index = eventVM.eventsVM.firstIndex(where: { $0.id == event.id }) ?? 0
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
                        Spacer()
                    }
                    
                    ButtonParticipantCellView(title: "Ajouter"){
//                        eventVM.joinEvent(typeEvent: eventVM.isAddEvent)
                        navVM.path.append(AppRoute.joinEvent)

                    }
                }
                .padding(.top, 16)
            }
//        .navigationBarHidden(true)
//        .sheet(isPresented: $eventVM.isAddEvent) {
//            EventJoinView()
//        }
    }
}


#Preview {
    EventList(eventViewModel: EventViewModel())
        .environment(EventViewModel())
        .environment(NavigationViewModel())
}
