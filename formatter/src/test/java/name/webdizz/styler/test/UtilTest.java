package name.webdizz.styler.test;

import name.webdizz.styler.Util;

import static org.junit.Assert.*;
import org.junit.Test;

public class UtilTest {

	@Test
	public void shouldResolveAsJavaFile() {
		assertTrue(Util.isJavaLikeFileName("SomeClass.java"));
	}

	@Test
	public void shouldNotResolveAsJavaFile() {
		assertFalse(Util.isJavaLikeFileName("SomeClass.groovy"));
	}

	@Test
	public void shouldFindJavaPosition() {
		assertTrue(Util.indexOfJavaLikeExtension("SomeClass.java") > -1);
	}

	@Test
	public void shouldNotFindJavaPosition() {
		assertTrue(Util.indexOfJavaLikeExtension("SomeClass.groovy") < 0);
	}
}
