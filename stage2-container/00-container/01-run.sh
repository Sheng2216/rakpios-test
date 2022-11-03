#!/bin/bash -e

# Create a directory structure to store run once scripts
on_chroot << EOF
mkdir -p /etc/local/runonce.d/ran
EOF

# copy portainer.sh.sample
cp files/portainer.sh.sample "${ROOTFS_DIR}/etc/local/runonce.d"
# copy the runonce script
cp files/runonce "${ROOTFS_DIR}/etc/local/bin/runonce"
# copy the rc.local script
cp files/rc.local "${ROOTFS_DIR}/etc/rc.local"


# configure the portainer premission
on_chroot << EOF
chown ${FIRST_USER_NAME}:${FIRST_USER_NAME} /etc/local/runonce.d/portainer.sh.sample
chmod +x /etc/local/runonce.d/portainer.sh.sample
EOF

