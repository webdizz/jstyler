# Version number for this release
VERSION_NUMBER = "0.0.5-SNAPSHOT"
# Group identifier for your projects
GROUP = "name.webdizz.jstyler"
COPYRIGHT = "Izzet Mustafa"

COMPILE_DEPS = [
	artifact('org.eclipse.osgi:osgi:jar:3.6.0.v20100517').from('lib/org.eclipse.osgi_3.6.0.v20100517.jar'),
	artifact('org.eclipse.equinox:equinox.app:jar:1.3.0.v20100512').from('lib/org.eclipse.equinox.app_1.3.0.v20100512.jar'),
	artifact('org.eclipse.jdt:jdt.core:jar:3.6.0.v_A58').from('lib/org.eclipse.jdt.core_3.6.0.v_A58.jar'),
	artifact('org.eclipse.jface:jface.text:jar:3.6.0.v20100526-0800').from('lib/org.eclipse.jface.text_3.6.0.v20100526-0800.jar'),
	artifact('org.eclipse.text:text:jar:3.5.0.v20100601-1300').from('lib/org.eclipse.text_3.5.0.v20100601-1300.jar'),
	artifact('org.eclipse.equinox:equinox.common:jar:3.6.0.v20100503').from('lib/org.eclipse.equinox.common_3.6.0.v20100503.jar'),
	artifact('org.eclipse.core:core.resources:jar:3.6.0.v20100526-0737').from('lib/org.eclipse.core.resources_3.6.0.v20100526-0737.jar'),
	artifact('org.eclipse.core:core.jobs:jar:3.5.0.v20100515').from('lib/org.eclipse.core.jobs_3.5.0.v20100515.jar'),
	artifact('org.eclipse.core:core.runtime:jar:3.6.0.v20100505').from('lib/org.eclipse.core.runtime_3.6.0.v20100505.jar'),
	artifact('org.eclipse.core:core.contenttype:jar:3.4.100.v20100505-1235').from('lib/org.eclipse.core.contenttype_3.4.100.v20100505-1235.jar'),
]

desc "The jStyler project - plug-in for BuildR to keep your code styled"
define "jstyler" do

  project.version = VERSION_NUMBER
  project.group = GROUP
  manifest["Implementation-Vendor"] = COPYRIGHT
  manifest["Main-Class"] = "name.webdizz.styler.StylerRunner"

  define "formatter" do
    compile.with COMPILE_DEPS
    test.compile.with COMPILE_DEPS
    pack = package(:jar){|project|
	puts 'hello'
    }
    pack.merge(COMPILE_DEPS).exclude('*.profile', '*.list', '*.jar', '*.html', '*.xml', 'plugin.properties', 'systembundle.properties')
  end

end
