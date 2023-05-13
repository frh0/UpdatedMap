//
//  ContentView.swift
//  UpdatedMap
//
//  Created by frh alshaalan on 13/05/2023.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @ObservedObject var motionManager = MotionManager()

    var body: some View {
        MapView()
            .opacity(motionManager.isMoving ? 0.5 : 1.0)

    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
