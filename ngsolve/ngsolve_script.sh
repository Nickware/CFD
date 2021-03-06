# Script Install Ngsolve 
# Preparing installation and build Binaries
# Test in Deepin 15.8
#Autores: N.Torres
#jntorresr@udistrital.edu.co
#Version: 0.0.2
#Fecha: 12-12-2018
# https://ngsolve.org/docu/latest/install/installlinux.html
# https://ngsolve.org/docu/latest/install/cmakeoptions.html?highlight=opencascade
# It must be installed before starting to prepare the installation
sudo apt install libavcodec-ffmpeg-dev
sudo apt install libavformat-ffmpeg-dev
sudo apt install libavutil-ffmpeg-dev
sudo apt search libswscale
sudo apt install libswscale-ffmpeg-dev
#Remove previus versions
echo 'Borrando versiones previas'
rm -rf /opt/ngsuite
#Requeriment
echo 'Verificando requerimientos'
apt-get update && sudo apt-get -y install python3 python3-tk libpython3-dev libxmu-dev tk-dev tcl-dev cmake git g++ libglu1-mesa-dev liblapacke-dev
#Optional 
echo 'Requerimientos opcionales'
apt-get update
apt-get install liboce-ocaf-dev
#Ubication
echo 'Preparando la carpeta de ubicación'
export BASEDIR=/opt/ngsuite
mkdir -p $BASEDIR
cd $BASEDIR
#Source
echo 'Obteniendo las fuentes'
git clone https://github.com/NGSolve/ngsolve.git ngsolve-src
cd $BASEDIR/ngsolve-src
git submodule update --init --recursive
#Adaptation
echo 'Preparando las carpetas para construir e instalar'
mkdir $BASEDIR/ngsolve-build
mkdir $BASEDIR/ngsolve-install
cd $BASEDIR/ngsolve-build
#Configuration
echo 'Preparando la instalación'
cmake -DUSE_OCC=ON -DUSE_JPEG=ON -DUSE_MPEG=ON -DCMAKE_INSTALL_PREFIX=${BASEDIR}/ngsolve-install ${BASEDIR}/ngsolve-src
#Instalation
echo 'Construyendo'
echo 'Este proceso se puede demorar de 20 a 30 minutos (Dependiendo las especificaciones tecnicas de cada maquina)'
make -j4 install
#echo "export NETGENDIR=${BASEDIR}/ngsolve-install/bin" >> ~/.bashrc
#echo "export PATH=\$NETGENDIR:\$PATH" >> ~/.bashrc
#source ~/.bashrc
