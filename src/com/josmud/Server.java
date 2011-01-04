/**
 * Journey of Souls
 * Copyright (c) 2010 - 2011, Jeremy Privett
 * All rights reserved.
 *
 * Licensed under the New BSD License. See LICENSE.txt for details.
 */

package com.josmud;

import java.io.*;
import java.net.*;
import java.util.HashMap;

import com.josmud.core.Descriptor;

public class Server extends Thread {

	public int totalConnections = 0;
	public HashMap descriptors = new HashMap();

	private int port = 0;
	private ServerSocket sock = null;
	
	private static Server reference = null;
	
	private Server() {}
	
	public static synchronized Server getInstance()
	{
		if ( reference == null ) {
			reference = new Server();
		}
		
		return reference;
	}

	public void setPort(int port)
	{
		this.port = port;
	}

	public void addDescriptor(Descriptor d)
	{

	}

	public void addDescriptor(Descriptor d, String name)
	{

	}

	public void removeDescriptor(Descriptor d)
	{

	}

	public void removeDescriptor(String name)
	{
		
	}

	@Override
	public void run()
	{
		try {
			sock = new ServerSocket(port, 1);
			Game.isUp = true;

			while ( Game.isUp ) {
				Socket clientSocket = sock.accept();
				DataOutputStream os = new DataOutputStream(clientSocket.getOutputStream());
				os.writeChars("Thanks for connecting! Goodbye!\r\n");
				clientSocket.close();
			}
		}
		catch (Exception e) {
			Game.logger.fatal("Unable to create server socket on port " + port + ". Exception message: " + e.getMessage());
			System.exit(-1);
		}
	}
	
	@Override
	public Object clone()
		throws CloneNotSupportedException
	{
		throw new CloneNotSupportedException();
	}
}
