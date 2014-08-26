This guide explains how to install all of the programming tools for 6.170 on your own computer.  Look elsewhere for an introduction to actually programming with these tools, to the big ideas behind them, and so on.

Preliminaries
=============

Some sort of text editor or IDE will be essential for editing code in 6.170.  There are the classic UNIX text editors Emacs and Vi, available for nearly all platforms.  Certainly getting experience with these helps build street cred among developer! `:-)`  Tools with shorter learning curves (but probably also supporting less efficient use by experts) include [Sublime Text](http://www.sublimetext.com/).  In non-UNIX platforms, a variety of tools can be helpful, like the fancy text-console program [iTerm](http://iterm.sourceforge.net/) for Mac OS X.

GitHub
======

[Git](http://git-scm.com/) is a distributed version control system.  That is, it's a *version control system*, which helps groups of programmers maintain a shared history of a set of files, resolve conflicting changes to files, and so on; and it's *distributed*, because it does not have a required concept of a central server storing the "one true history" of a project.  These days, 6.005 is using Git, so we'll assume most of you have seen it before.  Some [notes on version control from 6.005](https://stellar.mit.edu/S/course/6/fa12/6.005/courseMaterial/topics/topic2/lectureNotes/L13-version-control/L14-version-control.pdf) might be helpful as a refresher.

We'll be using [GitHub](http://github.com/) for official project hand-in, and we recommend using it to coordinate your project work as well, both for individual and team projects.  GitHub is a free Git hosting service that is very popular for open-source projects.  [GitHub's guide to setting up Git](https://help.github.com/articles/set-up-git#setting-up-git) may be helpful.

Node.js
=======

[Node.js](http://nodejs.org/) is a JavaScript execution engine designed for Internet servers.  We'll be using it for all projects after #1.

Node is a popular, polished system, so it should be fairly painless to install on any of the most popular operating systems.  In particular:

  * In Debian-based Linux distributions, including Ubuntu, follow [these instructions for installing Node as an APT package](https://github.com/joyent/node/wiki/installing-node.js-via-package-manager#ubuntu-debian-linux-mint-etc).  Short version:

        sudo apt-get install curl
        curl -sL https://deb.nodesource.com/setup | sudo bash -
        sudo apt-get install nodejs

  * On Mac OS X or Windows, use [the native installers from the Node.js site](http://nodejs.org/download/).

We're using *Node version 0.30* this term, so be sure that's what you end up with!

Simple acceptance test
----------------------

To test your Node installation, put the following line in a file `hi.js`:

    console.log("Hi");

Then run:

    node hi.js

The program should print `Hi` to the screen and exit immediately.
