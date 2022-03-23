

class Dragon: Enemy {
    var WingSpan = 2
    
    func talk(speech: String) {
        print("Says: \(speech)")
    }
    
    override func move() {
        print("Fly forwards")
    }
    
    
    override func attack() {
        super.attack()
        print("Spits fire, does 10 damage")
    }
}
