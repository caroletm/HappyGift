//
//  ContentView.swift
//  HappyGift
//
//  Created by caroletm on 13/11/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var navigationViewModel = NavigationViewModel()
    @State private var landingViewModel = LandingScreenViewModel(targetDate: Date())
    @State private var eventViewModel = EventViewModel()
    @State private var participantViewModel = ParticipantViewModel()
    @State private var letterViewModel = LetterViewModel()
    @State private var tirageViewModel = TirageViewModel(participantVM: ParticipantViewModel(), currentUserName: "Carole")
    
//    viewModel: TirageViewModel(participantVM: participantVM, currentUserName: "Carole")
    
    var body: some View {
        NavigationStack(path: $navigationViewModel.path) {
            
            LandingScreenView()
                .navigationDestination(for: AppRoute.self) { route in
                    
                    switch route {
                    case .landing:
                        LandingScreenView()
                    case .createEvent:
                        CreateSanta()
                    case .recapEvent:
                        RecapEvent()
                    case .detailEvent:
                        DetailEvent()
                    case .listEvent:
                        EventList()
                    case .participantList:
                        ParticipantListView()
                    case .enveloppeView:
                        EnveloppeView(viewModel: LetterViewModel())
                    case .letterView:
                        LetterView(userMessage: "", signature: "", height: 350)
                    case .writeLetter:
                        WriteLetterView()
                    case .mailbox:
                        mailboxView()
                    case .tirageView:
                        TirageView(viewModel: TirageViewModel(participantVM: ParticipantViewModel(), currentUserName: "Carole"))
                    }
                }
        }
        .environment(navigationViewModel)
        .environment(landingViewModel)
        .environment(eventViewModel)
        .environment(participantViewModel)
        .environment(letterViewModel)
        .environment(tirageViewModel)
    }
}

#Preview {
    ContentView()
        .environment(NavigationViewModel())
        .environment(LandingScreenViewModel(targetDate: Date()))
        .environment(EventViewModel())
        .environment(ParticipantViewModel())
        .environment(LetterViewModel())
        .environment(TirageViewModel(participantVM: ParticipantViewModel(), currentUserName: "Carole"))

}
