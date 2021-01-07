Pod::Spec.new do |s|
s.name         = "Kusabi"
s.version      = "0.0.3"
s.summary      = "Kusabi is a HTTP networking library."
s.license      = { :type => 'MIT', :file => 'LICENSE' }
s.homepage     = "https://github.com/shu17712/Kusabi"
s.author       = { "shu17712" => "shu_teiei@outlook.jp" }
s.source       = { :git => "https://github.com/shu17712/Kusabi.git", :tag => "#{s.version}" }
s.platform     = :ios, "9.0"
s.requires_arc = true
s.source_files = 'Kusabi/*.{swift}'
# s.resources    = 'Kusabi/**/*.{xib,png}'
s.swift_version = "5.0"
end