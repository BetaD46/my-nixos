test:
    sudo nixos-rebuild test -j 12 --flake=$(pwd)#hhh
switch:
    sudo nixos-rebuild switch -j 12 --flake=$(pwd)#hhh
clean:
    sudo nix-collect-garbage -d
update:
    nix flake update
update-switch: update switch
