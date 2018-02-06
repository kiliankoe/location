class Location < Formula
    desc "cli to get your device's physical location and output it as json."
    homepage "https://github.com/kiliankoe/location"
    url "https://github.com/kiliankoe/location/archive/0.1.0.tar.gz"
    sha256 "abb93d65f5fa28cb73c1348b2c08eb047462e0a2d55993c38a2ed5fe3eab624e"
    head "https://github.com/kiliankoe/location.git"

    depends_on :xcode

    def install
        build_path = "#{buildpath}/.build/release/location"
        ohai "Building location"
        system("swift build --disable-sandbox -c release --static-swift-stdlib")
        bin.install build_path
    end
end
