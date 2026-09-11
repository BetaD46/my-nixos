# 通用 home.nix
{ ... }:

{
  home.stateVersion = "26.05";

  programs = {
    nushell = {
      enable = true;
      configFile.source = ../configs/nushell/config.nu;
    };

    zoxide = {
      enable = true;
      enableBashIntegration = true;
      options = [
        "--cmd cd" # 这将用 zoxide 替换 cd 命令
      ];
    };

    git = {
      enable = true;
      lfs.enable = true;
      includes = [
        {
          contents = {
            user = {
              name = "wjf";
              email = "1057403878@qq.com";
            };
            http.proxy = "http://localhost:7897";
            https.proxy = "http://localhost:7897";
          };
        }
      ];
      ignores = [
        "**.local**"
      ];
      settings = {
        credential.helper = "libsecret";
      };
    };

    starship = {
      enable = true;
      enableNushellIntegration = true;
    };

    bash = {
      enable = true;
      bashrcExtra = ''
        if ! [ -f "$HOME/.zoxide.nu" ];
        then
          zoxide init nushell > "$HOME/.zoxide.nu"
          echo "Zoxide init nushell done."
        fi
      '';
    };
  };
  xdg.configFile."./starship.toml".source = ../configs/starship.toml;

  # 设置用户目录为默认英文
  xdg.userDirs.enable = true;

  # 设置 cargo、pnpm 的 bin 目录
  home.sessionPath = [
    "$HOME/.cargo/bin"
    "$HOME/.local/share/pnpm/bin"
  ];
}
