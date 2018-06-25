import Foundation
import Utility

let argParser = ArgumentParser(commandName: "whereami", usage: "", overview: "Output your current location")
let follow = argParser.add(option: "--follow", shortName: "-f", kind: Bool.self, usage: "Keep polling for new location updates")
let address = argParser.add(option: "--address", shortName: "-a", kind: Bool.self, usage: "Lookup reverse geocoded address")

let args = Array(CommandLine.arguments.dropFirst())
let argResult = try argParser.parse(args)

let delegate = LocationDelegate(follow: argResult.get(follow) ?? false,
                                address: argResult.get(address) ?? false)
delegate.start()

RunLoop.main.run()
