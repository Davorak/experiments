

You can read about container managmement [in the manual](https://nixos.org/releases/nixos/latest/manual/ch-containers.html). In general you need to be on nixos and be root before you run any of these commands.

The below instructions use the mutable container commands to create and edit `nixos-container`s.

To create a container:
```
cat <fileName>.nix | xargs -0 nixos-container create <containerName> --config
```

To update a container:
```
cat <fileName>.nix | xargs -0 nixos-container update <containerName> --config
```
Careful, removing a seting in the config file and updating the container does not remove the setting since thise a mutable commands. `destory` the container and `create` a new one when in doubt.
