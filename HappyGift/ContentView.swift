//
//  ContentView.swift
//  HappyGift
//
//  Created by caroletm on 13/11/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var navigationViewModel = NavigationViewModel()
    @State private var landingViewModel: LandingScreenViewModel
    @State private var eventViewModel: EventViewModel

    init() {
        let eventVM = EventViewModel()
        self._eventViewModel = State(initialValue: eventVM)
        self._landingViewModel = State(initialValue: LandingScreenViewModel(eventVM: eventVM))
    }

    @State private var letterViewModel = LetterViewModel()
    @State private var snowfallViewModelLanding = SnowfallVM(
        numberOfSnowflakes: 120,
        area: .rect,
        width: UIScreen.main.bounds.width,
        height: 400
    )
    @State private var snowfallViewModelTirage = SnowfallVM(
        numberOfSnowflakes: 100,
        area: .circle,
        width: 300,
        height: 300
    )
   
    var body: some View {
        NavigationStack(path: $navigationViewModel.path) {
            
            LandingScreenView()
                .navigationDestination(for: AppRoute.self) { route in
                    
                    switch route {
                    case .landing:
                        LandingScreenView()
                    case .createEvent:
                        CreateSanta(eventViewModel: eventViewModel)
                    case .recapEvent:
                        RecapEvent()
                    case .detailEvent (let event) :
                        DetailEvent(event: event)
                    case .listEvent:
                        EventList(eventViewModel: eventViewModel)
                    case .joinEvent:
                        EventJoinView()
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
                           
                    }
                }
        }
        .environment(navigationViewModel)
        .environment(landingViewModel)
        .environment(eventViewModel)
        .environment(letterViewModel)
        .environment(snowfallViewModelLanding)
        .environment(snowfallViewModelTirage)
    }
}

#Preview {
    
    let snowfallViewModelLanding = SnowfallVM(
        numberOfSnowflakes: 120,
        area: .rect,
        width: UIScreen.main.bounds.width,
        height: 400
    )
    let snowfallViewModelTirage = SnowfallVM(
        numberOfSnowflakes: 100,
        area: .circle,
        width: 300,
        height: 300
    )
    let eventVM = EventViewModel()
    ContentView()
        .environment(NavigationViewModel())
        .environment(LandingScreenViewModel(eventVM: eventVM))
        .environment(eventVM)
        .environment(LetterViewModel())
        .environment(snowfallViewModelLanding)
        .environment(snowfallViewModelTirage)
}
