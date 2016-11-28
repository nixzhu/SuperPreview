Pod::Spec.new do |s|

  s.name        = "SuperPreview"
  s.version     = "0.5.1"
  s.summary     = "SuperPreview for Image Preview."

  s.description = <<-DESC
                   SuperPreview make show image preview easier, even for masked image.
                   DESC

  s.homepage    = "https://github.com/nixzhu/SuperPreview"

  s.license     = { :type => "MIT", :file => "LICENSE" }

  s.authors           = { "nixzhu" => "zhuhongxu@gmail.com" }
  s.social_media_url  = "https://twitter.com/nixzhu"

  s.ios.deployment_target   = "9.0"

  s.source          = { :git => "https://github.com/nixzhu/SuperPreview.git", :tag => s.version }
  s.source_files    = "SuperPreview/*.swift"
  s.requires_arc    = true

end
