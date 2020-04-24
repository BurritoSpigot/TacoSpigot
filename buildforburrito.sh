#!/bin/bash

#Very hacky script
rm -r ./BurritoTemp
rm -r ./BurritoBuild
bash ./build.sh
mkdir BurritoTemp
cd BurritoTemp
wget https://github.com/CoolMineman/JarJarPatcher/releases/download/v1.0/JarJarPatcher-1.0.jar
mkdir HackyHack
cp ../work/Paperclip/TacoSpigot.jar ./HackyHack/TacoSpigot.jar
cd HackyHack
java -jar ./TacoSpigot.jar #generate normal jar
cp ./cache/patched.jar ../TacoSpigot.jar
cd ..
#Now in burrito temp with the real jar
wget https://launcher.mojang.com/v1/objects/5fafba3f58c40dc51b5c3ca72a98f62dfdae1db7/server.jar
java -jar ./JarJarPatcher-1.0.jar jartotar server.jar server.tar
java -jar ./JarJarPatcher-1.0.jar jartotar TacoSpigot.jar TacoSpigot.tar
mkdir ../BurritoBuild
java -jar ./JarJarPatcher-1.0.jar genpatch server.tar TacoSpigot.tar ../BurritoBuild/TacoSpigot.patch
cd ..
rm -r ./BurritoTemp