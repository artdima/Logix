//
//  PeerConnection.swift
//  MultiConnect
//
//  Created by michal on 29/11/2020.
//

import Foundation
import Network

class Connection {

    let connection: NWConnection
    private var buffer = Data()
    
    struct Packet {
        let code: UInt8
        let body: Data
    }
    
    enum Event {
        case packet(Packet)
        case error(Error)
        case completed
    }

    // outgoing connection
    init(endpoint: NWEndpoint) {
        log("PeerConnection outgoing endpoint: \(endpoint)")
        let tcpOptions = NWProtocolTCP.Options()
        tcpOptions.enableKeepalive = true
        tcpOptions.keepaliveIdle = 2

        let parameters = NWParameters(tls: nil, tcp: tcpOptions)
        parameters.includePeerToPeer = true
        connection = NWConnection(to: endpoint, using: parameters)
        start()
    }

    // incoming connection
    init(connection: NWConnection) {
        log("PeerConnection incoming connection: \(connection)")
        self.connection = connection
        start()
    }

    func start() {
        connection.stateUpdateHandler = { newState in
            log("connection.stateUpdateHandler \(newState)")
            if case .ready = newState {
                self.receiveMessage()
            }
        }
        connection.start(queue: .main)
    }

    func send(_ message: String) {
        connection.send(content: message.data(using: .utf8), contentContext: .defaultMessage, isComplete: true, completion: .contentProcessed({ error in
            log("Connection send error: \(String(describing: error))")
        }))
    }

    private func receiveMessage() {
        connection.receive(minimumIncompleteLength: 1, maximumLength: 65535) { [weak self] data, _, isCompleted, error in
            guard let self = self else { return }
            if let data = data,
               let message = String(data: data, encoding: .utf8) {
                log("Connection receiveMessage message: \(message)")
            }
            self.receiveMessage()
            
//            if let data = data, !data.isEmpty {
//                self.process(data: data)
//            }
//            if isCompleted {
//                self.send(event: .completed)
//            } else if let error = error {
//                self.send(event: .error(error))
//            } else {
//                self.receiveMessage()
//            }
        }
    }
    
//    private func process(data freshData: Data) {
//        guard !freshData.isEmpty else { return }
//
//        var freshData = freshData
//        if buffer.isEmpty {
//            while let (packet, size) = decodePacket(from: freshData) {
//                send(event: .packet(packet))
//                if size == freshData.count {
//                    return // No no processing needed
//                }
//                freshData.removeFirst(size)
//            }
//        }
//
//        if !freshData.isEmpty {
//            buffer.append(freshData)
//            while let (packet, size) = decodePacket(from: buffer) {
//                send(event: .packet(packet))
//                buffer.removeFirst(size)
//            }
//            if buffer.count == 0 {
//                buffer = Data()
//            }
//        }
//    }
//    
//    private func decodePacket(from data: Data) -> (Packet, Int)? {
//        do {
//            return try RemoteLogger.decode(buffer: data)
//        } catch {
//            if case .notEnoughData? = error as? PacketParsingError {
//                return nil
//            }
//            os_log("Unexpected error when processing a packet: %{public}@", log: log, type: .error, "\(error)")
//            return nil
//        }
//    }
//    
//    private func send(event: Event) {
//        // If it's a response for a message, pass it to the registered handler.
//        // Otherwise, send it to the delegate as a new message.
//        if case .packet(let packet) = event,
//           packet.code == RemoteLogger.PacketCode.message.rawValue,
//           let header = Message.Header(packet.body),
//           header.options.contains(.response),
//           let handler = handlers.removeValue(forKey: header.id) {
//            handler(try? Message.decode(packet.body).data, nil)
//        } else {
//            DispatchQueue.main.async {
//                self.delegate?.connection(self, didReceiveEvent: event)
//            }
//        }
//    }
}
