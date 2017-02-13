


# Dependencies

## Pharo
 * Version Ubuntu 14.04 or later 

 sudo dpkg --add-architecture i386 
 sudo apt-get update 
 sudo apt-get install libx11-6:i386 
 sudo apt-get install libgl1-mesa-glx:i386 
 sudo apt-get install libfontconfig1:i386 
 sudo apt-get install libssl1.0.0:i386 

* Version Lesser than Ubuntu 14.04
  sudo dpkg --add-architecture i386
  sudo apt-get update
  sudo apt-get install ia32-libs

## RHash

 sudo apt-get install rhash

## Solidity
 npm install solc


# Installation 

## Download the code 

mkdir myfolder
git clone git@github.com:sbragagnolo/Fog.git
git checkout 


## Building the application 

  After installing all the dependencies proceed to execute the installation script into the cloned folder
 
cd myfolder
./build.sh

  Now you can copy the content of the build folder wherever you want, add it to the path and execute the viewer just by calling it 


## Tips

 *  Known contracts are supposed to be at least linked to the contract folder. 
 *  To use the testing contracts startup the geth client by using the script at scripts/dev.sh


#Usage 


## configuring the app

You can edit the json-viewer.st and html-viewer.st files. 

``` 
" Contract folder location. You can chance this value by '/absolute/path' asFileReference " 
contractsLocation :=  FileLocator contractsFolder.
" URL of the local network node geth node. " 
gethURL := 'http://localhost:8545'.
```


## Viewing contract instances

The viewer script returns a Json/Html encoded object with the variable values and the contract name.


viewer.sh json <ADDRESS-TO-CONTRACT>
viewer.sh html <ADDRESS-TO-CONTRACT> > output.html 
















