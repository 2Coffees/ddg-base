import Foundation

final class Game {
    var playerCount: Int? 
    var bossCardCount: Int?
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
                    bossCardCount = 5
                } else {
                    bossCardCount = 3
                }
            }
        }

        if !userIsBoss {
            if let input = readLine()?.lowercased() {
                if input == "y" {
                    userIsBoss = true
                } else if input == "n" {
                    userIsBoss = false
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
        for i in 0..<playerCount!-1 {
            playerNames.append("bot" + String(i + 1))
        }

        for i in 0..<playerCount! {
            let newPlayer = Player(name: playerNames[i], deck: []) 
            players.append(newPlayer)
        }

        deck.shuffle() // first shuffle em

        var playerIndex = 0

        // distribute cards to player decks except boss cards

        while deck.count > bossCardCount! {
            if let card = deck.popLast() {
                players[playerIndex].deck.append(card)
            }
            playerIndex += 1
        }

        // add the rest of the cards to the boss.
        var bossIndex: Int;
        if userIsBoss {
            bossIndex = 0
        } else {
            bossIndex = Int.random(in:1...players.count - 1) 
        }

        for cardInd in 0..<deck.count {
            players[bossIndex].deck.append(deck[cardInd])
        }

        // print final summary of cards

        for player in players {
            let formatted = "\(player.name): \(player.deck)"
            print(formatted)
        }

    }
}