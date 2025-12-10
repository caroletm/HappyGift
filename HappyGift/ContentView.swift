//
//  ContentView.swift
//  HappyGift
//
//  Created by caroletm on 13/11/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var navigationViewModel: NavigationViewModel
    @State private var landingViewModel: LandingScreenViewModel
    @State private var eventViewModel: EventViewModel
    @State private var letterViewModel: LetterViewModel
    @State private var authViewModel: AuthViewModel
    @State private var userViewModel: UserViewModel

    init() {
        let navigationVM = NavigationViewModel()
        self._navigationViewModel = State(initialValue: navigationVM)

        let eventVM = EventViewModel()
        self._eventViewModel = State(initialValue: eventVM)

        self._landingViewModel = State(initialValue: LandingScreenViewModel(eventVM: eventVM))

        let userVM = UserViewModel()
        self._userViewModel = State(initialValue: userVM)

        self._authViewModel = State(initialValue: AuthViewModel(userVM: userVM))
        self._letterViewModel = State(initialValue: LetterViewModel(userVM: userVM))
    }

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
            
            Group {
                if authViewModel.isAuthenticated {
                        LandingScreenView()
                } else {
                    if authViewModel.showLogin {
                        LoginPage()
                    } else if authViewModel.showSignIn {
                        SignInPage()
                    }
                }
            }
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
                    case .enveloppeView (let letter):
                        EnveloppeView(letter: letter)
                    case .letterView (let letter):
                        LetterView(letter: letter)
                    case .writeLetter:
                        WriteLetterView()
                    case .mailbox:
                        mailbox3View()
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
        .environment(authViewModel)
        .environment(userViewModel)
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
    let userVM = UserViewModel()
    ContentView()
        .environment(NavigationViewModel())
        .environment(LandingScreenViewModel(eventVM: eventVM))
        .environment(eventVM)
        .environment(LetterViewModel(userVM: userVM))
        .environment(snowfallViewModelLanding)
        .environment(snowfallViewModelTirage)
        .environment(AuthViewModel(userVM: userVM))
}
