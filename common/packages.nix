{ pkgs, ... }:

{
  programs.yazi.enable = true;
  environment.systemPackages = with pkgs; [
    gcc
    rust-analyzer
    rustup
    uv
    helix
    unzip
    just
    bun
    nodejs
    pnpm
    python3
    gnumake
    lsof # 查看进程使用的文件
    dust # 检查空间占用
    libsecret # 密钥管理
    gitFull # 完整 git 工具，包括密钥使用
    watchexec # 监控执行
    hurl # 请求模拟
    pkg-config
    tmux # 终端复用
    unrar # 解压 rar
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
