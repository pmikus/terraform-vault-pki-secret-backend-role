resource "vault_mount" "pki" {
  default_lease_ttl_seconds = var.default_lease_ttl_seconds
  description               = var.description
  max_lease_ttl_seconds     = var.max_lease_ttl_seconds
  path                      = var.path
  type                      = var.type
}

resource "vault_pki_secret_backend_role" "role" {
  allow_ip_sans    = var.allow_ip_sans
  allowed_domains  = var.allowed_domains
  allow_localhost  = var.allow_localhost
  allow_subdomains = var.allow_subdomains
  backend          = vault_mount.pki.path
  key_bits         = var.key_bits
  key_type         = var.key_type
  name             = var.role
  ttl              = var.ttl
}