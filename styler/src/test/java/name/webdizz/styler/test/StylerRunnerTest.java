package name.webdizz.styler.test;

import java.io.File;

import name.webdizz.styler.StylerApplicationContext;
import name.webdizz.styler.StylerRunner;

import static org.junit.Assert.*;

import org.junit.Test;

public class StylerRunnerTest {

    @Test(expected = Exception.class)
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
