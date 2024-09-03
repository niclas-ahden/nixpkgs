{ lib
, rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage rec {
  pname = "leptosfmt";
  version = "0.1.30";

  src = fetchFromGitHub {
    owner = "bram209";
    repo = "leptosfmt";
    rev = "c71652c1209367846864b3c2d7dc52fdcf37bd0e";
    hash = "sha256-FQKGmcmF3scJ8mQM1Mkokp5JnCHb4GR7BWJW379rSVc=";
    fetchSubmodules = true;
  };

  cargoHash = "sha256-UHMhQ34P7aMr6oa6sPR/SakhRA0OElOX5tZjCQtla/c=";

  meta = with lib; {
    description = "Formatter for the leptos view! macro";
    mainProgram = "leptosfmt";
    homepage = "https://github.com/bram209/leptosfmt";
    changelog = "https://github.com/bram209/leptosfmt/blob/${src.rev}/CHANGELOG.md";
    license = with licenses; [ asl20 mit ];
    maintainers = with maintainers; [ figsoda ];
  };
}
