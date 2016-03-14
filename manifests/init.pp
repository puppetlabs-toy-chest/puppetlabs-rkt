# == Class: rkt
#
# Module to install and manage the rkt command line tools
#
# === Parameters
# [*version*]
#   What version of rkt to install
#
# [*ensure*]
#   Whether to install or uninstall the command line tools
#   Defaults to present, can also be set to absent
#
class rkt(
  $version = $rkt::params::version,
  $ensure = $rkt::params::ensure,
) inherits rkt::params {

  validate_string($version)
  validate_re($ensure, '^(present|absent)$')

  archive { "rkt-v${version}":
    ensure           => $ensure,
    target           => '/usr/local/src',
    checksum         => false,
    follow_redirects => true,
    src_target       => '/usr/local/src',
    url              => "https://github.com/coreos/rkt/releases/download/v${version}/rkt-v${version}.tar.gz",
  }

  if $ensure == 'present' {
    $file_ensure = 'link'
  } else {
    $file_ensure = $ensure
  }

  ensure_resource('group', 'rkt', {'ensure' => 'present' })

  file { '/usr/local/bin/rkt':
    ensure  => $file_ensure,
    target  => "/usr/local/src/rkt-v${version}/rkt",
    require => Archive["rkt-v${version}"],
  }
}
