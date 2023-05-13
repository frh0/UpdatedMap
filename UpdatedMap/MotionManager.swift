//
//  File.swift
//  UpdatedMap
//
//  Created by frh alshaalan on 13/05/2023.
//

import Foundation
import CoreMotion

class MotionManager: ObservableObject {
     let motionManager = CMMotionManager()
    
    @Published var isMoving: Bool = false
    
    init() {
        motionManager.accelerometerUpdateInterval = 0.2
        motionManager.startAccelerometerUpdates(to: .main) { (data, error) in
            guard let data = data else { return }
            if abs(data.acceleration.x) > 0.1 || abs(data.acceleration.y) > 0.1 {
                self.isMoving = true
            } else {
                self.isMoving = false
            }
            
        }
    }
}
