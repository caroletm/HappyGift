//
//  MusicManagerModelView.swift
//  Aura
//
//  Created by alize suchon on 02/10/2025.
//

import AVFoundation

class MusicManager {
    
    static let shared = MusicManager()
      private var player: AVAudioPlayer?

      func playLocalSound(named fileName: String, loops: Int = -1) {
          guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else {
              print("ERROR: fichier MP3 non trouvé.")
              return
          }
          do {
              player?.stop()
              player = try AVAudioPlayer(contentsOf: url)
              player?.numberOfLoops = loops
              player?.prepareToPlay()
              player?.play()
          } catch {
              print("ERROR: \(error.localizedDescription)")
          }
      }

      func pause() { player?.pause() }
      func stop() { player?.stop(); player = nil }
      func isPlaying() -> Bool { player?.isPlaying ?? false }
  }

