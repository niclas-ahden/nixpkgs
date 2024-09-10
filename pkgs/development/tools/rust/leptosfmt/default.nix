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
    rev = "79982e1b75c2470b4cb2789c5c7809fd8b311095";
    hash = "sha256-0bLZQEUPcxnrocob5wI9p9TDKHg0RrjkahncCGcMhUE=";
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
