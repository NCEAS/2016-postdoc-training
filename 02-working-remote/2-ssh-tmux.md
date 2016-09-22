---
layout: lesson
root: ../..
title: Working remote
author: "Revised by Julien Brun from Matt Jones 2014"
date: "June, 2016"
output:
  html_document
---

Connecting via Secure Shell (ssh)
=================================

* Used for connecting to and running shell commands on a remote host
* Tremendously simplifies remote computing
* Supported out-of-the-box on Linux and Macs

##	 Connecting to Aurora:

From the gitbash (MS Windows) or the terminal (Mac) type:

```bash
ssh aurora.nceas.ucsb.edu
```
You will be prompted for your username and password.

![aurora_ssh](images/aurora-ssh.png)

You can also directly add your username:

```bash
ssh brun@aurora.nceas.ucsb.edu
```

In this case, you will be only asked for your password as you already specified which user you want to connect with.

![https://freeiconshop.com/icon/task-complete-icon-outline/](images/checked32.png)  **Put your nametag up once you are connected succesfully!**

##### ?? Can you connect more than once at the time? Try to open another terminal and gitbash and ssh again


---

## Lay of the land

Here is below the typical file structure of a linux machine:

![](images/f778-1.gif
    "http://www.informatics.buzdo.com/p778_debian_root_boot_bin_lib_dev.htm")


##### ?? Create a directory `snapp-workshop`, go into this folder and create a subdirectory `scripts` and download the Rscript from here: `https://www.nceas.ucsb.edu/~brun/10min-loop.R`

Here are the steps:

```bash
mkdir snapp-workshop
cd snapp-workshop
mkdir scripts
cd scripts
wget https://www.nceas.ucsb.edu/~brun/10min-loop.R
```

![https://freeiconshop.com/icon/task-complete-icon-outline/](images/checked32.png)  **Put your nametag up once you have downloaded the R script**


### Note on file and directory names

<img style="float: left;width: 50px;" src=images/tip.png /> In general, avoid using spaces in your file and directory names. It will make it more complicated to use in a command line environment as you will have to escape the space using `\`. Simply subsitute spaces them by ` - ` or ` _ `.

---

## Running the R console

```bash
R
```
You are in! `Ctrl` + `d` or `quit()` to quit

I## Runnig a R script from the command line

Has the file name was suggesting, this script takes 10min to count to 100. Let's try to run it:

```bash
Rscript 10min-loop.R
```

**Close your window and try to reconnect. What happened?**

---

## Byobu

Use Byobu to keep your session live even if you disconnect, type this once logged in the server:  `byobu-enable`

and this is it!

Byobu is called a **terminal multiplexer** and offers a lot of useful functionalities to work through remote shell, such as multiple tabs, split windows, ... . To know more:

https://help.ubuntu.com/community/Byobu 

Want to connect bypassing byobu?

```bash
ssh -t myusername@aurora.nceas.ucsb.edu
```

*Note to Mac users*: some of the Function keys are already used by OSX, you might want to remap them.


## References

* Running a R Script: https://support.rstudio.com/hc/en-us/articles/218012917-How-to-run-R-scripts-from-the-command-line
* Boybu: http://byobu.co/
* Boybu shortcuts: https://gist.github.com/jshaw/5255721
