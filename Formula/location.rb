class Location < Formula
    desc "cli to get your device's physical location and output it as json."
    homepage "https://github.com/kiliankoe/location"
    url "https://github.com/kiliankoe/location/archive/0.2.0.tar.gz"
    sha256 "209eaa85ef9da3e465f20b8f5a9ca1a63b3f9ac34cd43896c2f22967195ea612"
    head "https://github.com/kiliankoe/location.git"

    depends_on :xcode

    def install
        build_path = "#{buildpath}/.build/release/location"
        ohai "Building location"
        system("swift build --disable-sandbox -c release --static-swift-stdlib")
        bin.install build_path
    end

    bottle do
        sha256 "4468528b4709c74f73665d8d68d3c5f3aed1e1e72e15f784254d8cd8be29f42a" => :high_sierra
    end
end
