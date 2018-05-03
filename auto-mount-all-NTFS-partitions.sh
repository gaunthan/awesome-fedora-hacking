#!/usr/bin/env bash

# is_mounted <partition>
is_mounted()
{
  part=$1
  mountpoint=$(lsblk -o MOUNTPOINT $part | grep -v 'MOUNTPOINT')
  if [[ -z "$mountpoint" ]]; then
	echo false
  else
	echo true
  fi
}

# mount_partition <partition> <mountpoint>
mount_partition()
{
  part=$1
  mountpoint=$2
  mount_options='rw'
  if [[ $(is_mounted $part) = true ]]; then
	mount_options=${mount_options},remount
  fi
  sudo mount -o $mount_options $part "$mountpoint"
}

ntfs_partitions=$(sudo fdisk -l | grep 'Microsoft basic data' | cut -d' ' -f1)

for part in $ntfs_partitions; do
  label=$(lsblk -o label $part | grep -v 'LABEL')
  mountpoint=$HOME/${label}

  echo "Mounting $part to $mountpoint"
  mkdir -p "$mountpoint"
  mount_partition $part $mountpoint
done

echo "All NTFS partitions are mounted. Would you like to make it automatic by modifying /etc/fstab?"
echo -n "Input your choose(y/n): "

read write_to_fstab
if [[ "$write_to_fstab" = "y" ]]; then
  echo "Writing mount info to /etc/fstab"
fi


