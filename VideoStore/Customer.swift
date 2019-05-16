public class Customer {
  
    public var name: String
    public var rentals: [Rental] = []
  
    public init(name: String) {
        self.name = name
    }
    
    public func addRental(rental: Rental) {
        rentals.append(rental)
    }
  
}
