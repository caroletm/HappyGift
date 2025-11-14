//
//  ContentView.swift
//  HappyGift
//
//  Created by caroletm on 13/11/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var navigationViewModel = NavigationViewModel()
    @State private var landingViewModel = LandingScreenViewModel(eventVM: EventViewModel())
    @State private var eventViewModel = EventViewModel()
    @State private var participantViewModel = ParticipantViewModel()
    @State private var letterViewModel = LetterViewModel()
    @State private var snowfallViewModel = SnowfallVM()
    @State private var tirageViewModel = TirageViewModel(participantVM: ParticipantViewModel(), currentUserName: "Carole")
    
//    viewModel: TirageViewModel(participantVM: participantVM, currentUserName: "Carole")
    
    var body: some View {
        NavigationStack(path: $navigationViewModel.path) {
            
            LandingScreenView()
                .navigationDestination(for: AppRoute.self) { route in
                    
                    switch route {
                    case .landing:
                        LandingScreenView()
                            .environment(SnowfallVM(
                                    numberOfSnowflakes: 120,
                                    area: .rect,
                                    width: UIScreen.main.bounds.width,
                                    height: 400
                                ))
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
                        TirageView()
                            .environment(SnowfallVM(
                                   numberOfSnowflakes: 100,
                                   area: .circle,
                                   width: 300,
                                   height: 300
                               ))
                    }
                }
        }
        .environment(navigationViewModel)
        .environment(landingViewModel)
        .environment(eventViewModel)
        .environment(participantViewModel)
        .environment(letterViewModel)
        .environment(tirageViewModel)
        .environment(snowfallViewModel)
    }
}

#Preview {
    ContentView()
        .environment(NavigationViewModel())
        .environment(LandingScreenViewModel(eventVM: EventViewModel()))
        .environment(EventViewModel())
        .environment(ParticipantViewModel())
        .environment(LetterViewModel())
        .environment(TirageViewModel(participantVM: ParticipantViewModel(), currentUserName: "Carole"))

}
