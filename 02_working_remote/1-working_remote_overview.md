---
title: "Working on a remote server"
author: "Julien Brun, Mark Schildhauer"
date: "June, 2016"
output: ioslides_presentation
	widescreen: true
	self_contained: false
---

## How to share files with a remote server
- **SAMBA** file sharing
- **sFTP** and **SCP**

## How to connect to a remote server (Aurora)
* **X2Go** : *remote desktop*
* **Secure SHell (SSH)** : connect via the *command line*

## Remote Desktop

First you will need to install the client on your machine:

http://wiki.x2go.org/doku.php

Then we will need to setup your connection for Aurora:

https://help.nceas.ucsb.edu/remote_access_using_x2go

## X2Go Remote Desktop

![X2go Desktop](./images/x2go_desktop.png)

### Put your nametag up whe you are connected succesfully!

## X2Go Remote Desktop

Let's *create* a *directorty* (in Unix it is referred as a *directory*) named ```snapp-workshop```

![Tip](./images/tip.png) Avoid using spaces in your file and directory names, it will make it more complicated to use in a command line environment. Simply subsitute them by ``` - ``` or ``` _ ``` .


## X2Go Remote Desktop

* Advantages
 * You get a desktop like environment with Graphical User Interface (GUI)
 * Low learning curve to use it
* Disadvantages
 * Can be slow due to the need of transfering more data over the network for data for the Graphical Interface
 * Some keyboard mapping issues with X2go ([see NCEAS wiki](https://help.nceas.ucsb.edu/remote_access_using_x2go))
 *  Some issues with very high resolution MS Windows machines

## Secure SHell (SSH)

Windows users you will have to install a software to connect vis a ssh. We recommend PuTTY: 
https://help.nceas.ucsb.edu/connecting_to_linux_using_ssh?s[]=x2go

Mac users, you can use the terminal to connect via ssh.

