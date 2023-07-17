#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# 修改主机名 OP
sed -i "s/hostname='ImmortalWrt'/hostname='360T7'/g" package/base-files/files/bin/config_generate

# ???
MTK_HNAT(){
  rm -rf target/linux/mediatek/files-5.4/drivers/net/ethernet/mediatek/mtk_hnat
  svn co https://github.com/padavanonly/immortalwrtARM/branches/mt7981/target/linux/mediatek/files-5.4/drivers/net/ethernet/mediatek/mtk_hnat
  mv mtk_hnat target/linux/mediatek/files-5.4/drivers/net/ethernet/mediatek/mtk_hnat
}

MT_WIFI(){
  rm -rf package/mtk/drivers/mt_wifi
  svn co https://github.com/padavanonly/immortalwrtARM/branches/mt7981/package/mtk/drivers/mt_wifi
  mv mt_wifi package/mtk/drivers/mt_wifi
}

MTK_HNAT
echo '-------------------------------------------------------------------------------------------------'
MT_WIFI
