public class Customer {
  
    public var name: String
    public var rentals: [Movie] = []
  
    public init(name: String) {
        self.name = name
    }
    
    public func addRental(rental: Movie) {
        rentals.append(rental)
    }
  
}
