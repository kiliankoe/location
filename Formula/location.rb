class Location < Formula
    desc "cli to get your device's physical location and output it as json."
    homepage "https://github.com/kiliankoe/location"
    url "https://github.com/kiliankoe/location/archive/0.3.0.tar.gz"
    sha256 "86837503898d470a4e47b65116c4400e77f44dac58413cdcf352edea9df12810"
    head "https://github.com/kiliankoe/location.git"

    depends_on :xcode

    def install
        build_path = "#{buildpath}/.build/release/location"
        ohai "Building location"
        system("swift build --disable-sandbox -c release --static-swift-stdlib")
        bin.install build_path
    end
end
