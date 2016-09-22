---
title: "Servers and Networks"
author: "Revised by Julien Brun & Mark Schildhauer from Matt Jones 2014"
date: "June, 2016"
output: html_document
---

## Working Remote Overview
The goal of this session is to become more familiar with some Internet concepts, as well as how computers access the Internet in order to exchange information. Then we will look into different ways one can connect to a remote server. We will follow by an introduction to the command line.

* Provide basic background on computer networking 
* Lay groundwork for understanding tools that use the Internet

## Why should I learn to do analyses on "servers"? I like my PC desktop!!!
Some advantages of working on remote system:

* **Power**: More *CPUs/Cores* (24/32/48), More RAM (256/384GB) 
* **Capacity**: More *disk space* and generally* faster storage* (in highly optimized RAID arrays)
* **Security**: Data are spread across *multiple drives* and have nightly *backups*
* **Collaboration**: *shared folders* for code, data, and other materials; same *software versions*

## NCEAS analytical server _Aurora_

 - **48 logical cores** (vCPUs) / 24 physical cores with hyperthreading
 - **3.5 GHz Turbo** / 2.6 GHz minimum
 - **384 GB** 2133 MHz ECC DDR4 memory
 - **20 TB fast storage** array with 1TB SSD write cache on local storage
 - **Nightly Backups**

=> For more info about Aurora: [https://help.nceas.ucsb.edu/high\_performance\_computing](https://help.nceas.ucsb.edu/high_performance_computing)


## The Internet

![](images/internet-1024x1024.png
    "http://r1.3crowd.com/blyon/opte/maps/static/1105841711.LGL.2D.1024x1024.png")

* **UCSB was one of the first four nodes on what became the Internet!**  This dates back to 1969
* The Internet was a huge, "open", mulit-institutional, collaborative project
	- development of standard protocols was the most essential aspect of creating the Internet
* The Internet only really "took off" starting in the late-1980's, after the USA National Science Foundation started supporting "NSFNET" 
* The Internet went ballistic starting in the mid-1990's, with rapid growth of the World Wide Web following release of the NCSA  **mosaic** web browser-- that initially ran on a Unix system.

## Basic networking

* Computers networked on the Internet are called **hosts**
* Host computers connect via networking equipment
* Can send messages to each other over communication protocols
* Client: the host *initiating* the request
* Server: the host *responding* to a request

![](images/tcp_ports.jpg)



## Local networks

![](images/client-server-network.png)

- All messages are broadcast on the local network: all hosts can "hear" these messages, and either deliver them up to the user of that host, or not
- Local hosts only "listen" for data that targets them
- Microsoft, Apple, and Novell each had their local network protocol (NetBIOS, Appletalk, and IPX,respectively), and were used to construct LANs (Local Area Networks)
- These LAN protocols were not effective for scaling up globally
- It was Unix systems running TCP/IP that catalyzed the Internet 
- The above is a vast simplification of how things work and how they happened

## Routed networks

![](images/routers_archs.gif)

* Routing is essential to connecting networks together via forwarding data along the best **routing paths**
* Routers are special pieces of equipment (computers in themselves)  that sit between two or more networks.  They either pass on ("forward"), or block information (in Internet parlance these bits of information are packaged together in **packets**, from one network to another


## IP Numbers and Hostnames

* Hosts are assigned a unique IP number used for all communication and routing
    - 128.111.220.7
    - 128.111 **is** UCSB
    - 128.111.220 **is** NCEAS
    - above is a simplification, but is generally the case
* Each IP Address can be used to communicate over various "ports"
    - Ports allow multiple applications to communicate with a host without mixing up traffic
    - the standard Web port for HTTP is port 80
    - the standard port for sending email is 25

* IP numbers can be difficult to remember, so the Internet also has a way of assigning hostnames to IP numbers
    - Handled through the global, decentralized, and hierarchical **Domain Name System** (DNS)
    - Clients first look up a hostname in DNS to find the IP Number
    - aurora.nceas.ucsb.edu -> 128.111.84.17
    - Then they open a connection to the IP Number
    - The special computers handling the mapping of IP Numbers to Hostnames are called **Nameservers**


## Client-Server and the Internet

![](images/client-server.png)

* **telnet** ("ssh" has replaced telnet for security reasons) and **ftp** were the two original services

## What makes a server a server?

* Servers are **listening** on the network for requests
* The listening software that typically runs constantly, is called a "daemon"
* For the Web, a Web server is running the HTTP daemon `httpd`
* For email, the standard daemon is `smtpd`
* For file transfer, the standard daemon is `ftpd`
* ..etc...



## Peer to Peer (P2P) networking

![](images/p2p-network.png)

* Remember **Napster**?  
  	- Peer-to-peer file-sharing of music over the Internet ca. 1999
  	- Shut down for copyright infringement in 2001
* The idea still has appeal: every host a client & server
	- Discovery of desired information is problematic on P2P
	- Security is also a problem-- many individual hosts can be compromised


## Internet versus the Web

### What is the difference?

* Internet: Global communication network using the Internet Protocol (IP)
    - Supports many application protocols, including HTTP (Web)
    - Other protocols include for email, file transfer, secure shell, etc.

* Web: Global system of interlinked hypertext documents
    - Transported over HTTP application protocol (over IP)
    - Generally accessed using web browsers that retrieve the documents

## Routing on the internet

* 80 routers at the core
* dense "mantle" of routers at the periphery
    - loss of the core still leaves > 70% of internet connected peer-to-peer
* The Internet evolved from a USA Pentagons' ARPANET (Advanced Research Projects Agency Network) project from around 1969-- the notion was building a distributed network of computers that could time-share with one another

![](images/internet-core.jpg)

## Internet Application Protocols

* Web (http)
* Email (smtp)
* Secure Shell (ssh)
* Telnet (telnet)
* File Transfer Protocol (ftp)
* Network News (nntp)
* ...

## The Web

* Global network of documents hosted on web servers around the world
* Web documents connected using hyperlinked HTML documents
* Other document types common (images, other media)

![](images/img_HTTP_request.png)

## How fast is the Internet?

* The speed of transferring information over the Internet depends on your **bandwidth**
* The UCSB backbone provides 10Gbs bandwidth
* The connectivity within NCEAS is 1Gbs
* The main servers for NCEAS are on the UCSB campus to get close to the UCSB backbone, and gateway to Internet2
* Internet2 provides 100Gbs bandwidth, with planned expansion to 8.8Tbs
* A typical residential home in the USA experiences 31Mbs

## How big is the Internet?

* Estimates are that the Internet now has capacity in the scale of zettabytes
* The Internet and its subset known as the World Wide Web, constitute a vast, distributed digital storehouse of information.

## References
This material has been adapted from the [Open Science for Synthesis - 2014](https://www.nceas.ucsb.edu/OSS) training material. See [NCEAS github repository](https://github.com/NCEAS/training/tree/master/2014-oss) for more information.
