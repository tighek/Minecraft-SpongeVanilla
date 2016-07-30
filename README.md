# SpongeVanilla

This builds a SpongeVanilla container

#### Pull the image
```
docker pull tighek/minecraft-spongevanilla
```

#### Quick test without preserving your worlds

##### Create a container and publish the required tcp/udp ports
```
docker run -d --name sponge -p 25565:25565 -p 25565:25565/udp -t tighek/minecraft-spongevanilla
```

#### Running with your world data in a data only contrainer

##### Create the data only container
```
docker create -v /srv/minecraft --name minecraft_data busybox:latest /bin/true
```

##### Create the SpongeVanilla container
```
docker run -d --name spongevanilla --volumes-from minecraft_data --restart=always -p 25565:25565 -p 25565:25565/udp tighek/minecraft-spongevanilla:latest
```

#### Running with your world data in a local directory

##### Create the SpongeVanilla container
```
docker run -d --name spongevanilla --volume /local_directory:/srv/minecraft --restart=always -p 25565:25565 -p 25565:25565/udp tighek/minecraft-spongevanilla:latest
```

#### Migrate data from another container or backup your world by starting a Linux container 
attached to your sponge container.
```
docker run --name sponge_attach --volumes-from minecraft_data -v /mountpoint:/mountpoint -i -t ubuntu:latest /bin/bash
```

At the Linux prompt, your sponge's /srv/minecraft is available and you can copy into /mountpoint 
which maps to your local Linux /mountpoint



