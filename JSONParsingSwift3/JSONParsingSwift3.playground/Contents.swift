import Foundation
import PlaygroundSupport

struct HelloMessage {
    let success: Bool?
    let message: String?

    init?(success: Bool?, message: String?) {
        if success == nil && message == nil {
            return nil
        }
        self.success = success
        self.message = message
    }
}

fileprivate extension HelloMessage {
    static func parse(json: [String: AnyObject]?) -> HelloMessage? {
        guard let json = json else {
            return nil
        }
        let success = json["success"] as? Bool
        let message = json["message"] as? String
        return HelloMessage(success: success, message: message)
    }
}

func getData(completionBlock: @escaping (HelloMessage?) -> Void) {
    let urlString = "http://hidden-garden-53580.herokuapp.com"
    guard let url = URL(string: urlString) else {
        return
    }
    let session = URLSession.shared
    session.dataTask(with: url) { (data, response, error) in
        if error != nil {
            print(error!)
            return
        }

        guard let data = data else {
            return
        }
        guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) else {
            print("invalid json")
            return
        }
        completionBlock(HelloMessage.parse(json: json as? [String: AnyObject]))
    }.resume()
}

PlaygroundPage.current.needsIndefiniteExecution = true
URLCache.shared = URLCache(memoryCapacity: 0, diskCapacity: 0, diskPath: nil)
getData() { (helloMessage) in
    print(helloMessage ?? "error")
}
