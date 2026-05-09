{ pkgs, ... }:

{
  programs.yazi.enable = true;
  environment.systemPackages = with pkgs; [
    git
    rustc
    cargo
    nushell
    msedit
    dust
  ];
  programs.bash.interactiveShellInit = ''
    if ! [ "$TERM" = "dumb" ] && [ -z "$BASH_EXECUTION_STRING" ]; then
      exec nu
    fi
  '';
}
