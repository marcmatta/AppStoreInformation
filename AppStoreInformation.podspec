Pod::Spec.new do |s|

s.name         = "AppStoreInformation"
s.version      = "0.0.4"
s.summary      = "Fetches AppStore web page information of the iOS application."
s.homepage     = "https://github.com/marcmatta/AppStoreInformation.git"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author             = "marc.matta"
s.platform     = :ios
s.ios.deployment_target = '8.0'
s.source       = { :git => "https://github.com/marcmatta/AppStoreInformation.git", :tag => s.version }
s.source_files = "AppStoreInformation", "AppStoreInformation/Classes/**/*.swift"
s.framework  = "Foundation"
s.requires_arc = true
s.swift_version = "4.1"

end
