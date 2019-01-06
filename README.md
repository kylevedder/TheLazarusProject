# Install

The Lazarus Project can be downloaded via:

```
wget -qO- goo.gl/0emHna | bash
```

or

```
wget -qO- tinyurl.com/TheLazarusProject | bash
```

or

```
wget -qO- https://raw.githubusercontent.com/kylevedder/TheLazarusProject/master/easy_install.sh | bash
```

This should work on all fresh Ubuntu systems with no prior dependencies. Tested on 18.04 LTS and 16.04 LTS.

Once The Lazarus Project is installed, select the desired layers in `lazarus.layers`, and then run the installer with:

```
./run_me.py
```

# Layers

Layers are stored inside `layers/` and are referred to by their folder name. A layer is installed by running the `install` script immeditely inside of its containing folder. Each of these `install` scripts are self contained, and thus can be written in a variety of scripting languages.
