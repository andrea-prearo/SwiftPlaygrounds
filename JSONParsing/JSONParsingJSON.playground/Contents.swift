//: # JSON Parsing
//:
//: JSON Encoding/Decoding Example

import Foundation

let jsonString = "{" +
        "\"locations\": [{" +
            "\"label\": \"Home\"," +
            "\"data\": {" +
                "\"address\": \"6925 Felicity Coves\"," +
                "\"city\": \"East Davin\"," +
                "\"state\": \"Washington\"," +
                "\"country\": \"USA\"," +
                "\"zipCode\": \"22998-1456\"" +
            "}" +
        "}," +
        "{" +
            "\"label\": \"Work\"," +
            "\"data\": {" +
                "\"address\": \"0506 Gretchen River\"," +
                "\"city\": \"Huntington Beach\"," +
                "\"state\": \"Connecticut\"," +
                "\"country\": \"USA\"," +
                "\"zipCode\": \"61182-9561\"" +
            "}" +
        "}]" +
    "}"

let data = jsonString.data(using: String.Encoding.utf8)

do {
    // Parse JSON
    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: AnyObject] {
        var labels = [String]()
        if let locations = json["locations"] as? [[String: AnyObject]] {
            for location in locations {
                if let label = location["label"] as? String {
                    labels.append(label)
                }
            }

            do {
                // Serialize instance
                let json2 = try JSONSerialization.data(withJSONObject: locations, options: .prettyPrinted)
                let jsonString2 = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print("jsonString2=\(jsonString2 ?? "???")")
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
        }
        print("labels=\(labels)")
    }
} catch let error as NSError {
    print(error.localizedDescription)
}
