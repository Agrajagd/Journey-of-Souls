/**
 * Journey of Souls
 * Copyright (c) 2010 - 2011, Jeremy Privett
 * All rights reserved.
 *
 * Licensed under the New BSD License. See LICENSE.txt for details.
 */

package com.josmud.util;

import java.io.FileReader;
import javax.script.*;

/**
 * JSHelper class. This is used as a factory for generating our
 * CompiledScripts from paths to JavaScript source code. Since
 * every script essentially needs its own ScriptEngine in order
 * to function properly, we're consolidating the script compilation
 * process to this class.
 *
 * @author jprivett
 */
public class JSHelper {
	public static CompiledScript compile(String filePath)
	{
		Compilable jsCompiler = (Compilable) (new ScriptEngineManager()).getEngineByName("JavaScript");

		try {
			CompiledScript s = jsCompiler.compile(new FileReader(filePath));
			s.eval();

			return s;
		}
		catch (Exception e) {
			return null;
		}
	}

	public static <T> T compileAndFetchInterface(String filePath, Class<T> clasz)
	{
		CompiledScript s = compile(filePath);
		T o = ((Invocable) s.getEngine()).getInterface(clasz);

		return o;
	}
}
