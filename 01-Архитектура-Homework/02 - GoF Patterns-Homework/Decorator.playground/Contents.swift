import UIKit

protocol SewProtocol {
    func print() -> String
}

class BaseSew: SewProtocol {
    func print() -> String {
        "Базовая Выкройка"
    }
}

class DecoratorSew: SewProtocol {
    private var component: SewProtocol
    
    init(_ component: SewProtocol) {
        self.component = component
    }
    
    func print() -> String {
        return self.component.print()
    }
}

class ModelingDecoratorSew: DecoratorSew {
    override func print() -> String {
        "\(super.print()) и Моделирование"
    }
}

class CombinationDecoratorSew: DecoratorSew {
    override func print() -> String {
        "\(super.print()) и Комбинирование с другими изделиями"
    }
}

class Client {
    static func whantClothes(component: SewProtocol) {
        print("Result: " + component.print())
    }
}

class DecoratorConceptual {
    
    func testDecoratorConceptual() {
        print("Client: Хочу заказать базовую выкройку")
        let simple = BaseSew()
        Client.whantClothes(component: simple)
        
        let decorator1 = ModelingDecoratorSew(simple)
        let decorator2 = CombinationDecoratorSew(decorator1)
        print("\nClient: Хм, хочу что-то поинтереснее")
        Client.whantClothes(component: decorator2)
    }
}

DecoratorConceptual().testDecoratorConceptual()
