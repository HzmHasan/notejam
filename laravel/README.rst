****************
Notejam: Laravel
****************
Notejam application implemented using `Laravel <http://laravel.com/>`_ framework.

Laravel version: 4.1

==========================
Project Structure
==========================
- notejam folder includes the source code of the app
- docker includes scripts and configs for building a docker image of the app.
- docs includes desciption and presentation about the suggested solution.

==========================
Build and run docker image
==========================
-----
Clone
-----

Clone the repo:

.. code-block:: bash

    $ git clone git@github.com:komarserjio/notejam.git YOUR_PROJECT_DIR/

---------
DataBase
---------

Install postgreSQL and create a DB called notejam.


Copy the example config and adjust it based on your setup.

.. code-block:: bash

    $ cd YOUR_PROJECT_DIR/laravel/notejam/
    $ cp docker/.env.example.php docker.env.php
    
-------------
Build docker
-------------

The following environment varaibles are used by the build script:

$ENVIRON : The name of the environment that you are building for (ex. local, staging, production)
$IMAGE   : The name of the docker image 
$CI_COMMIT_SHA : This is the tag of the image. It can be anything however, as the name suggests, it is meant to be the commit sha that you want to build.

.. code-block:: bash
    $ export ENVIRON=local
    $ export IMAGE=notejam
    $export CI_COMMIT_SHA=1
    $ cd YOUR_PROJECT_DIR/laravel/notejam/
    $ ./docker/build.sh

-----------
Run docker
-----------

you can run a container directly

.. code-block:: bash
    $ docker run -d --name notejam -p 80:80 notejam:1

or you can run in kuernetes using the 'deploy.sh' script in deployment/kuberentes

===========================================
Installation and launching for development
===========================================

-----
Clone
-----

Clone the repo:

.. code-block:: bash

    $ git clone git@github.com:komarserjio/notejam.git YOUR_PROJECT_DIR/

-------
Install
-------

Install `composer <https://getcomposer.org/>`_

.. code-block:: bash

    $ cd YOUR_PROJECT_DIR/laravel/notejam/
    $ curl -s https://getcomposer.org/installer | php

Install dependencies

.. code-block:: bash

    $ cd YOUR_PROJECT_DIR/laravel/notejam/
    $ php composer.phar install

Create database schema

.. code-block:: bash

    $ cd YOUR_PROJECT_DIR/laravel/notejam/
    $ touch app/database/notejam.db
    $ php artisan migrate


------
Launch
------

Start laravel web server:

.. code-block:: bash

    $ cd YOUR_PROJECT_DIR/laravel/notejam/
    $ php artisan serve

Go to http://localhost:8000/ in your browser.

---------
Run tests
---------

Run functional and unit tests:

.. code-block:: bash

    $ cd YOUR_PROJECT_DIR/laravel/notejam/
    $ php vendor/bin/phpunit



============
Contribution
============

Do you have php/laravel experience? Help the app to follow php and laravel best practices.

Please send your pull requests in the ``master`` branch.
Always prepend your commits with framework name:

.. code-block:: bash

    Laravel: Implemented sign in functionality

Read `contribution guide <https://github.com/komarserjio/notejam/blob/master/contribute.rst>`_ for details.
