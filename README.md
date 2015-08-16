#GrimmDex
The lightweight git-annex CMS

##What
GrimmDex is a basic system to generate HTML index pages for git-annex
repositories.

##Why
- Good for offline work
- Good for accountability (you fuck up history if you try to rewrite it)
- Lightweight toolchain - stuff you should already have installed!
- Distributed - trivially easy to mirror
- Self-bootstraps
- Backend works all by itself, http, rss and bbs are all just frontends
- I hate web interfaces

##How
In your git annex repository, either add GrimmDex as a submodule or clone in to
the top level under the name "cms":

      git submodule add https://github.com/oholiab/grimmdex cms

Although as this is a real hack, you'll probably want to submodule in your own
fork so you can fix it ;)

Then

    cd cms
    ./setup.sh
    echo "Makefile" >> .gitignore

You will then be able to run

    make

from the top level of your repository to generate an index.

To use your own custom header and footer (from which you can link your own CSS
etc), create header.html and footer.html in the top level of your repository.

Index items are currently only configurable from the tools/generate_index script
so unfortunately you'll need to edit the upstream code here... although patches
absolutely welcome if you want to assist in putting in templating support.

##Roadmap
###MVP - Complete
- Use a lightweight toolchain (make and bash)
- Create static content
- Create an index page
- Require (at most) cron or incron for the server side

BOSH done.

###Post-MVP
Starred are selected for development:
- Open sores *
- Templating index items
- Cache index items to reduce the amount of git tree traversal
- Have a configurable retention time for the hosted server to keep hosted
  storage costs down
- Use git-annex's content tagging to index content using views
- Create RSS
- pre-commit-annex script to auto-tag content (mostly timestamp)

###Pipe dreams
- BBS system, SSL + Telnet
