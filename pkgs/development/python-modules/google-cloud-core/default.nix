{ lib
, buildPythonPackage
, fetchPypi
, pythonOlder
, pytestCheckHook
, python
, google-api-core
, grpcio
, mock
}:

buildPythonPackage rec {
  pname = "google-cloud-core";
  version = "1.7.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-sQMKrcuyrrTuUUdUJjUa+DwQckVrkY+4/bgGZsS7Y7U=";
  };

  propagatedBuildInputs = [ google-api-core ];

  checkInputs = [ mock pytestCheckHook ];

  # prevent google directory from shadowing google imports
  preCheck = ''
    rm -r google
  '';

  pythonImportsCheck = [ "google.cloud" ];

  meta = with lib; {
    description = "API Client library for Google Cloud: Core Helpers";
    homepage = "https://github.com/googleapis/python-cloud-core";
    license = licenses.asl20;
    maintainers = with maintainers; [ SuperSandro2000 ];
  };
}
