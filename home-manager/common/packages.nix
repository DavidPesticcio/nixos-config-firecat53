{
  inputs,
  pkgs,
  ...
}: let
  my-python-packages = ps:
    with ps; [
      ansible
      ansible-core
      grip
      ipython
      ipdb
      pip
      pipx
      podman
      python-lsp-ruff
    ];
in {
  home.packages = with pkgs; [
    # Terminal tools
    age
    atool
    autossh
    bottom
    distrobox
    dua
    elinks
    eternal-terminal
    fd
    mosh
    ripgrep
    sops
    stow
    udiskie
    unzip
    # Terminal applications
    bitwarden-cli
    exiftool
    gomuks
    hcloud
    home-manager
    mediainfo
    ncspot
    pianobar
    ranger
    sshfs
    tabview
    todoman
    vim-full # TODO
    w3m
    # Development tools
    alejandra
    ctags
    hatch
    highlight
    (python311.withPackages my-python-packages)
    ruff
    tig
    # Gui applications
    alacritty
    inputs.bwm.packages.${pkgs.system}.default
    dmenu
    electrum
    firefox
    gnome.simple-scan
    hunspell
    hunspellDicts.en-us-large
    imv
    keepassxc
    inputs.keepmenu.packages.${pkgs.system}.default
    libreoffice
    mpv
    pinentry-qt
    spotify
    ungoogled-chromium
    ventoy
    wl-clipboard
    zathura
  ];
}