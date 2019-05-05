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
            var each = rentals[index]
    
            // determines the amount for each line
            switch each.getMovie().getPriceCode() {
                case Movie.REGULAR:
                    thisAmount += 2;
                    if (each.getDaysRented() > 2) {
                        thisAmount += Double(each.getDaysRented() - 2) * 1.5
                    }
                case Movie.NEW_RELEASE:
                    thisAmount += Double(each.getDaysRented()) * 3
                case Movie.CHILDRENS:
                    thisAmount += 1.5
                    if (each.getDaysRented() > 3) {
                        thisAmount += Double(each.getDaysRented() - 3) * 1.5
                    }
                default:
                    break
            }
    
            frequentRenterPoints+=1;
    
            if each.getMovie().getPriceCode() == Movie.NEW_RELEASE
                && each.getDaysRented() > 1 {
                frequentRenterPoints+=1;
            }
    
            result += "\t" + each.getMovie().getTitle() + "\t"
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
