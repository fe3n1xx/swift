let letters = [" ": 0, "a": 1, "b": 2, "c": 3, "d": 4, "e": 5, "f": 6, "g": 7, "h": 8, "i": 9, "j": 10, "k": 11, "l": 12, "m": 13, "n": 14, "o": 15, "p": 16, "q": 17, "r": 18, "s": 19, "t": 20, "u": 21, "v": 22, "w": 23, "x": 24, "y": 25, "z": 26]

let characterForValue = Dictionary(
    uniqueKeysWithValues: letters.map { ($0.value, $0.key) }
)

print("What cipher do you want to use (0–26)?")
if let userInput = readLine(), let shift = Int(userInput), (0...26).contains(shift) {
    print("What text would you like to encrypt?")
    if let toEncrypt = readLine() {
        let result = toEncrypt.lowercased().compactMap { character -> String? in
            guard let value = letters[String(character)] else { return nil }
            let shiftedValue = (value + shift) % 27
            return characterForValue[shiftedValue]
        }

        print(result.joined())
    }
} else {
    print("Please enter a whole number from 0 to 26.")
}