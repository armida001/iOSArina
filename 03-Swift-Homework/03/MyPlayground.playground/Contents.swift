import UIKit

/**
1. Создать менеджер и протокол для менеджера, которые будут принимать универсальный тип

Ограничить тип протоколом Profile, который будет вызывать метод отображающий в консоль имя и фамилию (реализовать значения через расширения)

Ограничить тип протоколом Adress, который будет отображать в консоль улицу и город

 */

protocol ManagerProtocol {
    associatedtype ManagerProtocolType
}

class Manager: ManagerProtocol {
    typealias ManagerProtocolType = Person
    
    func print(person: ManagerProtocolType) {
        person.showFIO()
        person.showAdress()
    }
}

protocol Profile {
    var name: String { get set }
    var fam: String { get set }
    func showFIO()
}

extension Profile {
    func showFIO() {
        print(name + " " + fam)
    }
}

protocol Adress {
    var street: String { get set }
    var city: String { get set }
    func showAdress()
}

struct Person: Profile, Adress {
    var name: String
    var fam: String
    var street: String
    var city: String
    
    func showAdress() {
        print("ул. " + street + ", г." + city)
    }
}

var manager = Manager()
manager.print(person: Person.init(name: "Иван", fam: "Иванов", street: "Попова", city: "Иваново"))

/**
 2. Создать класс, который будет иметь опциональное свойство и его тип ввиде протокола.

 Протокол должен иметь ассоциативный тип и метод, вызывающий/принимающий его



 Формат:
 protocol RequestManager {
     associatedtype Result

     func get() -> Result
 }

 class NetworkManager {
     var requestManager: RequestManager?

     func getAllMovies() {
         requestManager.get()
     }
 }
 */

public protocol RequestManager: AnyObject{
    associatedtype Result
    var path: Result? { get set }
}

class ResultStruct: RequestManager  {
    var path: String?
    
    typealias Result = String
}

public class NetworkManager {
    var requestManager: ResultStruct?
    
    func getAllMovies() {
        requestManager?.path
    }
}

