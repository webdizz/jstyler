package name.webdizz.styler.test;

import static org.junit.Assert.assertNotNull;

import java.util.HashMap;
import java.util.Map;

import name.webdizz.styler.StylerApplicationContext;

import org.eclipse.equinox.app.IApplication;
import org.eclipse.equinox.app.IApplicationContext;
import org.eclipse.jdt.core.formatter.CodeFormatterApplication;
import org.junit.Before;
import org.junit.Test;

public class CodeFormatterApplicationTest {

    private static Map<String, String[]> arguments = new HashMap<String, String[]>();
    
    private static IApplicationContext applicationContext;

    @Before
    public void beforeTest() {
	String[] args = new String[] {
		// specify config path
		StylerApplicationContext.ARG_CONFIG, "../org.eclipse.jdt.core.prefs",
		// specify source path
		"fixture"
	};
	arguments.put(IApplicationContext.APPLICATION_ARGS, args);
	applicationContext = new StylerApplicationContext(arguments);
    }

    @Test
    public void testStart() throws Exception {
	IApplication codeFormatter = new CodeFormatterApplication();
	assertNotNull(codeFormatter);
	Object result = codeFormatter.start(applicationContext);
	assertNotNull(result);
    }

}
