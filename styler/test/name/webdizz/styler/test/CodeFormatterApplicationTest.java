package name.webdizz.styler.test;

import static org.junit.Assert.assertNotNull;

import name.webdizz.styler.StylerApplicationContext;

import org.eclipse.equinox.app.IApplication;
import org.eclipse.equinox.app.IApplicationContext;
import org.eclipse.jdt.core.formatter.CodeFormatterApplication;
import org.junit.Test;

public class CodeFormatterApplicationTest {

	private IApplicationContext applicationContext = new StylerApplicationContext();
	
	@Test
	public void testStart()  throws Exception {
		IApplication codeFormatter = new CodeFormatterApplication();
		assertNotNull(codeFormatter);
		Object result = codeFormatter.start(applicationContext);
		assertNotNull(result);
	}

}
