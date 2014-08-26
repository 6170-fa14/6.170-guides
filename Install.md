This guide explains how to install all of the programming tools for 6.170 on your own computer.  Look elsewhere for an introduction to actually programming with these tools, to the big ideas behind them, and so on.

Preliminaries
=============

Some sort of text editor or IDE will be essential for editing code in 6.170.  There are the classic UNIX text editors Emacs and Vi, available for nearly all platforms.  Certainly getting experience with these helps build street cred among developer! `:-)`  Tools with shorter learning curves (but probably also supporting less efficient use by experts) include [Sublime Text](http://www.sublimetext.com/).  In non-UNIX platforms, a variety of tools can be helpful, like the fancy text-console program [iTerm](http://iterm.sourceforge.net/) for Mac OS X.


JavaScript debugging
====================

We'll assume each of you has a web browser installed, which means you're already set up to run JavaScript code!  For instance, if you've put some JavaScript within an HTML file found in `/home/you/file.html` on a Linux system, then you should be able to visit it in your browser at URL:

    file:///home/you/file.html

As a quick test, you could try these file contents:

    <html><body>
      <script language="text/javascript">alert("It worked!")</script>
    </body></html>

Many of you may be unfamiliar with the JavaScript debugging tools provided by modern web browsers.  We recommend the tools within Chrome and Firefox in particular.

**Need to decide what else to say here.  I'm not an expert on JavaScript debugging in either browser.**


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


Express
=======

[Express](http://expressjs.com/) is a simple web application framework for Node.  Like most Node add-ons, it's packaged with [NPM](https://www.npmjs.org/), the Node Package Manager.  That means installation is particularly straightforward.  To both install Express and validate your NPM setup, put the following text in a file `package.json` within a directory reserved for an example application:

    {
      "name": "test",
      "description": "Just testing, OK?",

      "repository": {
        "type": "git",
        "url": "https://github.com/6170-fa14/6.170-guides"
      },

      "engines": {
        "node": ">= 0.30.0",
        "npm": ">= 1.0.0"
      },

      "dependencies": {
        "express": ">= 4.0.0"
      }
    }

This configuration file is written as an object in [JSON](http://json.org/), a JavaScript-based format for structured, untyped data.  The first two lines give basic metadata about the project.  The `repository` section explains where to grab the source for the project.  (Here we've used the repository containing this document, which isn't actually where the source for the project will be found!)  The last sections, `engines` and `dependencies`, gives constraints on the acceptable versions of Node, NPM, and Express.

To satisfy NPM, also create a file `README.md` in the same directory.  It doesn't matter what's there now; it can be empty, but in a real project it would provide some kind of introduction and documentation.  (GitHub wants to see `README.md` files, too.  They're written in a syntax format called [Markdown](https://help.github.com/articles/github-flavored-markdown).)

Now just run this command in the directory where you put the files:

    npm install

NPM parses your `package.json` file and installs all dependencies, including the transitive requirements of the packages you've asked for.  The output should be moderately chatty, describing all the packages that have been pulled in from the web, saved in a subdirectory `node_modules`.

Simple acceptance test
----------------------

As the "hello world" of web serving, try putting this code in a file `server.js`:

    var express = require('express');
    var app = express();

    app.get('/', function(req, res) {
        res.writeHead(200, {"Content-Type": "text/html"});
        res.write('<html><body>Hello World</body></html>');
        res.end();
    });

    app.listen(8080);

Now you should be able to start your web server by running:

    node server.js

Your boring web site should be accessible in a local web browser at this URL:

    http://localhost:8080/

You'll want to kill the server after you finish testing, probably by typing *control-C*.


MongoDB
=======

[MongoDB](http://www.mongodb.org/) is a popular document-oriented database system with a simple interface.  We'll use it in the first database-related project, and it could be reasonable to use in your final team project.

The MongoDB web site has installation instructions for Linux ([Ubuntu](http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/) and [Debian](http://docs.mongodb.org/manual/tutorial/install-mongodb-on-debian/)), [Max OS X](http://docs.mongodb.org/manual/tutorial/install-mongodb-on-os-x/), and [Windows](http://docs.mongodb.org/manual/tutorial/install-mongodb-on-windows/).

In Debian-flavored Linux, at least, installation is as easy as a single command line:

    sudo apt-get install mongodb

You might end up with a slightly out-of-date version, but that shouldn't matter much for 6.170 this term.

Simple acceptance test
----------------------

Once MongoDB is installed properly, you should be able to replicate this small example interaction at the command line:

    $ mongo
    MongoDB shell version: 2.0.4
    connecting to: test
    > db.foo.insert({baz:1, bar:"ABC"});
    > db.foo.find();
    { "_id" : ObjectId("53fcd2e46484d6bbd123378c"), "baz" : 1, "bar" : "ABC" }
    >

(Finish by typing something like *control-D* to end the session.)
