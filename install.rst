#. Download and install miniconda ::

   wget https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh
   bash Miniconda-latest-Linux-x86_64.sh


#. Get conda-recipes repositories ::

   git clone https://github.com/pkgw/conda-recipes
   git clone https://github.com/conda/conda-recipes
   git clone https://github.com/NSLS-II/conda-prescriptions


#. This is the command order ::


   wget https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh
   bash Miniconda-latest-Linux-x86_64.sh
   conda install conda-build jinja2
   sudo apt-get install g++
   conda build gettext
   # this is where I got to
   conda build glib
   conda build cairo-gobject
   conda build gobject-introspection
   conda build gsl
   conda build hkl



#. Install with apt-get ::

   sudo apt-get install gcc zlib1g-dev libffi-dev pkg-config gettext make flex bison gtk-doc-tools libgsl0-dev

Building with system packages on Debian 7
=========================================
#. Download and install miniconda ::

   wget https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh
   bash Miniconda-latest-Linux-x86_64.sh

