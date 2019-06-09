################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2012 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="yabasanshiro"
#PKG_VERSION="915cddf"
PKG_VERSION="HEAD"
PKG_GIT_BRANCH="switch_ubuntu"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/devmiyax/yabause.git"
PKG_GIT_URL="$PKG_SITE"
PKG_DEPENDS_TARGET="toolchain cmake:host SDL2 boost $OPENGL"
PKG_PRIORITY="optional"
PKG_SECTION="lakka"
PKG_SHORTDESC="yabause"
PKG_LONGDESC="yabause"


#PKG_VERSION="HEAD"
#PKG_GIT_BRANCH="switch_ubuntu"
#PKG_ARCH="any"
#PKG_LICENSE="GPLv2"
#PKG_SITE="https://gitlab.com/devMiyax/yabasanshiro.git"
#PKG_GIT_URL="$PKG_SITE"
#PKG_PRIORITY="optional"
#PKG_SECTION="virtual"
#PKG_SHORTDESC="YabaSanshiro"
#PKG_LONGDESC="YabaSanshiro"
#PKG_DEPENDS_TARGET="toolchain cmake:host boost $OPENGL"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_USE_CMAKE="yes"

#make_target() {
#  mkdir build
#  cd build
#  cmake  ../yabause -DYAB_PORTS=retro_arena -DYAB_WANT_DYNAREC_DEVMIYAX=ON -DCMAKE_TOOLCHAIN_FILE=../yabause/src/retro_arena/switch.cmake 
#  make
#}
PKG_CMAKE_SCRIPT="${PKG_BUILD}/yabause/CMakeLists.txt"

PKG_CMAKE_OPTS_TARGET=" \
  -DINSTALL_RETRO_ARENA=OFF \
  -DUSE_EGL=OFF \
  -DSDL_BUILD=OFF \
  -DYAB_PORTS=retro_arena \
  -DYAB_WANT_DYNAREC_DEVMIYAX=ON "


#TARGET_CFLAGS="-D__SWITCH__ -D__RETORO_ARENA__ -D_POSIX_C_SOURCE=199309L ${TARGET_CFLAGS}"
#TARGET_CXXFLAGS="-D__SWITCH__ -D__RETORO_ARENA__ -D_POSIX_C_SOURCE=199309L ${TARGET_CFLAGS}"

#  -DCMAKE_C_FLAGS=\"-D__SWITCH__ -D__RETORO_ARENA__ -D_POSIX_C_SOURCE=199309L\" \
#  -DCMAKE_CXX_FLAGS=\"-D__SWITCH__ -D__RETORO_ARENA__ -D_POSIX_C_SOURCE=199309L\" \

#-DCMAKE_BUILD_TYPE=Release \  
#-DCMAKE_TOOLCHAIN_FILE=${PKG_BUILD}/yabause/src/retro_arena/switch.cmake
PKG_CMAKE_OPTS_HOST=${PKG_CMAKE_OPTS_TARGET}

#re_make_target() {
  # build fix for cross-compiling Dolphin, from Dolphin forums
#  find $PKG_BUILD -name flags.make -exec sed -i "s:isystem :I:g" \{} \;
#}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin/
  cp -P $PKG_DIR/scripts/yabarun.sh $INSTALL/usr/bin/yabarun.sh
  cp $PKG_BUILD/.$TARGET_NAME/src/retro_arena/yabasanshiro $INSTALL/usr/bin/
  #make install
  mkdir -p $INSTALL/usr/share/yabasanshiro/
  cp $PKG_BUILD/yabause/src/retro_arena/keymapv2_switch.json  $INSTALL/usr/share/yabasanshiro/keymapv2.json
  #cp ~/RetroPie/BIOS/saturn/bios.bin $INSTALL/usr/share/yabasanshiro/bios.bin
}

#post_makeinstall_target() {
#  rm -rf $INSTALL/usr/bin
#  rm -f $SYSROOT_PREFIX/usr/bin/ybasanshiro
#}

post_install() {
  ln -sf yabasanshiro.target $INSTALL/usr/lib/systemd/system/default.target                                                                   
  enable_service yabasanshiro-autostart.service                                                                                               
  enable_service yabasanshiro.service
}

  
