{
  config,
  pkgs,
  inputs,
  ...
}:

let
  inherit (import ../packages/mactahoe.nix pkgs)
    macTahoeTheme
    mactahoe-icons
    mactahoe-cursors
    ;
in
{
  imports = [
    inputs.plasma-manager.homeModules.plasma-manager
  ];

  home.packages = with pkgs; [
    sassc
    macTahoeTheme
    mactahoe-icons
    mactahoe-cursors
    tela-circle-icon-theme
    orchis-theme
  ];

  programs.plasma = {
    enable = true;

    kwin = {
      effects = {
        blur.enable = true;
      };
    };
  };

  xdg.configFile."gtk-3.0/settings.ini".force = true;
  xdg.configFile."gtk-4.0/settings.ini".force = true;
  xdg.configFile."kdeglobals".force = true;
  xdg.configFile."kdeglobals".text = ''
    [Icons]
    Theme=MacTahoe
    [Cursor]
    Theme=MacTahoe
    Size=24
  '';

  home.pointerCursor = {
    package = mactahoe-cursors;
    name = "MacTahoe";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  qt = {
    enable = true;
    platformTheme = "qtct";
  };

  gtk = {
    enable = true;

    theme = {
      name = "MacTahoe-Dark";
      package = macTahoeTheme;
    };

    iconTheme = {
      name = "MacTahoe";
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
}
