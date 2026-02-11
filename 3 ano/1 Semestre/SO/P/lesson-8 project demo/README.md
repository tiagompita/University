# somm25nm
SO Process Control Table Simulation System

******
******

## Prerequisites

On Ubuntu you need the following packages installed: 
_build-essential_, _cmake_, _doxygen_.

```
sudo apt install build-essential cmake doxygen
```
In other Linux distributions you need equivalent packages installed.

******

## Installing

In a directory of your choice, unpack the tarball file

```
cd «directory-of-your-choice»
tar xvzf somm25nm.tgz
```

******

## Preparing the compilation environment

In the code provided, the main program is considered a softlink to the program you actually want to run.
A test program for the JOB module is provided and it will be used to illustrate the approach.
In a terminal,

```
cd «directory-of-your-choice»
cd somm25nm
cd src
ln -s job_test.cpp main.cpp
```

Now we are in position to build the code.
In a terminal, enter the base directory of your project, create the **build** directory,
and use _cmake_ to prepare _make_ or _ninja_

```
cd «directory-of-your-choice»
cd somm25nm
mkdir build
cd build
cmake ../src
```

If you prefer _ninja_, instead of _make_,

```
cd «directory-of-your-choice»
cd somm25nm-grp
mkdir build
cd build
cmake -G Ninja ../src
```

******

## Compiling the code

In a terminal, enter the **build** directory of your project and run _make_ or _ninja_

```
cd «directory-of-your-choice»
cd somm25nm/build
make
```
or

```
cd «directory-of-your-choice»
cd somm25nm/build
ninja
```
******

## Generating documentation

The code is documented in **doxygen**. So, you can easily generate **html** documentation pages.

```
cd «directory-of-your-choice»
cd somm25nm/doc
doxygen
```
Then, you can display the pages running (inside the **doc** directory)

```
firefox html/index.html &
```

Of course, you can replace _firefox_ with your favourite browser.

******

## Testing the code

After building the code, a program will be put in the <tt>somm25nm-grp/bin</tt> directory.

Of course you can write your own testing programs. 
If you want to use the approach defined in this script, 
do not forget to create your test source code file and change the softlink of **main.cpp**



