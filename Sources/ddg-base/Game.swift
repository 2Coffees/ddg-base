import Foundation

final class Game {
    var players = 3
    var bossCards = 3
    var deck: [Card] = []

    func startGame() {
        print("Wowie! Welcome to DDG!")
        createDeck()

        // check how many players
        if players == nil {
            print("How many players shall play?")
            if let input = readLine(), let p = Int(input) {
                players = p
                if p > 3 {
                    bossCards = 5
                }
            }
        }

        print("Now let's deal!")

    }

    func createDeck() {
        for suit in Suit.allCases {
            for rank in Rank.allCases {
                deck.append(.standard(rank: rank, suit: suit))
            }
        }

        // gotta remember to add the jokers
        deck.append(.jokerBig)
        deck.append(.jokerSmall)
    }

    func createPlayerDecks() {
        
    }
}