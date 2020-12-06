# generated using pypi2nix tool (version: 2.0.4)
# See more at: https://github.com/nix-community/pypi2nix
#
# COMMAND:
#   pypi2nix -e webmention-tools
#

{ pkgs ? import <nixpkgs> {},
  overrides ? ({ pkgs, python }: self: super: {})
}:

let

  inherit (pkgs) makeWrapper;
  inherit (pkgs.stdenv.lib) fix' extends inNixShell;

  pythonPackages =
  import "${toString pkgs.path}/pkgs/top-level/python-packages.nix" {
    inherit pkgs;
    inherit (pkgs) stdenv;
    python = pkgs.python3;
  };

  commonBuildInputs = [];
  commonDoCheck = false;

  withPackages = pkgs':
    let
      pkgs = builtins.removeAttrs pkgs' ["__unfix__"];
      interpreterWithPackages = selectPkgsFn: pythonPackages.buildPythonPackage {
        name = "python3-interpreter";
        buildInputs = [ makeWrapper ] ++ (selectPkgsFn pkgs);
        buildCommand = ''
          mkdir -p $out/bin
          ln -s ${pythonPackages.python.interpreter} \
              $out/bin/${pythonPackages.python.executable}
          for dep in ${builtins.concatStringsSep " "
              (selectPkgsFn pkgs)}; do
            if [ -d "$dep/bin" ]; then
              for prog in "$dep/bin/"*; do
                if [ -x "$prog" ] && [ -f "$prog" ]; then
                  ln -s $prog $out/bin/`basename $prog`
                fi
              done
            fi
          done
          for prog in "$out/bin/"*; do
            wrapProgram "$prog" --prefix PYTHONPATH : "$PYTHONPATH"
          done
          pushd $out/bin
          ln -s ${pythonPackages.python.executable} python
          ln -s ${pythonPackages.python.executable} \
              python3
          popd
        '';
        passthru.interpreter = pythonPackages.python;
      };

      interpreter = interpreterWithPackages builtins.attrValues;
    in {
      __old = pythonPackages;
      inherit interpreter;
      inherit interpreterWithPackages;
      mkDerivation = args: pythonPackages.buildPythonPackage (args // {
        nativeBuildInputs = (args.nativeBuildInputs or []) ++ args.buildInputs;
      });
      packages = pkgs;
      overrideDerivation = drv: f:
        pythonPackages.buildPythonPackage (
          drv.drvAttrs // f drv.drvAttrs // { meta = drv.meta; }
        );
      withPackages = pkgs'':
        withPackages (pkgs // pkgs'');
    };

  python = withPackages {};

  generated = self: {
    "beautifulsoup4" = python.mkDerivation {
      name = "beautifulsoup4-4.9.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/3b/e4/7cfc641f11e0eef60123912611a5c9ee7d4638da7325878b695b9ae4bb6f/beautifulsoup4-4.9.0.tar.gz";
        sha256 = "594ca51a10d2b3443cbac41214e12dbb2a1cd57e1a7344659849e2e20ba6a8d8";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."soupsieve"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.crummy.com/software/BeautifulSoup/bs4/";
        license = licenses.mit;
        description = "Screen-scraping library";
      };
    };

    "certifi" = python.mkDerivation {
      name = "certifi-2020.4.5.1";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/b8/e2/a3a86a67c3fc8249ed305fc7b7d290ebe5e4d46ad45573884761ef4dea7b/certifi-2020.4.5.1.tar.gz";
        sha256 = "51fcb31174be6e6664c5f69e3e1691a2d72a1a12e90f872cbdb1567eb47b6519";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://certifiio.readthedocs.io/en/latest/";
        license = licenses.mpl20;
        description = "Python package for providing Mozilla's CA Bundle.";
      };
    };

    "chardet" = python.mkDerivation {
      name = "chardet-3.0.4";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz";
        sha256 = "84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/chardet/chardet";
        license = licenses.lgpl2;
        description = "Universal encoding detector for Python 2 and 3";
      };
    };

    "docopt" = python.mkDerivation {
      name = "docopt-0.6.2";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/a2/55/8f8cab2afd404cf578136ef2cc5dfb50baa1761b68c9da1fb1e4eed343c9/docopt-0.6.2.tar.gz";
        sha256 = "49b3a825280bd66b3aa83585ef59c4a8c82f2c8a522dbe754a8bc8d08c85c491";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docopt.org";
        license = licenses.mit;
        description = "Pythonic argument parser, that will make you smile";
      };
    };

    "idna" = python.mkDerivation {
      name = "idna-2.9";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/cb/19/57503b5de719ee45e83472f339f617b0c01ad75cba44aba1e4c97c2b0abd/idna-2.9.tar.gz";
        sha256 = "7588d1c14ae4c77d74036e8c22ff447b26d0fde8f007354fd48a7814db15b7cb";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/kjd/idna";
        license = licenses.bsdOriginal;
        description = "Internationalized Domain Names in Applications (IDNA)";
      };
    };

    "requests" = python.mkDerivation {
      name = "requests-2.23.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/f5/4f/280162d4bd4d8aad241a21aecff7a6e46891b905a4341e7ab549ebaf7915/requests-2.23.0.tar.gz";
        sha256 = "b3f43d496c6daba4493e7c431722aeb7dbc6288f52a6e04e7b6023b0247817e6";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."certifi"
        self."chardet"
        self."idna"
        self."urllib3"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://requests.readthedocs.io";
        license = licenses.asl20;
        description = "Python HTTP for Humans.";
      };
    };

    "soupsieve" = python.mkDerivation {
      name = "soupsieve-2.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/15/53/3692c565aea19f7d9dd696fee3d0062782e9ad5bf9535267180511a15967/soupsieve-2.0.tar.gz";
        sha256 = "e914534802d7ffd233242b785229d5ba0766a7f487385e3f714446a07bf540ae";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/facelessuser/soupsieve";
        license = licenses.mit;
        description = "A modern CSS selector implementation for Beautiful Soup.";
      };
    };

    "urllib3" = python.mkDerivation {
      name = "urllib3-1.25.9";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/05/8c/40cd6949373e23081b3ea20d5594ae523e681b6f472e600fbc95ed046a36/urllib3-1.25.9.tar.gz";
        sha256 = "3018294ebefce6572a474f0604c2021e33b3fd8006ecd11d62107a5d2a963527";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://urllib3.readthedocs.io/";
        license = licenses.mit;
        description = "HTTP library with thread-safe connection pooling, file post, and more.";
      };
    };

    "webmention-tools" = python.mkDerivation {
      name = "webmention-tools-0.4.1";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/9d/2f/ae83c21fb75f7713ec922de61c35c2dd01ecaa7e863029b330b9845dbb29/webmention-tools-0.4.1.tar.gz";
        sha256 = "4ca3529a9f573dcdec7aa9d2421055221e77cf5e2cdab73a37558898dab7c595";
};
      doCheck = commonDoCheck;
      format = "setuptools";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."beautifulsoup4"
        self."docopt"
        self."requests"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/Ryuno-Ki/webmention-tools";
        license = licenses.mit;
        description = "Tools for webmention.org.";
      };
    };
  };
  localOverridesFile = ./requirements_override.nix;
  localOverrides = import localOverridesFile { inherit pkgs python; };
  commonOverrides = [
        (let src = pkgs.fetchFromGitHub { owner = "nix-community"; repo = "pypi2nix-overrides"; rev = "100c15ec7dfe7d241402ecfb1e796328d0eaf1ec"; sha256 = "0akfkvdakcdxc1lrxznh1rz2811x4pafnsq3jnyr5pn3m30pc7db"; } ; in import "${src}/overrides.nix" { inherit pkgs python; })
  ];
  paramOverrides = [
    (overrides { inherit pkgs python; })
  ];
  allOverrides =
    (if (builtins.pathExists localOverridesFile)
     then [localOverrides] else [] ) ++ commonOverrides ++ paramOverrides;

in python.withPackages
   (fix' (pkgs.lib.fold
            extends
            generated
            allOverrides
         )
   )