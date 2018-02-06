import Foundation
import Utility

let argParser = ArgumentParser(commandName: "location", usage: "", overview: "Output your current location")
let follow = argParser.add(option: "--follow", shortName: "-f", kind: Bool.self, usage: "Keep polling for new location updates")

let args = Array(CommandLine.arguments.dropFirst())
let argResult = try argParser.parse(args)

let delegate = LocationDelegate(follow: argResult.get(follow) ?? false)
delegate.start()

RunLoop.main.run()
