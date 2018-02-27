# Copyright 2017 The Bazel Authors. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
"""package_names.bzl contains definitions of functions that return lists of package names.

This includes all package names for a given distro (i.e., def
<distro>_package_names) as well as private defs defining all packages for a
given tool (a tool requires several packages to be installed). This file also
contains a struct with the names of all tools. Lastly, this file defines a map
from tools to package names for each distro (i.e., def <distro>_tools()).
"""

tool_names = struct(
    bazel = "bazel",
    binutils = "binutils",
    curl = "curl",
    ed = "ed",
    file = "file",
    gcc = "gcc",
    git = "git",
    java = "java",
    java_no_ca_certs = "java_no_ca_certs",
    lib_cpp = "lib_cpp",
    openssh_client = "openssh_client",
    python3_dev = "python3_dev",
    python3_numpy = "python3_numpy",
    python3_pip = "python3_pip",
    python_dev = "python_dev",
    python_numpy = "python_numpy",
    python_pip = "python_pip",
    wget = "wget",
    zip = "zip",
)

def stretch_tools():
  return {
      tool_names.binutils: _stretch_binutils_package_names(),
      tool_names.curl: _stretch_curl_package_names(),
      tool_names.ed: _stretch_ed_package_names(),
      tool_names.file: _stretch_file_package_names(),
      tool_names.gcc: _stretch_gcc_package_names(),
      tool_names.git: _stretch_git_package_names(),
      tool_names.java: _stretch_java_package_names(),
      tool_names.java_no_ca_certs: _stretch_java_no_ca_certs_package_names(),
      tool_names.lib_cpp: _stretch_lib_cpp_package_names(),
      tool_names.openssh_client: _stretch_openssh_client_package_names(),
      tool_names.python_dev: _stretch_python_dev_package_names(),
      tool_names.python_numpy: _stretch_python_numpy_package_names(),
      tool_names.python_pip: _stretch_python_pip_package_names(),
      tool_names.python3_dev: _stretch_python3_dev_package_names(),
      tool_names.python3_numpy: _stretch_python3_numpy_package_names(),
      tool_names.python3_pip: _stretch_python3_pip_package_names(),
      tool_names.wget: _stretch_wget_package_names(),
      tool_names.zip: _zip_package_names(),
  }

def stretch_package_names():
  return _package_names(stretch_tools)

def _package_names(tools):
  packages = []
  for tool in tools().values():
    packages.extend(tool)
  return depset(packages).to_list()

def _stretch_binutils_package_names():
  return [
      "binutils",
  ]

def _stretch_curl_package_names():
  return [
      "curl",
      "libcurl3",
      "libffi6",
      "libgmp10",
      "libgnutls30",
      "libgssapi-krb5-2",
      "libhogweed4",
      "libidn11",
      "libk5crypto3",
      "libkeyutils1",
      "libkrb5-3",
      "libkrb5support0",
      "libldap-2.4-2",
      "libnettle6",
      "libp11-kit0",
      "librtmp1",
      "libsasl2-2",
      "libsasl2-modules-db",
      "libssh2-1",
      "libtasn1-6",
      "libnghttp2-14",
      "libidn2-0",
      "libunistring0",
  ]

def _stretch_gcc_package_names():
  return [
      "binutils",
      "cpp",
      "cpp-6",
      "g++",
      "g++-6",
      "gcc",
      "gcc-6",
      "libasan3",
      "libatomic1",
      "libc-dev-bin",
      "libc6-dev",
      "libcilkrts5",
      "libcloog-isl4",
      "libgcc-6-dev",
      "libgmp10",
      "libgomp1",
      "libisl15",
      "libitm1",
      "liblsan0",
      "libmpc3",
      "libmpfr4",
      "libquadmath0",
      "libstdc++-6-dev",
      "libtsan0",
      "libubsan0",
      "linux-libc-dev",
  ]

def _stretch_ed_package_names():
  return [
      "ed",
  ]

def _stretch_file_package_names():
  return [
      "file",
      "libmagic1",
  ]

def _stretch_git_package_names():
  return [
      "git",
      "git-man",
      "libcurl3-gnutls",
      "liberror-perl",
      "libexpat1",
      "libffi6",
      "libgdbm3",
      "libgmp10",
      "libgnutls30",
      "libgssapi-krb5-2",
      "libhogweed4",
      "libidn11",
      "libk5crypto3",
      "libkeyutils1",
      "libkrb5-3",
      "libkrb5support0",
      "libldap-2.4-2",
      "libnettle6",
      "libp11-kit0",
      "librtmp1",
      "libsasl2-2",
      "libsasl2-modules-db",
      "libssh2-1",
      "libtasn1-6",
      "perl",
      "perl-modules-5.24",
      # Though not strictly required, we get a 'Problem with the SSL CA cert'
      # errror w/o these packages
      "ca-certificates",
      "libssl1.0.2",
      "openssl",
  ]

def _stretch_java_no_ca_certs_package_names():
  return [
      "fontconfig-config",
      "fonts-dejavu-core",
      "java-common",
      "libavahi-client3",
      "libavahi-common-data",
      "libavahi-common3",
      "libcups2",
      "libdbus-1-3",
      "libexpat1",
      "libffi6",
      "libfontconfig1",
      "libfreetype6",
      "libgmp10",
      "libgnutls30",
      "libgssapi-krb5-2",
      "libhogweed4",
      "libjpeg62-turbo",
      "libk5crypto3",
      "libkeyutils1",
      "libkrb5-3",
      "libkrb5support0",
      "liblcms2-2",
      "libnettle6",
      "libnspr4",
      "libnss3",
      "libp11-kit0",
      "libpcsclite1",
      "libpng16-16",
      "libsqlite3-0",
      "libtasn1-6",
      "libx11-6",
      "libx11-data",
      "libxau6",
      "libxcb1",
      "libxdmcp6",
      "libxext6",
      "libxi6",
      "libxrender1",
      "libxtst6",
      "openjdk-8-jdk-headless",
      "openjdk-8-jre-headless",
      "ucf",
      "x11-common",
      "zlib1g",
  ]

def _stretch_java_package_names():
  return _stretch_java_no_ca_certs_package_names() + ["ca-certificates-java"]

def _stretch_lib_cpp_package_names():
  return [
      "libasan3",
      "libatomic1",
      "libc-dev-bin",
      "libc6-dev",
      "libcilkrts5",
      "libgcc-6-dev",
      "libgomp1",
      "libitm1",
      "liblsan0",
      "libquadmath0",
      "libstdc++-6-dev",
      "libtsan0",
      "libubsan0",
      "linux-libc-dev",
  ]

def _stretch_openssh_client_package_names():
  return [
      "libbsd0",
      "libedit2",
      "libgssapi-krb5-2",
      "libk5crypto3",
      "libkeyutils1",
      "libkrb5-3",
      "libkrb5support0",
      "openssh-client",
  ]

def _stretch_python3_dev_package_names():
  return [
      "dh-python",
      "libc-dev-bin",
      "libc6-dev",
      "libexpat1",
      "libexpat1-dev",
      "libffi6",
      "libmpdec2",
      "libpython3-dev",
      "libpython3-stdlib",
      "libpython3.5",
      "libpython3.5-dev",
      "libpython3.5-minimal",
      "libpython3.5-stdlib",
      "libsqlite3-0",
      "linux-libc-dev",
      "mime-support",
      "python3",
      "python3-dev",
      "python3-minimal",
      "python3.5",
      "python3.5-dev",
      "python3.5-minimal",
  ]

def _stretch_python3_numpy_package_names():
  return [
      "dh-python",
      "libblas-common",
      "libblas3",
      "libexpat1",
      "libffi6",
      "libgfortran3",
      "liblapack3",
      "libmpdec2",
      "libpython3-stdlib",
      "libpython3.5-minimal",
      "libpython3.5-stdlib",
      "libquadmath0",
      "libsqlite3-0",
      "mime-support",
      "python3",
      "python3-minimal",
      "python3-numpy",
      "python3.5",
      "python3.5-minimal",
  ]

def _stretch_python3_pip_package_names():
  return [
      "dh-python",
      "libexpat1",
      "libffi6",
      "libmpdec2",
      "libpython3-stdlib",
      "libpython3.5-minimal",
      "libpython3.5-stdlib",
      "libsqlite3-0",
      "mime-support",
      "python3",
      "python3-chardet",
      "python3-colorama",
      "python3-distlib",
      "python3-html5lib",
      "python3-minimal",
      "python3-pip",
      "python3-pkg-resources",
      "python3-requests",
      "python3-setuptools",
      "python3-six",
      "python3-urllib3",
      "python3.5",
      "python3.5-minimal",
  ]

def _stretch_python_dev_package_names():
  return [
      "libc-dev-bin",
      "libc6-dev",
      "libexpat1",
      "libexpat1-dev",
      "libffi6",
      "libpython-dev",
      "libpython-stdlib",
      "libpython2.7",
      "libpython2.7-dev",
      "libpython2.7-minimal",
      "libpython2.7-stdlib",
      "libsqlite3-0",
      "linux-libc-dev",
      "mime-support",
      "python",
      "python-dev",
      "python-minimal",
      "python2.7",
      "python2.7-dev",
      "python2.7-minimal",
  ]

def _stretch_python_pip_package_names():
  return [
      "libexpat1",
      "libffi6",
      "libpython-stdlib",
      "libpython2.7-minimal",
      "libpython2.7-stdlib",
      "libsqlite3-0",
      "mime-support",
      "python",
      "python-chardet",
      "python-colorama",
      "python-distlib",
      "python-html5lib",
      "python-minimal",
      "python-pip",
      "python-pkg-resources",
      "python-requests",
      "python-setuptools",
      "python-six",
      "python-urllib3",
      "python2.7",
      "python2.7-minimal",
      "python-ipaddr",
      "python-six",
      "python-packaging",
      "python-pyparsing",
      "python-progress",
      "python-cachecontrol",
      "python-lockfile",
      "python-html5lib",
      "python-retrying",
      "python-webencodings",
      "python-distro",
  ]

def _stretch_python_numpy_package_names():
  return [
      "libblas-common",
      "libblas3",
      "libexpat1",
      "libffi6",
      "libgfortran3",
      "liblapack3",
      "libpython-stdlib",
      "libpython2.7-minimal",
      "libpython2.7-stdlib",
      "libquadmath0",
      "libsqlite3-0",
      "mime-support",
      "python",
      "python-minimal",
      "python-numpy",
      "python2.7",
      "python2.7-minimal",
  ]

def _stretch_wget_package_names():
  return [
      "libffi6",
      "libgmp10",
      "libgnutls30",
      "libhogweed4",
      "libicu57",
      "libidn11",
      "libnettle6",
      "libp11-kit0",
      "libpsl5",
      "libtasn1-6",
      "wget",
      # Needed for cert validation done by wget
      "ca-certificates",
      "libssl1.1",
      "openssl",
      "libidn2-0",
      "libunistring0",
  ]

def _zip_package_names():
  return [
      "zip",
      "unzip",
  ]
