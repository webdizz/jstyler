package name.webdizz.styler;

import java.util.HashMap;
import java.util.Map;

import name.webdizz.styler.formatter.JavaCodeFormatterApplication;

import org.eclipse.equinox.app.IApplication;
import org.eclipse.equinox.app.IApplicationContext;

public class StylerRunner {

	public static void main(final String[] args) throws Exception {
		if (null == args || (null != args && args.length < 2)) {
			System.out
					.println("You need to specify arguments to run formatter.");
			System.exit(0);
		}
		Map<String, String[]> arguments = new HashMap<String, String[]>();
		arguments.put(IApplicationContext.APPLICATION_ARGS, args);
		IApplicationContext context;
		context = new StylerApplicationContext(arguments);
		// run formatter
		IApplication codeFormatter = new JavaCodeFormatterApplication();
		codeFormatter.start(context);
	}
}
