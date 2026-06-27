# MacTahoe GTK theme, icons, and cursors from vinceliuice's repos.
pkgs:

{
  macTahoeTheme = pkgs.stdenvNoCC.mkDerivation {
    pname = "mactahoe-gtk-theme";
    version = "master";

    src = pkgs.fetchFromGitHub {
      owner = "vinceliuice";
      repo = "MacTahoe-gtk-theme";
      rev = "master";
      hash = "sha256-/XTUUq5Uyuxgr0cZTmkUmj2/NrM1GEZ7pgrnlqKI6K0=";
    };

    dontBuild = true;

    installPhase = ''
      mkdir -p $out/share/themes
      cp -r src/* $out/share/themes/
    '';
  };

  mactahoe-icons = pkgs.stdenvNoCC.mkDerivation {
    pname = "mactahoe-icon-theme";
    version = "unstable";

    src = pkgs.fetchFromGitHub {
      owner = "vinceliuice";
      repo = "MacTahoe-icon-theme";
      rev = "main";
      sha256 = "sha256-YCtpagkXhRwD9NJRvgskq7yf4qr4XqUxQYUfyKD7mUs=";
    };

    installPhase = ''
      mkdir -p $out/share/icons
      cp -r src/* $out/share/icons/
    '';
  };

  mactahoe-cursors = pkgs.stdenvNoCC.mkDerivation {
    pname = "mactahoe-cursors";
    version = "unstable";

    src = pkgs.fetchFromGitHub {
      owner = "vinceliuice";
      repo = "MacTahoe-icon-theme";
      rev = "main";
      sha256 = "sha256-YCtpagkXhRwD9NJRvgskq7yf4qr4XqUxQYUfyKD7mUs=";
    };

    installPhase = ''
      mkdir -p $out/share/icons/MacTahoe
      cp -r cursors/* $out/share/icons/MacTahoe/
    '';
  };
}
