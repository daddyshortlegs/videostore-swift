public class Rental {
    public init(movie: Movie, daysRented: Int) {
        self.movie = movie
        self.daysRented = daysRented
    }
    
    public func getDaysRented() -> Int {
        return daysRented
    }
    
    public func getMovie() -> Movie {
        return movie
    }
    
    private var movie: Movie
    private var daysRented: Int
}

