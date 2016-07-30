# SpongeVanilla

This builds a SpongeVanilla container

##### Pull the image
```
docker pull tighek/Minecraft-SpongeVanilla
```

##### Create a container and publish the required tcp/udp ports
```
docker run -d --name sponge -p 25565:25565 -p 25565:25565/udp -t tighek/Minecraft-SpongeVanilla
```

##### Migrate data from another container or backup your world by starting a Linux container 
attached to your sponge container.
```
docker run --name sponge_attach --volumes-from sponge -v /mountpoint:/mountpoint -i -t ubuntu /bin/bash
```

At the Linux prompt, your sponge's /srv/minecraft is available and you can copy into /mountpoint 
which maps to your local Linux /mountpoint



