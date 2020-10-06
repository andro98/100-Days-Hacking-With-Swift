import UIKit

extension String{
    subscript(i: Int) -> String{
        return String(self[index(startIndex, offsetBy: i)])
    }
    func deletePrefix(_ prefix: String) -> String{
        guard self.hasPrefix(prefix) else {return self}
        return String(self.dropFirst(prefix.count))
    }
    func deleteSuffix(_ suffix: String) -> String{
        guard self.hasSuffix(suffix) else {return self}
        return String(self.dropLast(suffix.count))
    }
    
    /*var capitalizedFirst:String{
        guard let firstLetter = self.first else {return ""}
        return firstLetter.capitalized + self.dropFirst()
    }*/
}

var name = "Andrew"
print(name[2])
print(name.capitalized)

let password = "12345"
password.hasPrefix("123")
password.hasSuffix("456")

let input = "Swift is like objective-c without the C"
input.contains("Swift")

let string = "This i a test string"

let attributes: [NSAttributedStringKey: Any] = [
    .foregroundColor: UIColor.white,
    .backgroundColor: UIColor.red,
    .font: UIFont.boldSystemFont(ofSize: 36)
]
let attributedString = NSAttributedString(string: string, attributes: attributes)

let attributedString2 = NSMutableAttributedString(string: string)
attributedString2.addAttribute(.font, value: UIFont.systemFont(ofSize: 40), range: NSRange(location: 4, length: 4))
