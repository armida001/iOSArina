import UIKit

protocol SkirtProtocol {
    var name: String { get }
    var isMini: Bool { get set }
}

protocol TShirtProtocol {
    var name: String { get }
}

class BaseSkirtSew: SkirtProtocol {
    var name: String {
        "Базовая Юбка"
    }
    var isMini: Bool
    
    init(isMini: Bool) {
        self.isMini = isMini
    }
}

class BaseTShirtSew: TShirtProtocol {
    var name: String {
        "Базовая Футболка"
    }
}

class ModernSkirtSew: BaseSkirtSew {
    override var name: String {
        "Современная юбка с разрезом"
    }
}

class ModernTShirtSew: TShirtProtocol {
    var name: String {
        "Рубашка"
    }
}

/// Abstract Factory
protocol AbstractFabric {
    func createTShirt() -> TShirtProtocol
    func createSkirt() -> SkirtProtocol
}


final class SewFabric: AbstractFabric {
    func createTShirt() -> TShirtProtocol {
        BaseTShirtSew()
    }
    
    func createSkirt() -> SkirtProtocol {
        BaseSkirtSew(isMini: false)
    }
    
    static let shared = SewFabric()
}

final class ModernSewFabric: AbstractFabric {
    func createTShirt() -> TShirtProtocol {
        ModernTShirtSew()
    }
    
    func createSkirt() -> SkirtProtocol {
        ModernSkirtSew(isMini: true)
    }
    
    static let shared = ModernSewFabric()
}

/// Usage example
class Client {
    static func buyClothes(factory: AbstractFabric) {
        let skirt = factory.createSkirt()
        let tshirt = factory.createTShirt()

        print(skirt.name)
        print(tshirt.name)
    }
}

class AbstractFactoryConceptual {

    func testAbstractFactoryConceptual() {

        print("Client: Testing client code with the base factory type:")
        Client.buyClothes(factory: SewFabric())

        print("Client: Testing the same client code with modern factory type:")
        Client.buyClothes(factory: ModernSewFabric())
    }
}

AbstractFactoryConceptual().testAbstractFactoryConceptual()
