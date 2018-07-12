Pod::Spec.new do |s|

s.name         = "AppStoreInformation"
s.version      = "0.0.1"
s.summary      = "Fetches AppStore web page information of the iOS application."
s.homepage     = "https://github.com/marcmatta/AppStoreInformation.git"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author             = "marc.matta"
s.screenshots = "https://raw.githubusercontent.com/marcmatta/AppStoreInformation/master/1.png"
s.platform     = :ios
s.ios.deployment_target = '8.0'
s.source       = { :git => "https://github.com/marcmatta/AppStoreInformation.git", :tag => s.version.to_s }
s.source_files = 'AppStoreInformation/Classes/**/*'
s.framework  = "Foundation"
s.swift_version = '4.1'
end
