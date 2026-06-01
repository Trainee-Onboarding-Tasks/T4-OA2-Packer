#!/bin/bash
set -e


systemctl daemon-reexec 
systemctl daemon-reload 
systemctl enable --now docker
