with import <nixpkgs> {};

stdenv.mkDerivation rec{
  name = "wacomtablet-3.1.0";

  src = fetchurl {
    url = https://github.com/KDE/wacomtablet/archive/v3.1.0.tar.gz;
    sha256 = "9d75ab0be78f3e47e55d8ee279c85a51815cae9b5ead311834c0362ffedbe29a";
  };

  meta = {
    description = "This module implements a GUI for the Wacom Linux Drivers";
    license = "GPLv2";
  };

  nativeBuildInputs = [ extra-cmake-modules kdoctools ];

  buildInputs = let
     k = kdeFrameworks;

  in [
    qt5.qtx11extras qt5.qtdeclarative k.kcoreaddons k.ki18n k.kdbusaddons
    k.kglobalaccel k.kwindowsystem k.kconfig k.kxmlgui k.knotifications
    k.plasma-framework k.kdoctools xorg.libXi xf86_input_wacom libwacom 
  ];
}