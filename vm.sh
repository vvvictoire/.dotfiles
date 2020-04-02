#!/usr/bin/zsh

#export VMWARE_USE_SHIPPED_LIBS=force  
  
mount | grep "bindfs on /home/trucy/vm/Windows 8.x x64" > /dev/null  
  
if [[ $? -ne 0 ]]; then  
  
  sudo mount -o multithreaded -t fuse.bindfs '/home/trucy/vm/Windows 8.x x64' '/home/trucy/vm/Windows 8.x x64' > /dev/null  
  
  if [[ $? -ne 0 ]]; then  
  
echo "Bindfs mount failed. Please check if bindfs is correctly installed."  
  
exit 1  
  
  fi  
  
fi  
  
vmplayer '/home/trucy/vm/Windows 8.x x64/Windows 8.x x64.vmx' 
  
sudo umount '/home/trucy/vm/Windows 8.x x64' > /dev/null  
  
exit 0  