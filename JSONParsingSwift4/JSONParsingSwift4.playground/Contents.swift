import Foundation
import PlaygroundSupport

struct HelloMessage: Codable {
    let success: Bool
    let message: String
}

fileprivate extension HelloMessage {
    static func parse(data: Data?) -> HelloMessage? {
        guard let data = data else {
            return nil
        }
        return try? JSONDecoder().decode(HelloMessage.self, from: data)
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
        
        completionBlock(HelloMessage.parse(data: data))
        }.resume()
}

PlaygroundPage.current.needsIndefiniteExecution = true
getData() { (helloMessage) in
    print(helloMessage ?? "error")
}
