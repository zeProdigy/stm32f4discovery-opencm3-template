## BUILD

```
$ git clone https://github.com/zeProdigy/stm32f4discovery-opencm3-template.git
$ cd stm32f4discovery-opencm3-template
$ git submodule init
$ git submodule update
$ mkdir build
$ cd build
$ cmake .. -DCMAKE_TOOLCHAIN_FILE=../Cortex-M4.cmake
$ make -j
```