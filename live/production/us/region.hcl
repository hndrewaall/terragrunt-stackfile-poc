locals {
  # Though strictly speaking resources in this path are "region-less", a region still must be specified for use with the
  # provider and consistency to allow for consistent include logic in root.hcl
  region = "us-central1"
}
