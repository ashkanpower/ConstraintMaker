Pod::Spec.new do |spec|

  spec.name         = "ConstraintMaker"
  spec.version      = "0.0.1"
  spec.summary      = "A readable easy to use constraint library."

  spec.description  = <<-DESC

Creating constraints in code is a hard and repeatable work.
Other libraries also have messy syntax.
We designed this library so it would be easy to use and have beautiful syntax.
                   DESC

  spec.homepage     = "https://github.com/ashkanpower/ConstraintMaker"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "ashkan" => "ashkanpower@gmail.com" }

  spec.ios.deployment_target = "9.0"
  spec.swift_version = "4.2"

  spec.source        = { :git => "https://github.com/ashkanpower/ConstraintMaker.git", :tag => "#{spec.version}" }
  spec.source_files  = "ConstraintMaker/**/*.{h,m,swift}"

end
