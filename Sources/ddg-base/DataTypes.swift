import Foundation

enum Suit: String, CaseIterable {
    case spades = "♠️", hearts = "♥️", diamonds = "♦️", clubs = "♣️"
}

enum Rank: Int, CaseIterable {
    case two = 2, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king, ace
    
    var displayValue: String {
        switch self {
        case .jack: return "J"
        case .queen: return "Q"
        case .king: return "K"
        case .ace: return "A"
        default: return "\(self.rawValue)"
        }
    }
}

enum Card: CustomStringConvertible {
    case standard(rank: Rank, suit: Suit)
    case jokerBig
    case jokerSmall
    
    // Conforming to CustomStringConvertible makes printing easy
    var description: String {
        switch self {
        case .standard(let rank, let suit):
            return "\(rank.displayValue)\(suit.rawValue)"
        case .jokerBig:
            return "🃏Big Joker"
            case .jokerSmall: return "🃏 Small Joker"
        }
    }
}