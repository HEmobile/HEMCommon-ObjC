Pod::Spec.new do |s|

  s.name         = "HEMCommon-ObjC"
  s.version      = "0.0.1"
  s.summary      = "A short description of HEMCommon-ObjC."
  s.homepage     = "https://github.com/HEmobile/HEMCommon-ObjC"
  s.license      = "MIT"
  s.authors      = { "Marcilio Junior" => "marciliojrs@gmail.com" }  
  s.source       = { :git => "https://github.com/HEmobile/HEMCommon-ObjC.git", :branch => "develop" }
  s.requires_arc = true

  s.source_files  = "HEMCommon-ObjC/Controller/*.{h,m}", "HEMCommon-ObjC/Category/*.{h,m}", "HEMCommon-ObjC/Network/*.{h,m}"
  s.dependency "AFNetworking"

end
