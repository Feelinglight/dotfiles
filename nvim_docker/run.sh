docker run \
  -it \
  --rm \
  --cap-add SYS_ADMIN \
  --device /dev/fuse \
  -v ./nvim_config:/root/.config/nvim \
  --security-opt apparmor:unconfined \
  nvim


