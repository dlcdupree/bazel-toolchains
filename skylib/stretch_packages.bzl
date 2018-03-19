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
"""packages.bzl contains definitions of functions that return packages.

Uses package_names.bzl to resolve packages needed for
tools installed in different containers.
"""

load(
    "@stretch_ca_certs_package_bundle//file:packages.bzl",
    ca_certs_packages = "packages",
)
load(
    "@stretch_package_bundle//file:packages.bzl",
    stretch_packages = "packages",
)
load(
    ":stretch_package_names.bzl",
    "tool_names",
    "stretch_tools",
)

def get_stretch_packages(pkg_list):
  """Common function for getting jessie packages."""
  return [stretch_packages[p] for p in pkg_list]

def base_layer_packages():
  """Base packages for fully loaded toolchain."""
  base_tools = [
      tool_names.binutils,
      tool_names.curl,
      tool_names.ed,
      tool_names.file,
      tool_names.git,
      tool_names.openssh_client,
      tool_names.wget,
      tool_names.zip,
  ]
  packages = []
  for tool in base_tools:
    packages.extend(get_stretch_packages(stretch_tools()[tool]))
  return depset(packages).to_list()

def clang_layer_packages():
  """Packages for the clang layer."""
  clang_tools = [
      tool_names.binutils,
      tool_names.lib_cpp,
  ]
  packages = []
  for tool in clang_tools:
    packages.extend(get_stretch_packages(stretch_tools()[tool]))
  return depset(packages).to_list()

def python_layer_packages():
  """Packages for the python layer."""
  python_tools = [
      tool_names.python_dev,
      tool_names.python_numpy,
      tool_names.python_pip,
      tool_names.python3_dev,
      tool_names.python3_numpy,
      tool_names.python3_pip,
  ]
  packages = []
  for tool in python_tools:
    packages.extend(get_stretch_packages(stretch_tools()[tool]))
  return depset(packages).to_list()

def java_layer_packages():
  """Packages for the java layer."""
  java_tools = [
      tool_names.java_no_ca_certs,
  ]
  packages = []
  for tool in java_tools:
    packages.extend(get_stretch_packages(stretch_tools()[tool]))
  packages.append(ca_certs_packages["ca-certificates-java"])
  return depset(packages).to_list()
