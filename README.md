##Setting up your system

Checklist of software that I used to build this Rails project on OSX.

###xcode

This is the Mac OSX SDK, it contains a whole load of different tools including an IDE for developing native OSX and iOS applications. You will only really need the C compiler that it includes in order to make various tools that you will download later. You can get it for free from the AppStore.

###Homebrew

This is a package manager for OSX, a tool for installing various system packages. These include all sorts of systems software, including database systems (e.g. Postgres). It is not just for Ruby software. Go to the website and follow the installation instructions - at the time of writing you just have to run this from your shell:

     $ /usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"

to get help:

     $ brew help

some examples, these commands in order, list the packages that you have installed, installs the postgresql package, outputs the info about that package and then uninstalls it again:

    $ brew list
    $ brew install postgresql
    $ brew info postgresql
    $ brew uninstall postgresql

###Text editor

You will need a decent text editor. TextMate, Vim and Sublime are popular choices. Take your pick.


###iTerm2

You will be using a lot of command line tools so its helpful to have a decent terminal application. The OSX Terminal application is fine but iTerm has a few more features which are pretty useful.

##Setting up Ruby

###RVM

The modern way to manage your Ruby environment is to use a version manager RVM (there is an alternative called rbenv but we will stick to RVM for now).

RVM stands for Ruby Version Manager. It actually serves two important purposes. Firstly it allows you to install multiple versions of the various Ruby runtime implementations on the same machine so that you can easily switch between them. There are many different versions of each interpreter so if you work on multiple projects you are likely to be using multiple versions. RVM allows you to set up your system with as many Ruby versions as you need.

Secondly it makes it possible to create project specific gemsets. Gems are the Ruby library packages that any non-trivial Ruby application will use. They are very easy to install and upgrade but managing the dependencies between them can become difficult if you have multiple projects each requiring different combinations of gem versions. So RVM lets you create a gemset for each of your projects by creating an .rvmrc file which lives in the root directory of your project.
Setting up Ruby with RVM

Before setting up RVM its worth noting that OSX comes with a preinstalled (system) Ruby implementation, the following command lets you confirm its version number (likely to be 1.8.7 on a fresh Lion install):

    $ ruby -v

In order to install RVM follow the instructions at the RVM website or run this command:

    $ bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer )

Having installed RVM take a look at the help and the list of available Rubies:

    $ rvm help
    $ rvm list known

You will want to install a newer version of Ruby than your system comes with by default:

    $ rvm install 1.9.2

This will install the latest version of 1.9.2 (currently p290). Run rvm list again and then switch to this new version:

    $ rvm use 1.9.2 --default

Now ruby -v should indicate that you are using the newer version. Thats the one we will use for Rails development. Note that the default switch means that when you open a new terminal it will automatically use 1.9.2.

####Setting up a project specific gemset with RVM

When we create a new project one of the first things we need to do is to create a gemset specific to that project so that we can isolate its dependencies from any other projects and gems that we happen to have installed. To do this you need to create a project directory, a .rvmrc file and a gemset.

    $ mkdir my_project
    $ cd my_project
    $ rvm --rvmrc --create 1.9.2@my_proj
    $ cd ..
    $ cd my_project

At this point you will be prompted about whether you trust the new .rvmrc (say yes). You will also be asked to create the new gemset like so:

    $ rvm gemset create my_proj

You are now setup to start building your project.

###Bundler

When you create a new project you will soon start adding gems to it. These include the various gems that make up Rails. Handling the dependencies between gems can be quite tricky. The inter-dependencies can get very complicated so you need a tool that can work out exactly what gems you need and install them for you.

With Bundler you declare the list of gems that your application depends on in a Gemfile. Bundler takes care of the rest - it works out any further dependencies and helps you set them up.

Note that Bundler and RVM work hand-in-hand to solve different aspects of setting up your Ruby environment. RVM provides the containers for different version and gemsets, whereas Bundler manages a gemset based on the dependencies that you define.
Bundler itself is a gem so you have to install it first using the normal gem commands:

    $ gem install bundler

In a Rails 3 project it gets pulled in as a dependency so this is not necessary.

Whenever you need to add a new gem to your project, say for example you want to include rspec in your project, you add a line to your Gemfile to declare the dependency, then run the following to install this gem and any others that it requires:

    $ bundle install

The other command that you will need day to day is bundle exec which is used to prefix any ruby command that needs to make sure that the gems are setup before running, e.g.:

    $ bundle exec rspec spec

##Setting up Rails

To set up Rails you should first create a new folder and a .rvmrc file as described above. You should also do a git init to set up a git repo from the start of the project.

You will need to install the Rails gem, make sure you are in the right gemset and then run:

    $ gem install rails

This will set up all sorts of gems for you. You can now create a new rails project from inside your project directory:

Work in progress...
