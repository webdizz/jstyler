/**
 * 
 */
package name.webdizz.styler;

import java.util.HashMap;
import java.util.Map;

import org.eclipse.equinox.app.IApplicationContext;
import org.osgi.framework.Bundle;

/**
 * @author webdizz
 *
 */
public class StylerApplicationContext implements IApplicationContext {

	/* (non-Javadoc)
	 * @see org.eclipse.equinox.app.IApplicationContext#applicationRunning()
	 */
	public void applicationRunning() {
		// TODO Auto-generated method stub

	}

	/* (non-Javadoc)
	 * @see org.eclipse.equinox.app.IApplicationContext#getArguments()
	 */
	public Map<String, String[]> getArguments() {
		Map<String, String[]> arguments = new HashMap<String, String[]>();
		arguments.put(IApplicationContext.APPLICATION_ARGS, new String[]{});
		return arguments;
	}

	/* (non-Javadoc)
	 * @see org.eclipse.equinox.app.IApplicationContext#getBrandingApplication()
	 */
	public String getBrandingApplication() {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see org.eclipse.equinox.app.IApplicationContext#getBrandingBundle()
	 */
	public Bundle getBrandingBundle() {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see org.eclipse.equinox.app.IApplicationContext#getBrandingDescription()
	 */
	public String getBrandingDescription() {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see org.eclipse.equinox.app.IApplicationContext#getBrandingId()
	 */
	public String getBrandingId() {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see org.eclipse.equinox.app.IApplicationContext#getBrandingName()
	 */
	public String getBrandingName() {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see org.eclipse.equinox.app.IApplicationContext#getBrandingProperty(java.lang.String)
	 */
	public String getBrandingProperty(String arg0) {
		// TODO Auto-generated method stub
		return null;
	}

}
