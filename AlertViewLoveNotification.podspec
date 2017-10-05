Pod::Spec.new do |s|
s.name             = "AlertViewLoveNotification"
s.version          = "1.4"
s.summary          = "AlertViewLoveNotification"
s.description      = "A simple and attractive AlertView to ask permission to your users for Push Notification."
s.homepage         = "https://github.com/PhilippeBoisney/AlertViewLoveNotification"
s.license          = 'MIT'
s.author           = { "PhilippeBoisney" => "phil.boisney@gmail.com" }
s.source           = { :git => "https://github.com/PhilippeBoisney/AlertViewLoveNotification.git", :tag => s.version }
s.platform     = :ios, '8.0'
s.requires_arc = true

# If more than one source file: https://guides.cocoapods.org/syntax/podspec.html#source_files
s.source_files = 'Pod/Classes/**/*'

end
