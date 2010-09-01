# Version number for this release
VERSION_NUMBER = "0.0.5-SNAPSHOT"
# Group identifier for your projects
GROUP = "name.webdizz.jstyler"
COPYRIGHT = "Izzet Mustafa"

desc "The jStyler project - plug-in for BuildR to keep your code styled"
define "jstyler" do

  project.version = VERSION_NUMBER
  project.group = GROUP
  manifest["Implementation-Vendor"] = COPYRIGHT

  define "formatter" do
    compile.with # Add classpath dependencies
    resources
    test.compile.with # Add classpath dependencies
    package(:jar)
  end

end
