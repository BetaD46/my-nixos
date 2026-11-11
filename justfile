list:
    cat justfile
test:
    #!/usr/bin/env bash
    read -p "Flake: " flake_name
    sudo nixos-rebuild test --flake=$(pwd)#${flake_name} --impure
switch:
    #!/usr/bin/env bash
    read -p "Flake: " flake_name
    sudo nixos-rebuild switch --flake=$(pwd)#${flake_name} --impure
boot:
    #!/usr/bin/env bash
    read -p "Flake: " flake_name
    sudo nixos-rebuild boot --flake=$(pwd)#${flake_name} --impure
clean:
    sudo nix-collect-garbage -d
update:
    nix flake update
