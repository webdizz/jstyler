/*******************************************************************************
 * Copyright (c) 2000, 2010 IBM Corporation and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     IBM Corporation - initial API and implementation
 *******************************************************************************/
package name.webdizz.styler;

import org.eclipse.jdt.internal.compiler.util.SuffixConstants;

/**
 * Provides convenient utility methods to other types in this package.
 */
public class Util {

	private static char[][] JAVA_LIKE_EXTENSIONS;

	/**
	 * Returns true if the given name ends with one of the known java like
	 * extension. (implementation is not creating extra strings)
	 */
	public final static boolean isJavaLikeFileName(String name) {
		if (name == null)
			return false;
		return indexOfJavaLikeExtension(name) != -1;
	}

	/*
	 * Returns the index of the Java like extension of the given file name or -1
	 * if it doesn't end with a known Java like extension. Note this is the
	 * index of the '.' even if it is not considered part of the extension.
	 */
	public static int indexOfJavaLikeExtension(String fileName) {
		int fileNameLength = fileName.length();

		// Hot-fix by webdizz as we only interesting in .java files
		// char[][] javaLikeExtensions = getJavaLikeExtensions();
		char[][] javaLikeExtensions = new char[1][];
		javaLikeExtensions[0] = SuffixConstants.EXTENSION_java.toCharArray();
		// end of hot-fix

		extensions: for (int i = 0, length = javaLikeExtensions.length; i < length; i++) {
			char[] extension = javaLikeExtensions[i];
			int extensionLength = extension.length;
			int extensionStart = fileNameLength - extensionLength;
			int dotIndex = extensionStart - 1;
			if (dotIndex < 0)
				continue;
			if (fileName.charAt(dotIndex) != '.')
				continue;
			for (int j = 0; j < extensionLength; j++) {
				if (fileName.charAt(extensionStart + j) != extension[j])
					continue extensions;
			}
			return dotIndex;
		}
		return -1;
	}

	/**
	 * Returns true if the given name ends with one of the known java like
	 * extension. (implementation is not creating extra strings)
	 */
	public final static boolean isJavaLikeFileName(char[] fileName) {
		if (fileName == null)
			return false;
		int fileNameLength = fileName.length;
		char[][] javaLikeExtensions = getJavaLikeExtensions();
		extensions: for (int i = 0, length = javaLikeExtensions.length; i < length; i++) {
			char[] extension = javaLikeExtensions[i];
			int extensionLength = extension.length;
			int extensionStart = fileNameLength - extensionLength;
			if (extensionStart - 1 < 0)
				continue;
			if (fileName[extensionStart - 1] != '.')
				continue;
			for (int j = 0; j < extensionLength; j++) {
				if (fileName[extensionStart + j] != extension[j])
					continue extensions;
			}
			return true;
		}
		return false;
	}

	/**
	 * Returns the registered Java like extensions.
	 */
	public static char[][] getJavaLikeExtensions() {
		if (JAVA_LIKE_EXTENSIONS == null) {
			char[][] extensions = new char[1][];
			extensions[0] = SuffixConstants.EXTENSION_java.toCharArray();
			JAVA_LIKE_EXTENSIONS = extensions;
		}
		return JAVA_LIKE_EXTENSIONS;
	}

}
