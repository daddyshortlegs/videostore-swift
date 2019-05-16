public class Customer {
    public init(name: String) {
        self.name = name
    }
    
    public func addRental(rental: Rental) {
        rentals.append(rental)
    }
    
    public func getName() -> String {
        return name
    }
    
    public func statement() -> String {
        var totalAmount: Double = 0
        var frequentRenterPoints: Int = 0;
        
        var result = "Rental Record for " + getName() + "\n";
    
        var index = 0
        while index < rentals.count {
            var thisAmount: Double = 0;
            let each = rentals[index]
    
            // determines the amount for each line
            switch each.movie.getPriceCode() {
                case Movie.REGULAR:
                    thisAmount += 2;
                    if (each.daysRented > 2) {
                        thisAmount += Double(each.daysRented - 2) * 1.5
                    }
                case Movie.NEW_RELEASE:
                    thisAmount += Double(each.daysRented) * 3
                case Movie.CHILDRENS:
                    thisAmount += 1.5
                    if (each.daysRented > 3) {
                        thisAmount += Double(each.daysRented - 3) * 1.5
                    }
                default:
                    break
            }
    
            frequentRenterPoints+=1;
    
            if each.movie.getPriceCode() == Movie.NEW_RELEASE
                && each.daysRented > 1 {
                frequentRenterPoints+=1;
            }
    
            result += "\t" + each.movie.getTitle() + "\t"
                + String(thisAmount) + "\n";
            totalAmount += thisAmount;
            index+=1
        }
    
        result += "You owed " + String(totalAmount) + "\n";
        result += "You earned " + String(frequentRenterPoints) + " frequent renter points\n";
        
        return result;
    }
    
    
    private var name: String
    private var rentals: [Rental] = []
}
