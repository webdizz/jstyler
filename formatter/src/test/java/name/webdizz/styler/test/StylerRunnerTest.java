package name.webdizz.styler.test;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.security.Permission;

import name.webdizz.styler.StylerApplicationContext;
import name.webdizz.styler.StylerRunner;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

public class StylerRunnerTest {

	static class ExitException extends SecurityException {
		private static final long serialVersionUID = 8334082558213014471L;

		public ExitException() {
			super();
		}
	}

	static class ExitSecurityManager extends SecurityManager {
		@Override
		public void checkPermission(Permission perm) {
			// allow anything.
		}

		@Override
		public void checkPermission(Permission perm, Object context) {
			// allow anything.
		}

		@Override
		public void checkExit(int status) {
			super.checkExit(status);
			throw new ExitException();
		}
	}

	@BeforeClass
	public static void setUp() {
		System.setSecurityManager(new ExitSecurityManager());
	}

	@AfterClass
	public static void tearDown() {
		System.setSecurityManager(null);
	}

	@Test(expected = ExitException.class)
	public void testStylerRunnerShouldFail() throws Exception {
		String[] args = new String[] {};
		StylerRunner.main(args);
	}

	@Test
	public void shouldProceedWithFormatting() throws Exception {
		String[] args = new String[] {
				// specify config path
				StylerApplicationContext.ARG_CONFIG,
				"./org.eclipse.jdt.core.prefs",
				// specify source path
				"fixture" };
		String path = "fixture/name/webdizz/styler/fixture/FormatterFixture.java";
		File file = new File(path);
		assertNotNull("I have no file to check modifications of.", file);
		assertTrue("File does not exist.", file.exists());
		long beforeFormat = file.lastModified();
		StylerRunner.main(args);
		file = new File(path);
		long afterFormat = file.lastModified();
		assertTrue("File was not modified.", beforeFormat != afterFormat);
	}

}
