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

let data = jsonString.dataUsingEncoding(NSUTF8StringEncoding)

do {
    // Parse JSON
    if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? [String: AnyObject] {
        var labels = [String]()
        if let locations = json["locations"] as? [[String: AnyObject]] {
            for location in locations {
                if let label = location["label"] as? String {
                    labels.append(label)
                }
            }

            do {
                // Serialize instance
                let json2 = try NSJSONSerialization.dataWithJSONObject(locations, options: .PrettyPrinted)
                let jsonString2 = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print("jsonString2=\(jsonString2)")
                assert(jsonString == jsonString2)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
        }
        print("labels=\(labels)")
    }
} catch let error as NSError {
    print(error.localizedDescription)
}
