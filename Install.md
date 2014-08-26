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

We're using *Node versions 0.10.3x* this term, so be sure that's what you end up with!

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


PostgreSQL
==========

[PostgreSQL](http://www.postgresql.org/) is a representative of a more traditional class of *relational* database engines based on a language family called SQL.  In 6.170, we will also use it to illustrate richer sorts of database designs.  **Or will we?**

The PostgreSQL web site has a [a page of downloading instructions](http://www.postgresql.org/download/).

In Debian-flavored Linux, installation just requires running:

    sudo apt-get install postgresql

Simple acceptance test
----------------------

After proper installation, you should have a database server running locally.  To test it from a UNIX-style command-line interface, try the following.  The `#` lines are comments and shouldn't be run.

    # First, create a PostgreSQL account for your UNIX user.
    # It's necessary to become the database admin user to do so.
    $ sudo -u postgres createuser --createdb --no-superuser --no-createrole `whoami`
    # Now create a database, as your own user.
    $ createdb mytest
    # Open a command-line connection to your database.
    $ psql mytest
    psql (9.1.14)
    Type "help" for help.
    
    # Now a quick interaction to make sure everything is working.
    mytest=> CREATE TABLE foo (baz INTEGER, bar TEXT);
    CREATE TABLE
    mytest=> INSERT INTO foo (baz, bar) VALUES (1, 'ABC');
    INSERT 0 1
    mytest=> SELECT * FROM foo;
     baz | bar 
    -----+-----
       1 | ABC
    (1 row)

    mytest=> 
    # End session with control-D.


OpenShift
=========

At some point, you will want to deploy your applications on a server somewhere, so that all the world can access them!  We'll ask you to deploy somewhere for testing by the TAs for grading purposes.  You're free to deploy anywhere you want that leads to a publically accessible web site, but the 6.170 staff are supporting the [OpenShift](https://www.openshift.com/) platform this term.

To use OpenShift, first you'll want to [create an account on the web](https://www.openshift.com/app/account/new).  Now you have some choices about how to *use* your account.  There is a web-based deployment interface on the OpenShift site, and there is also an Eclipse plug-in.  This document will instead explain the command-line interface, based on a program called `rhc`.

First, [install the command-line tools](https://www.openshift.com/developers/rhc-client-tools-install).  Next, set up an authentication method between your machine and the OpenShift servers.  If you're an expert on such concepts as SSH keys, then you might want to consult the more in-depth OpenShift documentation, but the easiest way to get started is just to run:

    rhc setup

You'll be prompted for:

* your OpenShift username and password
* whether you want to generate a token and/or upload an SSH key (say "yes" to both unless you really know what you're doing)
* a choice of a namespace, which is text that appears in the URL for each of your hosted apps (something close to your Athena username will be helpful to our TAs!)

Simple acceptance test
----------------------

To get started with an OpenShift-compatible project, we recommend cloning one of our template repositories.  For instance:

    rhc app-create myapp nodejs --from-code https://github.com/6170-fa14/openshift-basic

The `rhc` tool should output quite a bit of chatter here (and it might take a while), finally telling you the URL where your app is now available.  You might need to answer "yes" to a question about accepting the SSH key of your new remote server.  Be aware that this command line will create a Git repository called `myapp` in the current directory.  You edit this repository and push back to OpenShift, to deploy a new version of an app.

The same repository may also be pushed to or pulled from GitHub or any other Git location.  For instance, here's how to set up a connection to a GitHub repo:

    git remote add github https://github.com/you/your-repo
    git pull github master

Let's take a quick look at the two key files in the `openshift-basic` template.

The `package.json` file looks more or less like the one quoted above, except that one extra line is added:

    "main": "server.js"

This line tells OpenShift which argument to pass to the `node` program to start your server.  Feel free to change it if you'd rather use a different JavaScript file as your program's main entry point.

We've also made the last line of `server.js` a bit fancier:

    app.listen(process.env.OPENSHIFT_NODEJS_PORT || 8080,
               process.env.OPENSHIFT_NODEJS_IP);

This file is coded to allow the app to run correctly both on your local machine and on OpenShift's servers.  If the app is started on OpenShift, two environment variables `OPENSHIFT_NODEJS_PORT` and `OPENSHIFT_NODEJS_IP` will be set, explaining which port and IP address to listen on.  We presume that these variables are *not* set in your local development environment!  Therefore, if they are set, we must be on OpenShift, and we should use them; and if they are not set, we should use appropriate local defaults.  (Feel free to fiddle with those defaults, if you like.)  The `||` operator is a handy way of picking a particular value, if it is defined; or going with a default value otherwise.  In this case, we pick 8080 as the default port to run a web server on.

MongoDB on OpenShift
--------------------

A different template repository is helpful to create applications that use MongoDB via the Monk NPM package.

    rhc app-create mymongo nodejs mongodb-2.4 --from-code https://github.com/6170-fa14/openshift-mongodb

This template application should run both locally and on OpenShift.  Each page hit adds a new entry to the database and displays all the entries so far.

Beside adding the Monk package as a dependency in `package.json`, we also see the following logic in `server.js`, to initiate the MongoDB connection correctly, on either your local machine or OpenShift, where `mymongo` is the database name chosen by OpenShift, based on the app name:

    var monk = require('monk');

    var connection_string = 'localhost/mymongo';

    if (process.env.OPENSHIFT_MONGODB_DB_PASSWORD) {
      connection_string = process.env.OPENSHIFT_MONGODB_DB_USERNAME + ':' +
            process.env.OPENSHIFT_MONGODB_DB_PASSWORD + '@' +
            process.env.OPENSHIFT_MONGODB_DB_HOST + ':' +
            process.env.OPENSHIFT_MONGODB_DB_PORT + '/mymongo';
    }

    var db = monk(connection_string);

See the rest of `server.js` for how the database handle `db` is used.
