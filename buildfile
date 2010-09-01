# Version number for this release
VERSION_NUMBER = "0.0.5-SNAPSHOT"
# Group identifier for your projects
GROUP = "name.webdizz.jstyler"
COPYRIGHT = "Izzet Mustafa"

COMPILE_DEPS = [
	artifact('org.eclipse.osgi:osgi:jar:3.6.0.v20100517').from('lib/org.eclipse.osgi_3.6.0.v20100517.jar'),
	artifact('org.eclipse.equinox:equinox.app:jar:1.3.0.v20100512').from('lib/org.eclipse.equinox.app_1.3.0.v20100512.jar'),
	artifact('org.eclipse.jdt:jdt.core:jar:3.6.0.v_A58').from('lib/org.eclipse.jdt.core_3.6.0.v_A58.jar')
]

desc "The jStyler project - plug-in for BuildR to keep your code styled"
define "jstyler" do

  project.version = VERSION_NUMBER
  project.group = GROUP
  manifest["Implementation-Vendor"] = COPYRIGHT

  define "formatter" do
    compile.with COMPILE_DEPS
    test.compile.with COMPILE_DEPS
    package(:jar)
  end

end
