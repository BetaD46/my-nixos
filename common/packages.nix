{ pkgs, ... }:

{
  programs.yazi.enable = true;
  environment.systemPackages = with pkgs; [
    rustc
    cargo
    uv
    msedit
    dust
  ];

  # 使 uv 安装的 python 可以使用动态链接的库
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc.lib
      glibc
      zlib
      openssl
    ];
  };

  programs.bash.interactiveShellInit = ''
    if ! [ "$TERM" = "dumb" ] && [ -z "$BASH_EXECUTION_STRING" ]; then
      exec nu
    fi
  '';
}
