/**
 * 
 */
package name.webdizz.styler;

import java.util.HashMap;
import java.util.Map;

import org.eclipse.equinox.app.IApplication;
import org.eclipse.equinox.app.IApplicationContext;
import org.osgi.framework.Bundle;

/**
 * @author webdizz
 * 
 */
public class StylerApplicationContext implements IApplicationContext {

	public static final String ARG_CONFIG = "-config";

	public static final String ARG_HELP = "-help";

	public static final String ARG_QUIET = "-quiet";

	public static final String ARG_VERBOSE = "-verbose";

	public static final String PDE_LAUNCH = "-pdelaunch";

	private Map<String, String[]> arguments = new HashMap<String, String[]>();

	public StylerApplicationContext(final Map<String, String[]> arguments) {
		super();
		this.arguments = arguments;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.eclipse.equinox.app.IApplicationContext#applicationRunning()
	 */
	public void applicationRunning() {
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.eclipse.equinox.app.IApplicationContext#getArguments()
	 */
	public Map<String, String[]> getArguments() {
		return arguments;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.eclipse.equinox.app.IApplicationContext#getBrandingApplication()
	 */
	public String getBrandingApplication() {
		return "jStyler";
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.eclipse.equinox.app.IApplicationContext#getBrandingBundle()
	 */
	public Bundle getBrandingBundle() {
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.eclipse.equinox.app.IApplicationContext#getBrandingDescription()
	 */
	public String getBrandingDescription() {
		return "jStyler - formatter for BuildR";
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.eclipse.equinox.app.IApplicationContext#getBrandingId()
	 */
	public String getBrandingId() {
		return "jStyler";
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.eclipse.equinox.app.IApplicationContext#getBrandingName()
	 */
	public String getBrandingName() {
		return "jStyler";
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.eclipse.equinox.app.IApplicationContext#getBrandingProperty(java.
	 * lang.String)
	 */
	public String getBrandingProperty(String property) {
		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.eclipse.equinox.app.IApplicationContext#setResult(java.lang.Object,
	 * org.eclipse.equinox.app.IApplication)
	 */
	public void setResult(Object arg0, IApplication arg1) {
		// we do not supprt this method
	}

}
