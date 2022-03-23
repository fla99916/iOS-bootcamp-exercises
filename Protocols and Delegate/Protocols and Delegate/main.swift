//
//  main.swift
//  Protocols and Delegate
//
//  Created by Yelim Kim on 28/12/21.
//

protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    func assessSituation() {
        print("Can you tell me what happend?")
    }
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The paramedic does chest compressions, 30 per second.")
    }
    
    
}


class Doctor: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The paramedic does chest compressions, 30 per second.")
    }
    
    func useStetheScope() {
        print("Listening for hear sounds")
        
    }
    
}

class Surgeon: Doctor {
    override func performCPR() {
        super.performCPR()
        print("Sings staying alive by the BeeGees")
        
    }
    
    func useElectricDril() {
        print("Drrrrr.....")
    }

}

let emilio = EmergencyCallHandler()
// let pete = Paramedic(handler: emilio)
let angela = Surgeon(handler: emilio)
emilio.assessSituation()
emilio.medicalEmergency()

