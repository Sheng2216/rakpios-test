#!/bin/bash -e

# Create a directory structure to store run once scripts
on_chroot << EOF
mkdir -p /etc/local/runonce.d/ran/
# mkdir -p /usr/local/bin/
EOF

# copy portainer.sh.sample
cp files/portainer.sh.sample "${ROOTFS_DIR}/etc/local/runonce.d/"
echo "1"
# copy the runonce script
cp files/runonce "${ROOTFS_DIR}/usr/local/bin/"
echo "2"
# copy the rc.local script
cp files/rc.local "${ROOTFS_DIR}/etc/rc.local"
echo "3"

# configure the portainer premission
on_chroot << EOF
chown ${FIRST_USER_NAME}:${FIRST_USER_NAME} /etc/local/runonce.d/portainer.sh.sample
echo "4"
chmod +x /etc/local/runonce.d/portainer.sh.sample
echo "5"
EOF

