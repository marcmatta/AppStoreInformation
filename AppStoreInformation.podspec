Pod::Spec.new do |s|

  s.name         = "AppStoreInformation"
  s.version      = "0.0.1"
  s.summary      = "Fetches AppStore web page information of the iOS application."
  s.homepage     = "https://github.com/marcmatta/AppStoreInformation.git"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "marc.matta" }
  s.social_media_url   = "http://www,linkedin.com/in/marcmatta"
  s.screenshots = "https://github.com/marcmatta/AppStoreInformation/blob/master/Whatsapp%20App%20Info.png"
  s.platform     = :ios
  s.ios.deployment_target = '8.0'

  s.source       = { :git => "https://github.com/marcmatta/AppStoreInformation.git", :tag => "#{s.version}" }

  s.source_files  = "AppStoreInformation", "AppStoreInformation/**/*.{swift}"

  s.framework  = "Foundation"

  s.requires_arc = true
end
