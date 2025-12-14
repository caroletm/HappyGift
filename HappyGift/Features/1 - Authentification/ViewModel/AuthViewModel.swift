//
//  AuthViewModel.swift
//  HappyGift
//
//  Created by caroletm on 25/11/2025.
//

import Foundation
import Observation
import SwiftUI

@Observable

class AuthViewModel {
    
    var userVM : UserViewModel
    
    init(userVM : UserViewModel) {
        self.userVM = userVM
    }
    
    //MARK: - Etats d'affichage
    
    var isPasswordVisible: Bool = false
    var isPasswordVisibleConfirm: Bool = false
    var rememberMe: Bool = false
    var showLanding : Bool = true
    var showLogin : Bool = true
    var showSignIn : Bool = true
//    var showSignUp: Bool = false
    var isFirstConnexion : Bool = false
    
    //MARK: - Etats d'authentification
    
    var isAuthenticated: Bool = false
    var firstConnection: Bool = false
    var currentUser : UserDTO?
    var authToken: String?
    var errorMessage: String?
    var isLoading: Bool = false
    
    // MARK: - Services et stockage
    private let userService = UserService.shared
    private let tokenKey = "token"
    
//    //Checker si c'est la 1ere connexion
//    func checkFirstConnection() {
//        guard let user = currentUser else {
//              isFirstConnexion = true
//              return
//          }
//
//          if user.name.isEmpty ||
//             user.prenom.isEmpty ||
//             user.taille == 0 ||
//             user.poids == 0 ||
//             user.sexe == .other {
//              
//              isFirstConnexion = true
//              showProfilOnboarding = true
//          } else {
//              isFirstConnexion = false
//              showProfilOnboarding = false
//          }
//    }
    
    
    //MARK: - Login Page
    
    //se connecter
    func signIn() async {
        guard !userVM.email.isEmpty, !userVM.motDePasse.isEmpty else {
            errorMessage = "Email ou mot de passe vide"
            return
        }
        
        isLoading = true
        defer { isLoading = false }
        
        errorMessage = nil
        
        do {
            // Login et récupération du token
            let token = try await userService.login(email: userVM.email, motDePasse: userVM.motDePasse)
            authToken = token
            UserDefaults.standard.set(token, forKey: tokenKey)
            print("Token reçu: \(token)")
            
            // Charger le profil utilisateur
            currentUser = try await userService.getProfile(token: token)
            print("Profil chargé: \(String(describing: currentUser?.name))")
            if currentUser?.name != nil {
                userVM.name = currentUser!.name
            }

            // Vérifier première connexion
//            checkFirstConnection()
//            userVM.update(from: currentUser!)

            showLogin = false
//            showSignUp = false
            
            // Réinitialiser le mot de passe local
            userVM.motDePasse = ""
            userVM.motDePasseConfirm = ""
            isAuthenticated = true
            
            print("Connexion réussie avec token: \(token.prefix(20))...")
            
        } catch URLError.userAuthenticationRequired {
            errorMessage = "Email ou mot de passe incorrect"
            print("Auth échouée")
        } catch {
            errorMessage = "Erreur de connexion. Vérifiez votre connexion."
            print("Erreur: \(error)")
        }
 
    }
    
    // MARK: - Inscription utilisateur
    // Crée un nouveau compte utilisateur avec validation des champs.
    // Redirige vers l'écran de connexion en cas de succès.
    
    func signUp() async {
        guard !userVM.email.isEmpty, !userVM.motDePasse.isEmpty, !userVM.name.isEmpty else {
            errorMessage = "Tous les champs doivent être remplis"
            return
        }
        guard userVM.email.contains("@") && userVM.email.contains(".") else {
            errorMessage = "Email invalide"
            return
        }
        guard userVM.motDePasse.count >= 8 else {
            errorMessage = "Le mot de passe doit contenir au moins 8 caractères"
            return
        }
        
        guard userVM.motDePasse == userVM.motDePasseConfirm, !userVM.motDePasseConfirm.isEmpty else {
            errorMessage = "Les mots de passe ne sont pas identiques"
            return
        }
        
        isLoading = true
           defer { isLoading = false }
        errorMessage = nil
        
        do {
            // Création du user
            
//            func signUp(name: String, email: String, password : String, telephone: String)
            let user = try await userService.signUp(
                name: userVM.name,
                email: userVM.email,
                password: userVM.motDePasse,
                telephone : userVM.telephone
            )
            
            print("Inscription réussie pour: \(user.name)")
            
            // Login automatique
            let token = try await userService.login(email: userVM.email, motDePasse: userVM.motDePasse)
            authToken = token
            UserDefaults.standard.set(token, forKey: tokenKey)
            
            // Charger le profil
            await loadUserProfile()
            
            // Vérifier première connexion
//            checkFirstConnection()
//            showLogin = false
//            showSignUp = false
            
            // Réinitialiser le mot de passe
            userVM.motDePasse = ""
            userVM.motDePasseConfirm = ""
            errorMessage = nil
            
        } catch {
            errorMessage = "Erreur lors de l'inscription. Email peut-être déjà utilisé."
            print("Erreur d'inscription: \(error)")
        }
    }
    
    // MARK: - Chargement du profil utilisateur
    /// Charge le profil utilisateur à partir du token JWT stocké.
    /// Si le token est invalide ou expiré, l'utilisateur est déconnecté.
   
    @MainActor
    func loadUserProfile() async {
        guard let token = authToken else {
            isAuthenticated = false
            return
        }
        isLoading = true
        
        do {
            currentUser = try await userService.getProfile(token: token)
            isAuthenticated = true
//            showLogin = false
//            showSignUp = false
            print("Profil chargé: \(currentUser?.name ?? "Unknown")")
        } catch {
            // Token invalide ou expiré
            print("Token invalide ou expiré")
            logout()
        }

        isLoading = false
    }
    
    // MARK: - Déconnexion utilisateur
    /// Supprime le token et réinitialise l’état d’authentification.
    @MainActor
    func logout() {
        // Clear le token
        authToken = nil
        currentUser = nil
        isAuthenticated = false
        UserDefaults.standard.removeObject(forKey: tokenKey)
        
        // Réinitialise les champs
        userVM.email = ""
        userVM.motDePasse = ""
        userVM.motDePasseConfirm = ""
        userVM.name = ""
        errorMessage = nil
        
        // Retour à la landing page
        showLogin = true
//        showSignUp = false
        
        print(" Déconnexion réussie")
    }
    
    // MARK: - Réinitialisation des erreurs
    /// Supprime le message d’erreur affiché.
    func clearError() {
        errorMessage = nil
    }
    
}
