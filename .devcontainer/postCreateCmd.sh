#!/bin/sh

# -- Initialize git config
git config --global --add safe.directory /workspaces/Test_QSharp

# -- Install Q#
dotnet new -i Microsoft.Quantum.ProjectTemplates

# -- Then you need config on Terminal
# !!NOT HERE!!  git config --global user.name (-----)
# !!NOT HERE!!  git config --global user.email (-----)
