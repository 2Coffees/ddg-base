import Foundation

final class Game {
    var playerCount = 3
    var bossCardCount = 3
    var deck: [Card] = []
    var players: [Player] = []
    var userIsBoss = true

    func startGame() {
        print("Wowie! Welcome to DDG!")
        createDeck()

        // check how many players
        if playerCount == nil {
            print("How many players shall play?")
            if let input = readLine(), let p = Int(input) {
                playerCount = p
                if p > 3 {
                    bossCards = 5
                }
            }
        }

        if !userIsBoss {
            if let input = readLine()?.lowercased() {
                if input == "y" {
                    userIsBoss == true
                } else if input == "n" {
                    userIsBoss == false
                } else {
                    print("Type something else")
                }
            }
        }

        print("Now let's deal!")
        createPlayerDecks()
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

        var playerNames = ["user"]
        for i in 0..<playerCount-1 {
            playerNames.append("bot" + String(i + 1))
        }

        for i in 0..<playerCount {
            let newPlayer = Player(name: playerNames[i], deck: []) 
            players.append(newPlayer)
        }

        deck.shuffle() // first shuffle em

        var playerIndex = 0

        for cardIndex in 0..<deck.count - bossCardCount {
            players[playerIndex].deck.append(deck[cardIndex])
            deck.removeFirst()
            if playerIndex == players.count - 1 {
                playerIndex = 0
            } else {
                playerIndex += 1
            }
        }
        for card in deck {
            
        }

    }
}